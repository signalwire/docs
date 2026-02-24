#!/usr/bin/env python3
"""Trace deleted pages through git history to find merge destinations.

For each entry in new_known_deleted.csv that lacks moved_to info,
inspects the deletion commit to find if the doc's id appeared in any
file that was added or modified in the same commit.

Outputs an updated copy of new_known_deleted.csv with moved_to fields
populated where git history reveals the destination.
"""

import csv
import re
import subprocess
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
DELETIONS_DIR = SCRIPT_DIR / "deletions"
KNOWN_DELETED = DELETIONS_DIR / "new_known_deleted.csv"
OUTPUT = DELETIONS_DIR / "new_known_deleted_traced.csv"

# Cache: commit -> {added/modified files}
_commit_am_files = {}
# Cache: commit -> {file_path -> content}
_commit_file_contents = {}


def git(*args, **kwargs):
    """Run a git command and return stdout (always from repo root)."""
    result = subprocess.run(
        ["git"] + list(args),
        capture_output=True, text=True, encoding="utf-8", errors="replace",
        cwd=PROJECT_ROOT,
        **kwargs
    )
    return result.stdout


def get_added_modified_files(commit):
    """Get files added or modified in a commit (under fern/products/)."""
    if commit in _commit_am_files:
        return _commit_am_files[commit]

    # Handle merge commits: use diff against first parent
    out = git("diff-tree", "--no-commit-id", "-r", "--diff-filter=AM", commit, "--", "fern/products/")
    files = []
    for line in out.strip().split("\n"):
        if not line:
            continue
        # Format: :old_mode new_mode old_hash new_hash status\tpath
        parts = line.split("\t")
        if len(parts) >= 2:
            files.append(parts[1])

    _commit_am_files[commit] = files
    return files


def get_file_at_commit(commit, filepath):
    """Get file content at a specific commit."""
    key = (commit, filepath)
    if key in _commit_file_contents:
        return _commit_file_contents[key]

    content = git("show", f"{commit}:{filepath}")
    _commit_file_contents[key] = content
    return content


def get_file_before_commit(commit, filepath):
    """Get file content from the commit's parent (before deletion)."""
    return get_file_at_commit(f"{commit}~1", filepath)


def extract_id_from_content(content):
    """Extract the frontmatter id from file content."""
    # Match id in YAML frontmatter
    m = re.search(r'^id:\s*([a-f0-9-]{36})', content, re.MULTILINE)
    if m:
        return m.group(1)
    return ""


def search_id_in_commit_files(commit, doc_id, exclude_path=None):
    """Search for a doc_id in all added/modified files of a commit.

    Returns the file path where the id was found, or empty string.
    """
    if not doc_id:
        return ""

    am_files = get_added_modified_files(commit)
    for fpath in am_files:
        if fpath == exclude_path:
            continue
        if not fpath.endswith((".mdx", ".md")):
            continue
        content = get_file_at_commit(commit, fpath)
        if doc_id in content:
            return fpath

    return ""


def compute_slug_from_dest(dest_path):
    """Derive a slug from a destination fern file path.

    e.g. fern/products/platform/pages/ai/overview.mdx -> /platform/ai
    """
    # Strip fern/products/ prefix
    p = dest_path
    if p.startswith("fern/products/"):
        p = p[len("fern/products/"):]

    parts = p.split("/")
    # Strip product/pages/ prefix
    if len(parts) >= 2 and parts[1] == "pages":
        product = parts[0]
        rest = parts[2:]
    else:
        return ""

    # Strip index.mdx
    if rest and rest[-1] in ("index.mdx", "index.md"):
        rest = rest[:-1]
    elif rest:
        rest[-1] = re.sub(r'\.mdx?$', '', rest[-1])

    slug = "/" + product + "/" + "/".join(rest) if rest else "/" + product
    return slug


def extract_dest_id(commit, dest_path):
    """Extract the doc_id from a destination file."""
    content = get_file_at_commit(commit, dest_path)
    return extract_id_from_content(content)


def main():
    with open(KNOWN_DELETED, newline="", encoding="utf-8") as f:
        rows = list(csv.DictReader(f))

    fields = list(rows[0].keys()) if rows else []

    needs_trace = [r for r in rows if r.get("moved_to_slug", "N/A") == "N/A"]
    already_has = [r for r in rows if r.get("moved_to_slug", "N/A") != "N/A"]
    print(f"Total entries: {len(rows)}")
    print(f"  Already have moved_to: {len(already_has)}")
    print(f"  Need tracing: {len(needs_trace)}")

    # Group by commit for efficiency
    by_commit = {}
    for r in needs_trace:
        commit = r["commit"]
        by_commit.setdefault(commit, []).append(r)

    found = 0
    not_found = 0

    for commit, entries in sorted(by_commit.items(), key=lambda x: -len(x[1])):
        print(f"\nProcessing commit {commit} ({len(entries)} entries)...")

        # Pre-fetch the list of added/modified files once per commit
        am_files = get_added_modified_files(commit)
        print(f"  Added/modified files in commit: {len(am_files)}")

        for entry in entries:
            doc_id = entry["id"]
            deleted_path = entry["path"]

            # Normalize path for git (strip leading fern/ if needed for git show)
            git_path = deleted_path

            # Search for the id in added/modified files
            dest_path = search_id_in_commit_files(commit, doc_id, exclude_path=git_path)

            if dest_path:
                dest_slug = compute_slug_from_dest(dest_path)
                dest_id = extract_dest_id(commit, dest_path)

                entry["moved_to_slug"] = dest_slug
                entry["moved_to_path"] = dest_path
                entry["moved_to_id"] = dest_id if dest_id and dest_id != doc_id else "N/A"

                found += 1
                print(f"  FOUND: {entry['slug']}")
                print(f"    -> {dest_path} (slug: {dest_slug})")
            else:
                not_found += 1

    print(f"\n--- Results ---")
    print(f"  Found destination: {found}")
    print(f"  No destination:    {not_found}")
    print(f"  Already had moved_to: {len(already_has)}")

    # Write output
    with open(OUTPUT, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        w.writerows(rows)

    print(f"\nWritten to: {OUTPUT}")


if __name__ == "__main__":
    main()
