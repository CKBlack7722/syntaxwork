from __future__ import annotations

import argparse
import csv
from pathlib import Path


def text(value: object) -> str:
    return "" if value is None else str(value).strip()


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8-sig") as handle:
        return list(csv.DictReader(handle))


def main() -> None:
    parser = argparse.ArgumentParser(description="Merge standard and advanced questionnaire logic proposals for human review.")
    parser.add_argument("--standard", required=True, type=Path)
    parser.add_argument("--advanced", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    standard = read_csv(args.standard)
    advanced = read_csv(args.advanced)
    advanced_by_source = {text(row.get("source")): row for row in advanced if text(row.get("source"))}
    fields = [
        "status", "row", "qid", "direction", "條件", "應答", "不應答", "限制",
        "reason", "bracket", "text", "source", "rule_type", "advanced_condition",
        "spss_preview", "note",
    ]
    rows: list[dict[str, str]] = []
    for row in standard:
        source = text(row.get("source")) or text(row.get("text"))
        advanced_rule = advanced_by_source.get(source)
        if text(row.get("status")) == "review" and advanced_rule:
            rows.append(
                {
                    **row,
                    "status": "resolved_advanced",
                    "source": source,
                    "reason": "resolved by advanced rule",
                    "rule_type": text(advanced_rule.get("rule_type")),
                    "advanced_condition": text(advanced_rule.get("condition")),
                    "spss_preview": text(advanced_rule.get("spss_preview")),
                    "note": text(advanced_rule.get("note")),
                }
            )
        else:
            rows.append({**row, "source": source})
    for rule in advanced:
        rows.append(
            {
                "status": "proposal_advanced",
                "qid": text(rule.get("qid")),
                "source": text(rule.get("source")),
                "rule_type": text(rule.get("rule_type")),
                "advanced_condition": text(rule.get("condition")),
                "spss_preview": text(rule.get("spss_preview")),
                "應答": text(rule.get("required")),
                "不應答": text(rule.get("forbidden")),
                "note": text(rule.get("note")),
            }
        )
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open("w", newline="", encoding="utf-8-sig") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)
    unresolved = sum(1 for row in rows if text(row.get("status")) == "review")
    print({"rows": len(rows), "unresolved_review": unresolved, "advanced": len(advanced)})


if __name__ == "__main__":
    main()
