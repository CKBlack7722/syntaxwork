from __future__ import annotations

import argparse
import csv
import json
import subprocess
import sys
from datetime import datetime
from pathlib import Path
from typing import Any

import openpyxl


ROOT = Path(__file__).resolve().parents[2]
TOOLS = Path(__file__).resolve().parent


PROJECTS = {
    "消費者": {
        "folder": ROOT / "消費者",
        "workbook": ROOT / "消費者" / "檢核程式套印-台灣消費者.xlsx",
        "docx": ROOT / "消費者" / "問卷_第一期.docx",
        "reference_syntax": ROOT / "消費者" / "1資料處理及檢核.sps",
    },
    "消費者2": {
        "folder": ROOT / "消費者2",
        "workbook": ROOT / "消費者2" / "檢核程式套印-台灣消費者2.xlsx",
        "docx": ROOT / "消費者2" / "2026年6月問卷題目0604_網路.docx",
        "reference_syntax": ROOT / "消費者2" / "01資料處理檢核_第二期.sps",
    },
    "淨零": {
        "folder": ROOT / "淨零",
        "workbook": ROOT / "淨零" / "檢核程式套印-淨零.xlsx",
        "docx": ROOT / "淨零" / "2025 淨零與能源安全問卷_問卷0511.docx",
        "reference_syntax": ROOT / "淨零" / "1資料處理及檢核_淨零.sps",
    },
}


def run_command(args: list[str], cwd: Path = ROOT) -> dict[str, Any]:
    proc = subprocess.run(args, cwd=str(cwd), text=True, capture_output=True, timeout=120)
    return {
        "args": args,
        "returncode": proc.returncode,
        "stdout": proc.stdout.strip(),
        "stderr": proc.stderr.strip(),
    }


def has_sheet(workbook_path: Path, sheet_name: str) -> bool:
    wb = openpyxl.load_workbook(workbook_path, read_only=True, data_only=True)
    return sheet_name in wb.sheetnames


def read_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def read_numeric_summary(path: Path) -> dict[str, Any]:
    rows = list(csv.DictReader(path.open(encoding="utf-8-sig")))
    counts: dict[str, int] = {}
    for row in rows:
        counts[row["compare_status"]] = counts.get(row["compare_status"], 0) + 1
    return {"rows": len(rows), "compare_status": counts}


def read_status_summary(path: Path) -> dict[str, Any]:
    rows = list(csv.DictReader(path.open(encoding="utf-8-sig")))
    counts: dict[str, int] = {}
    for row in rows:
        counts[row["status"]] = counts.get(row["status"], 0) + 1
    return {"rows": len(rows), "status": counts}


