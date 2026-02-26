#!/usr/bin/env python3
"""Trace orphan report IDs through git history.

Finds doc_ids in final-manual-report.csv that don't match any file on disk,
then runs `git log -S <id>` for each to determine what happened to it.

Runs all git lookups in parallel via thread pool.

Output:
  reports/orphan-ids-traced.csv
"""

import csv
import subprocess
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

import frontmatter

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
PRODUCTS_DIR = PROJECT_ROOT / "fern" / "products"
REPORTS_DIR = SCRIPT_DIR / "reports"
REPORT_CSV = SCRIPT_DIR / "manually_edited_reports" / "final-manual-report.csv"


def trace_id(doc_id):
    """Run git log -S to find commits that added/removed this ID.

    Returns dict with trace results.
    """
    try:
        result = subprocess.run(
            ["git", "log", "--all", "--pretty=format:%H|%ai|%s",
             "-S", doc_id, "--", "*.mdx"],
            capture_output=True, timeout=30,
            cwd=str(PROJECT_ROOT),
            encoding="utf-8", errors="replace",
        )
        log_lines = [l.strip() for l in result.stdout.strip().split("\n") if l.strip()]
    except Exception as e:
        return {
            "doc_id": doc_id,
            "status": "error",
            "error": str(e),
            "added_commit": "",
            "added_date": "",
            "added_message": "",
            "deleted_commit": "",
            "deleted_date": "",
            "deleted_message": "",
            "original_file": "",
            "deleted_file": "",
        }

    if not log_lines:
        return {
            "doc_id": doc_id,
            "status": "never_existed",
            "error": "",
            "added_commit": "",
            "added_date": "",
            "added_message": "",
            "deleted_commit": "",
            "deleted_date": "",
            "deleted_message": "",
            "original_file": "",
            "deleted_file": "",
        }

    # Commits are newest-first. The last one is the add, the first is the most recent change.
    commits = []
    for line in log_lines:
        parts = line.split("|", 2)
        if len(parts) == 3:
            commits.append({"hash": parts[0], "date": parts[1], "message": parts[2]})

    added = commits[-1] if commits else {}
    latest = commits[0] if commits else {}

    # Find which file the ID was in — check the added commit
    original_file = ""
    deleted_file = ""
    if added:
        original_file = _find_file_in_commit(added["hash"], doc_id)
    if latest and latest != added:
        deleted_file = _find_file_in_commit(latest["hash"], doc_id)

    # Determine status
    if len(commits) == 1:
        # Only one commit — ID was added and still present (shouldn't be orphan, but possible)
        status = "added_only"
    else:
        # Check if the latest commit deleted the file
        status = "deleted"

    return {
        "doc_id": doc_id,
        "status": status,
        "error": "",
        "added_commit": added.get("hash", "")[:12],
        "added_date": added.get("date", ""),
        "added_message": added.get("message", ""),
        "deleted_commit": latest.get("hash", "")[:12] if latest != added else "",
        "deleted_date": latest.get("date", "") if latest != added else "",
        "deleted_message": latest.get("message", "") if latest != added else "",
        "original_file": original_file,
        "deleted_file": deleted_file or original_file,
    }


def _find_file_in_commit(commit_hash, doc_id):
    """Find which file in a commit contains/contained the doc_id."""
    try:
        result = subprocess.run(
            ["git", "diff-tree", "--no-commit-id", "-r", "--name-status", commit_hash],
            capture_output=True, timeout=15,
            cwd=str(PROJECT_ROOT),
            encoding="utf-8", errors="replace",
        )
        # Look for .mdx files that were added, deleted, or modified
        for line in result.stdout.strip().split("\n"):
            if not line.strip():
                continue
            parts = line.split("\t", 1)
            if len(parts) == 2 and parts[1].endswith(".mdx"):
                # Verify this file actually has the ID
                status_char = parts[0][0]
                filepath = parts[1]
                if _file_has_id_in_commit(commit_hash, filepath, doc_id, status_char):
                    return filepath
    except Exception:
        pass
    return ""


def _file_has_id_in_commit(commit_hash, filepath, doc_id, status_char):
    """Check if a file in a specific commit contains the doc_id."""
    # For deleted files, check the parent commit; for added, check the commit itself
    if status_char == "D":
        ref = f"{commit_hash}^:{filepath}"
    else:
        ref = f"{commit_hash}:{filepath}"
    try:
        result = subprocess.run(
            ["git", "show", ref],
            capture_output=True, timeout=10,
            cwd=str(PROJECT_ROOT),
            encoding="utf-8", errors="replace",
        )
        return doc_id in result.stdout
    except Exception:
        return False


