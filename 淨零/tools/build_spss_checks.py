from __future__ import annotations

import argparse
from pathlib import Path


def read_section(path: Path) -> str:
    text = path.read_text(encoding="utf-8-sig", errors="replace").strip()
    return text


def main() -> int:
    parser = argparse.ArgumentParser(description="Combine generated SPSS check sections into one syntax file.")
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--section", action="append", default=[], type=Path, help="Generated section file. Repeat in final order.")
    args = parser.parse_args()

    parts: list[str] = [
        "* Encoding: UTF-8.",
        "* Generated survey check syntax.",
        "* Sections are generated separately, then combined here in execution order.",
    ]
    for section in args.section:
        if not section.exists():
            raise FileNotFoundError(section)
        content = read_section(section)
        if content:
            parts.append(content)

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text("\n\n".join(parts).rstrip() + "\n", encoding="utf-8-sig")
    print(f"sections: {len(args.section)}")
    print(f"output: {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