def run_project(
    name: str,
    config: dict[str, Path],
    date_start: str | None = None,
    date_end: str | None = None,
) -> dict[str, Any]:
    folder = config["folder"]
    generated = folder / "generated"
    generated.mkdir(exist_ok=True)
    workbook = config["workbook"]
    docx = config["docx"]
    reference = config["reference_syntax"]
    commands: list[dict[str, Any]] = []
    sections: list[Path] = []
    unresolved: list[dict[str, str]] = []

    precheck_csv = generated / "excel_precheck.csv"
    precheck_report = generated / "excel_precheck_report.json"
    commands.append(
        run_command(
            [
                sys.executable,
                str(TOOLS / "validate_excel_structure.py"),
                "--project",
                name,
                "--workbook",
                str(workbook),
                "--output-csv",
                str(precheck_csv),
                "--report",
                str(precheck_report),
            ]
        )
    )
    if commands[-1]["returncode"] != 0:
        unresolved.append({"area": "excel_precheck", "message": "Workbook precheck reported errors; review excel_precheck.csv before final SPSS conversion."})

    numeric_csv = generated / "numeric_range_proposals.csv"
    numeric_report = generated / "numeric_range_proposals_report.json"
    numeric_cmd = [
        sys.executable,
        str(TOOLS / "generate_numeric_range_proposals.py"),
        "--workbook",
        str(workbook),
        "--docx",
        str(docx),
        "--output-csv",
        str(numeric_csv),
        "--report",
        str(numeric_report),
    ]
    if date_start or date_end:
        numeric_cmd.extend(["--date-start", date_start or "", "--date-end", date_end or ""])
    commands.append(
        run_command(numeric_cmd)
    )

    numeric_spss_csv = generated / "numeric_spss_field_proposals.csv"
    numeric_spss_report = generated / "numeric_spss_field_proposals_report.json"
    commands.append(
        run_command(
            [
                sys.executable,
                str(TOOLS / "generate_numeric_spss_field_proposals.py"),
                "--workbook",
                str(workbook),
                "--docx",
                str(docx),
                "--output-csv",
                str(numeric_spss_csv),
                "--report",
                str(numeric_spss_report),
            ]
        )
    )

    open_csv = generated / "open_field_proposals.csv"
    open_report = generated / "open_field_proposals_report.json"
    commands.append(
        run_command(
            [
                sys.executable,
                str(TOOLS / "generate_open_field_proposals.py"),
                "--workbook",
                str(workbook),
                "--docx",
                str(docx),
                "--output-csv",
                str(open_csv),
                "--report",
                str(open_report),
            ]
        )
    )

    multi_sps = generated / "multi_checks_generated.sps"
    multi_report = generated / "multi_checks_report.json"
    multi_compare = generated / "multi_checks_compare.json"
    commands.append(
        run_command(
            [
                sys.executable,
                str(TOOLS / "generate_multi_checks.py"),
                "--workbook",
                str(workbook),
                "--output",
                str(multi_sps),
                "--report",
                str(multi_report),
                "--reference-syntax",
                str(reference),
                "--compare-output",
                str(multi_compare),
            ]
        )
    )
    if commands[-1]["returncode"] == 0 and multi_sps.exists():
        sections.append(multi_sps)
    else:
        unresolved.append({"area": "multi", "message": "Multi-select generation failed or did not produce an output file."})

    logic_sps = generated / "logic_checks_generated.sps"
    logic_report = generated / "logic_checks_report.txt"
    if has_sheet(workbook, "邏輯組"):
        logic_command = run_command(
            [
                sys.executable,
                str(TOOLS / "generate_logic_checks.py"),
                "--workbook",
                str(workbook),
                "--existing-sps",
                str(reference),
                "--output",
                str(logic_sps),
                "--report",
                str(logic_report),
            ]
        )
        commands.append(logic_command)
        if logic_command["returncode"] == 0 and logic_sps.exists():
            static_command = run_command(
                [
                    sys.executable,
                    str(TOOLS / "static_check_generated_logic.py"),
                    "--syntax",
                    str(logic_sps),
                ]
            )
            commands.append(static_command)
            if static_command["returncode"] == 0:
                sections.insert(0, logic_sps)
            else:
                unresolved.append({"area": "logic", "message": "Logic syntax was generated but did not pass static checks."})
        else:
            unresolved.append({"area": "logic", "message": "Logic generation failed or did not produce an output file."})
    else:
        unresolved.append({"area": "logic", "message": "Workbook has no 邏輯組 sheet; skipped logic generation."})

    combined = generated / "all_checks_generated.sps"
    if sections:
        cmd = [sys.executable, str(TOOLS / "build_spss_checks.py"), "--output", str(combined)]
        for section in sections:
            cmd.extend(["--section", str(section)])
        commands.append(run_command(cmd))

    unresolved.extend(
        [
            {
                "area": "word_to_logic",
                "message": "Direct Word-to-邏輯組 generation is not implemented yet; current logic generation uses Excel 邏輯組.",
            },
            {
                "area": "word_to_open_fields",
                "message": "Direct Word-to-開放欄位 generation is not implemented yet; current pipeline only records this gap.",
            },
            {
                "area": "numeric_to_spss",
                "message": "Numeric SPSS syntax generation is not yet combined; current pipeline generates r1-r4 proposals for review.",
            },
        ]
    )

    result: dict[str, Any] = {
        "project": name,
        "commands": commands,
        "outputs": {
            "numeric_csv": str(numeric_csv),
            "numeric_report": str(numeric_report),
            "numeric_spss_csv": str(numeric_spss_csv),
            "numeric_spss_report": str(numeric_spss_report),
            "precheck_csv": str(precheck_csv),
            "precheck_report": str(precheck_report),
            "open_csv": str(open_csv),
            "open_report": str(open_report),
            "multi_sps": str(multi_sps),
            "multi_report": str(multi_report),
            "multi_compare": str(multi_compare),
            "logic_sps": str(logic_sps) if logic_sps.exists() else "",
            "logic_report": str(logic_report) if logic_report.exists() else "",
            "combined_sps": str(combined) if combined.exists() else "",
        },
        "unresolved": unresolved,
    }
    if numeric_csv.exists():
        result["numeric_summary"] = read_numeric_summary(numeric_csv)
    if numeric_spss_csv.exists():
        result["numeric_spss_summary"] = read_status_summary(numeric_spss_csv)
    if precheck_report.exists():
        result["precheck_summary"] = read_json(precheck_report).get("summary", {})
    if open_csv.exists():
        result["open_summary"] = read_status_summary(open_csv)
    if multi_report.exists():
        result["multi_summary"] = read_json(multi_report)
    return result