def collect_filesystem_ids():
    """Scan all MDX pages and return a set of doc_ids on disk."""
    ids = set()
    for mdx_path in PRODUCTS_DIR.rglob("*.mdx"):
        parts = mdx_path.relative_to(PRODUCTS_DIR).parts
        if "pages" not in parts:
            continue
        raw = mdx_path.read_bytes()
        if raw.startswith(b"\xef\xbb\xbf"):
            raw = raw[3:]
        text = raw.decode("utf-8")
        if not text.startswith("---"):
            continue
        try:
            post = frontmatter.loads(text)
        except Exception:
            continue
        doc_id = str(post.metadata.get("id", "")).strip()
        if doc_id:
            ids.add(doc_id)
    return ids


def find_orphan_rows(report_csv, fs_ids):
    """Find report rows whose doc_id doesn't match any file on disk.

    Returns list of orphan row dicts (deduplicated by doc_id).
    """
    orphans = []
    seen = set()

    with open(report_csv, newline="", encoding="utf-8-sig") as f:
        for row in csv.DictReader(f):
            doc_id = (row.get("doc_id") or "").strip()
            if not doc_id or doc_id in fs_ids or doc_id in seen:
                continue
            seen.add(doc_id)
            orphans.append({
                "doc_id": doc_id,
                "fern_file": (row.get("fern_file") or "").strip(),
                "cur_full_url": (row.get("cur_full_url") or "").strip(),
                "old_url": (row.get("old_url") or "").strip(),
                "action": (row.get("action") or "").strip(),
                "category": (row.get("category") or "").strip(),
            })

    return orphans


def main():
    # Step 1 — Find orphan IDs
    print("Scanning filesystem for page IDs...")
    fs_ids = collect_filesystem_ids()
    print(f"  {len(fs_ids)} IDs on disk")

    print(f"Loading report: {REPORT_CSV.relative_to(SCRIPT_DIR)}")
    orphans = find_orphan_rows(REPORT_CSV, fs_ids)
    print(f"  {len(orphans)} orphan doc_ids (in report, no file on disk)")

    if not orphans:
        print("No orphans found.")
        return

    # Step 2 — Trace each orphan through git history
    doc_ids = [r["doc_id"] for r in orphans]
    print(f"Tracing {len(doc_ids)} orphan IDs through git history...")

    results = {}
    with ThreadPoolExecutor(max_workers=16) as pool:
        futures = {pool.submit(trace_id, did): did for did in doc_ids}
        done = 0
        for future in as_completed(futures):
            done += 1
            doc_id = futures[future]
            try:
                results[doc_id] = future.result()
            except Exception as e:
                results[doc_id] = {"doc_id": doc_id, "status": "error", "error": str(e)}
            if done % 20 == 0 or done == len(doc_ids):
                print(f"  {done}/{len(doc_ids)} completed")

    # Step 3 — Merge orphan report info with trace results
    output_rows = []
    for orphan in orphans:
        doc_id = orphan["doc_id"]
        trace = results.get(doc_id, {})
        output_rows.append({
            "doc_id": doc_id,
            "fern_file": orphan.get("fern_file", ""),
            "cur_full_url": orphan.get("cur_full_url", ""),
            "old_url": orphan.get("old_url", ""),
            "action": orphan.get("action", ""),
            "category": orphan.get("category", ""),
            "status": trace.get("status", "unknown"),
            "original_file": trace.get("original_file", ""),
            "deleted_file": trace.get("deleted_file", ""),
            "added_commit": trace.get("added_commit", ""),
            "added_date": trace.get("added_date", ""),
            "added_message": trace.get("added_message", ""),
            "deleted_commit": trace.get("deleted_commit", ""),
            "deleted_date": trace.get("deleted_date", ""),
            "deleted_message": trace.get("deleted_message", ""),
            "error": trace.get("error", ""),
        })

    # Write output
    REPORTS_DIR.mkdir(parents=True, exist_ok=True)
    output_csv = REPORTS_DIR / "orphan-ids-traced.csv"
    fieldnames = [
        "doc_id", "fern_file", "cur_full_url", "old_url", "action", "category",
        "status", "original_file", "deleted_file",
        "added_commit", "added_date", "added_message",
        "deleted_commit", "deleted_date", "deleted_message", "error",
    ]
    with open(output_csv, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fieldnames)
        w.writeheader()
        w.writerows(output_rows)

    # Summary
    by_status = {}
    for r in output_rows:
        s = r["status"]
        by_status.setdefault(s, []).append(r)

    print()
    print("=== Orphan ID Trace Results ===")
    print()
    for status in sorted(by_status):
        print(f"  {status}: {len(by_status[status])}")
    print()
    print(f"Output: {output_csv.relative_to(SCRIPT_DIR)}")


if __name__ == "__main__":
    main()
