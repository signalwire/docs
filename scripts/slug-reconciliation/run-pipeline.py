#!/usr/bin/env python3
"""Run the full slug reconciliation pipeline.

Steps:
  1. Fetch old sitemap slugs (fetch-old-sitemap.py)
  2. Reconcile against current Fern pages (reconcile-slugs.py)
  3. Content-match unmatched pages (match-unmatched-pages.py)
  4. Build unified redirect report (build-final-report.py)

Each step imports and calls the main() function from the corresponding script.
All intermediate and final files are written to the reports/ subdirectory.

Usage:
  python scripts/slug-reconciliation/run-pipeline.py              # run all 3 steps
  python scripts/slug-reconciliation/run-pipeline.py --skip-fetch  # skip sitemap fetch
"""

import argparse
import sys
import time
from pathlib import Path

# Ensure the scripts directory is importable
SCRIPT_DIR = Path(__file__).resolve().parent
REPORTS_DIR = SCRIPT_DIR / "reports"
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

# Lazy imports — done inside functions so module-level side effects
# (like multiprocessing pool setup) don't fire at import time.


def step_fetch():
    """Step 1: Fetch old sitemap and extract slugs."""
    import importlib
    mod = importlib.import_module("fetch-old-sitemap")
    saved = sys.argv[:]
    sys.argv = [sys.argv[0]]  # clear args so defaults apply
    try:
        mod.main()
    finally:
        sys.argv = saved


def step_reconcile():
    """Step 2: Reconcile old slugs against slug-proposals.csv."""
    import importlib
    mod = importlib.import_module("reconcile-slugs")
    saved = sys.argv[:]
    sys.argv = [sys.argv[0]]
    try:
        mod.main()
    finally:
        sys.argv = saved


def step_match():
    """Step 3: Content-match unmatched pages against Fern MDX files."""
    import importlib
    mod = importlib.import_module("match-unmatched-pages")
    saved = sys.argv[:]
    sys.argv = [sys.argv[0]]
    try:
        mod.main()
    finally:
        sys.argv = saved


def step_report():
    """Step 4: Build unified redirect report."""
    import importlib
    mod = importlib.import_module("build-final-report")
    saved = sys.argv[:]
    sys.argv = [sys.argv[0]]
    try:
        mod.main()
    finally:
        sys.argv = saved


STEPS = [
    ("Fetch old sitemap", step_fetch),
    ("Reconcile slugs", step_reconcile),
    ("Match unmatched pages", step_match),
    ("Build final report", step_report),
]


def main():
    parser = argparse.ArgumentParser(description="Run the slug reconciliation pipeline.")
    parser.add_argument("--skip-fetch", action="store_true",
                        help="Skip step 1 (reuse existing old-sitemap-slugs.json)")
    args = parser.parse_args()

    start_idx = 1 if args.skip_fetch else 0
    steps = STEPS[start_idx:]

    REPORTS_DIR.mkdir(exist_ok=True)

    print("=" * 60)
    print("Slug Reconciliation Pipeline")
    print("=" * 60)

    pipeline_start = time.time()

    for i, (name, fn) in enumerate(steps, 1):
        step_start = time.time()
        print(f"\n{'=' * 60}")
        print(f"Step {start_idx + i}/{len(STEPS)}: {name}")
        print("=" * 60 + "\n")

        fn()

        elapsed = time.time() - step_start
        print(f"\n  [{name} completed in {elapsed:.1f}s]")

    total_elapsed = time.time() - pipeline_start
    print(f"\n{'=' * 60}")
    print(f"Pipeline complete ({total_elapsed:.1f}s)")
    print("=" * 60)


if __name__ == "__main__":
    main()