def write_mismatch_review(project_results: list[dict[str, Any]], output: Path) -> None:
    output.parent.mkdir(exist_ok=True)
    with output.open("w", newline="", encoding="utf-8-sig") as handle:
        writer = csv.writer(handle)
        writer.writerow(
            [
                "project",
                "var",
                "status",
                "existing_r1",
                "existing_r2",
                "existing_r3",
                "existing_r4",
                "proposed_r1",
                "proposed_r2",
                "proposed_r3",
                "proposed_r4",
                "confidence",
                "source",
                "mismatch_reason",
                "note",
                "matched_question",
                "question_excerpt",
            ]
        )
        for result in project_results:
            csv_path = Path(result["outputs"]["numeric_csv"])
            if not csv_path.exists():
                continue
            for row in csv.DictReader(csv_path.open(encoding="utf-8-sig")):
                if row["compare_status"] != "match":
                    writer.writerow(
                        [
                            result["project"],
                            row["var"],
                            row["compare_status"],
                            row["existing_r1"],
                            row["existing_r2"],
                            row["existing_r3"],
                            row["existing_r4"],
                            row["proposed_r1"],
                            row["proposed_r2"],
                            row["proposed_r3"],
                            row["proposed_r4"],
                            row["confidence"],
                            row["source"],
                            row["mismatch_reason"],
                            row["note"],
                            row["matched_question"],
                            row["question_excerpt"],
                        ]
                    )


def write_open_field_review(project_results: list[dict[str, Any]], output: Path) -> None:
    output.parent.mkdir(exist_ok=True)
    with output.open("w", newline="", encoding="utf-8-sig") as handle:
        writer = csv.writer(handle)
        writer.writerow(
            [
                "project",
                "var",
                "status",
                "qid",
                "qvar",
                "option_value",
                "is_multi",
                "confidence",
                "source",
                "mismatch_reason",
                "note",
                "matched_existing_var",
                "question_excerpt",
            ]
        )
        for result in project_results:
            csv_path = Path(result["outputs"]["open_csv"])
            if not csv_path.exists():
                continue
            for row in csv.DictReader(csv_path.open(encoding="utf-8-sig")):
                if row["status"] != "match":
                    writer.writerow(
                        [
                            result["project"],
                            row["var"],
                            row["status"],
                            row["qid"],
                            row["qvar"],
                            row["option_value"],
                            row["is_multi"],
                            row["confidence"],
                            row["source"],
                            row["mismatch_reason"],
                            row["note"],
                            row["matched_existing_var"],
                            row["question_excerpt"],
                        ]
                    )


