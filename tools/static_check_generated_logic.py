from __future__ import annotations

import argparse
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--syntax", default=str(ROOT / "generated" / "generated_logic_checks.sps"))
    args = parser.parse_args()
    syntax_path = Path(args.syntax)
    text = syntax_path.read_text(encoding="utf-8")
    lines = [line.strip() for line in text.splitlines() if line.strip()]
    m_commands: list[str] = []
    p_commands: list[str] = []
    current: list[str] = []
    for line in lines:
        lower = line.lower()
        if lower.startswith("compute m") or current:
            current.append(line)
            if line.endswith("."):
                command = " ".join(current)
                if command.lower().startswith("compute m"):
                    m_commands.append(command)
                current = []
        if lower.startswith("compute p"):
            p_commands.append(line)

    do_if_lines = [line for line in lines if line.lower().startswith("do if ")]
    logic_do_if_lines = [line for line in do_if_lines if "!i" not in line]
    m_lines = m_commands
    p_lines = p_commands
    end_if_lines = [line for line in lines if line.lower() == "end if."]
    logic_end_if_count = len(end_if_lines)

    errors: list[str] = []
    if len(logic_do_if_lines) != len(m_lines):
        errors.append(f"do if count {len(logic_do_if_lines)} != compute m count {len(m_lines)}")
    if len(logic_do_if_lines) != len(p_lines):
        errors.append(f"do if count {len(logic_do_if_lines)} != compute p count {len(p_lines)}")
    if len(logic_do_if_lines) != logic_end_if_count:
        errors.append(f"do if count {len(logic_do_if_lines)} != logic end if count {logic_end_if_count}")

    m_ids = [re.match(r"compute\s+m(\d+)=", line, flags=re.I).group(1) for line in m_lines]
    p_ids = [re.match(r"compute\s+p(\d+)=", line, flags=re.I).group(1) for line in p_lines]
    if m_ids != p_ids:
        errors.append("m/p ids are not aligned")

    for line in m_lines:
        if line.count("(") != line.count(")"):
            errors.append(f"unbalanced parentheses: {line}")
        if '",in="' in line:
            errors.append(f"reserved word in was emitted as a display variable: {line}")

    if errors:
        print("STATIC CHECK FAILED")
        for error in errors:
            print(f"- {error}")
        raise SystemExit(1)

    print("STATIC CHECK PASSED")
    print(f"logic do if: {len(logic_do_if_lines)}")
    print(f"compute m: {len(m_lines)}")
    print(f"compute p: {len(p_lines)}")
    print(f"m/p ids: {m_ids[0]}-{m_ids[-1]}")


if __name__ == "__main__":
    main()
