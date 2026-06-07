from __future__ import annotations

from pathlib import Path

import spss


ROOT = Path(__file__).resolve().parents[1]
GENERATED_SYNTAX = ROOT / "generated" / "generated_logic_checks.sps"


def main() -> None:
    logic_syntax = GENERATED_SYNTAX.read_text(encoding="utf-8")
    setup_syntax = r"""
NEW FILE.

INPUT PROGRAM.
NUMERIC
  b v33_1 v33_2 v33_3 v33_4 v33_5
  v50 v51 v57 v58 v70 v71_1 vZ2city vZ3city
  (F14.0).
STRING v71_2s1 v71_2s2 v71_2s3 v71_2s4 (A3).
STRING
  m350 m351 m352 m353 m354 m355 m356 m357 m358 m359
  m360 m361 m362 m363 m364 m365 m366 m367 m368 m369
  (A500).
STRING
  p350 p351 p352 p353 p354 p355 p356 p357 p358 p359
  p360 p361 p362 p363 p364 p365 p366 p367 p368 p369
  (A500).
END CASE.
COMPUTE b=1.
COMPUTE v33_1=96.
COMPUTE v33_2=96.
COMPUTE v33_3=96.
COMPUTE v33_4=96.
COMPUTE v33_5=96.
COMPUTE v50=4.
COMPUTE v51=96.
COMPUTE v57=3.
COMPUTE v58=96.
COMPUTE v70=1.
COMPUTE v71_1=96.
COMPUTE vZ2city=96.
COMPUTE vZ3city=96.
COMPUTE v71_2s1="96".
COMPUTE v71_2s2="96".
COMPUTE v71_2s3="96".
COMPUTE v71_2s4="96".
END FILE.
END INPUT PROGRAM.
EXECUTE.
"""
    teardown_syntax = r"""
EXECUTE.
DISPLAY DICTIONARY.
"""
    spss.Submit(setup_syntax)
    spss.Submit(logic_syntax)
    spss.Submit(teardown_syntax)
    print("SPSS syntax validation completed.")


if __name__ == "__main__":
    main()