def write_numeric_spss_field_review(project_results: list[dict[str, Any]], output: Path) -> None:
    output.parent.mkdir(exist_ok=True)
    with output.open("w", newline="", encoding="utf-8-sig") as handle:
        writer = csv.writer(handle)
        writer.writerow(
            [
                "project",
                "row",
                "var",
                "status",
                "mismatch_reason",
                "existing_in_or_not",
                "proposed_in_or_not",
                "existing_range",
                "proposed_range",
                "alternative_range",
                "existing_decimal_check",
                "proposed_decimal_check",
                "decimal_note",
                "question_excerpt",
            ]
        )
        for result in project_results:
            csv_path = Path(result["outputs"]["numeric_spss_csv"])
            if not csv_path.exists():
                continue
            for row in csv.DictReader(csv_path.open(encoding="utf-8-sig")):
                if row["status"] != "match":
                    writer.writerow(
                        [
                            result["project"],
                            row["row"],
                            row["var"],
                            row["status"],
                            row["mismatch_reason"],
                            row["existing_in_or_not"],
                            row["proposed_in_or_not"],
                            row["existing_range"],
                            row["proposed_range"],
                            row["alternative_range"],
                            row["existing_decimal_check"],
                            row["proposed_decimal_check"],
                            row["decimal_note"],
                            row["question_excerpt"],
                        ]
                    )


def main() -> int:
    parser = argparse.ArgumentParser(description="Run the survey check generation pipeline for baseline projects.")
    parser.add_argument("--project", action="append", choices=sorted(PROJECTS), help="Project to run. Defaults to all baseline projects.")
    parser.add_argument("--output", type=Path, default=ROOT / "generated" / "pipeline_run_report.json")
    parser.add_argument("--date-start", default=None, help="Default date range start for width-14 numeric datetime variables.")
    parser.add_argument("--date-end", default=None, help="Default date range end for width-14 numeric datetime variables.")
    args = parser.parse_args()

    names = args.project or list(PROJECTS)
    results = [run_project(name, PROJECTS[name], args.date_start, args.date_end) for name in names]

    completeness_json = ROOT / "generated" / "questionnaire_completeness_report.json"
    completeness_csv = ROOT / "generated" / "questionnaire_completeness_report.csv"
    cmd = [sys.executable, str(TOOLS / "compare_questionnaire_completeness.py")]
    for name in names:
        config = PROJECTS[name]
        cmd.extend(["--project", name, str(config["workbook"]), str(config["docx"])])
    cmd.extend(["--output-json", str(completeness_json), "--output-csv", str(completeness_csv)])
    completeness_command = run_command(cmd)

    mismatch_review = ROOT / "generated" / "numeric_range_mismatch_review.csv"
    write_mismatch_review(results, mismatch_review)
    open_review = ROOT / "generated" / "open_field_mismatch_review.csv"
    write_open_field_review(results, open_review)
    numeric_spss_review = ROOT / "generated" / "numeric_spss_field_review.csv"
    write_numeric_spss_field_review(results, numeric_spss_review)

    report = {
        "run_at": datetime.now().isoformat(timespec="seconds"),
        "projects": results,
        "global_outputs": {
            "questionnaire_completeness_json": str(completeness_json),
            "questionnaire_completeness_csv": str(completeness_csv),
            "numeric_mismatch_review": str(mismatch_review),
            "open_field_mismatch_review": str(open_review),
            "numeric_spss_field_review": str(numeric_spss_review),
        },
        "global_commands": [completeness_command],
    }
    args.output.parent.mkdir(exist_ok=True)
    args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")

    for result in results:
        print(result["project"], result.get("numeric_summary", {}), result.get("open_summary", {}))
    print(f"report: {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
