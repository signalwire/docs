"""
update_redirects.py

Writes a block of validated cross-domain redirects into redirects.map.
Any previous auto-generated section is replaced on each run.

Pipeline:
  1. Parse full_report.csv, rest_report.csv, and the live sitemap
  2. Build a merged redirect map (full_report > rest_report > sitemap)
  3. Validate every SOURCE slug against developer.signalwire.com
       → 404 = slug never existed; skip it entirely
  4. Validate every DESTINATION URL against signalwire.com/docs
       → 404 / error = page not on new site; fall back to HOME_DEST
  5. Write the validated redirects.map and a human-readable report

Usage:
    python website/provisioning/nginx/update_redirects.py
    python website/provisioning/nginx/update_redirects.py --rest
    python website/provisioning/nginx/update_redirects.py -i --local 3000
"""

import concurrent.futures
import csv
import datetime
import http.client
import json
import os
import urllib.error
import urllib.parse
import urllib.request
import xml.etree.ElementTree as ET

# ---------------------------------------------------------------------------
# Constants
# ---------------------------------------------------------------------------
SCRIPT_DIR       = os.path.dirname(os.path.abspath(__file__))
MAP_FILE         = os.path.join(SCRIPT_DIR, "redirects.map")
FULL_CSV         = os.path.join(SCRIPT_DIR, "full_report.csv")
REST_CSV         = os.path.join(SCRIPT_DIR, "rest_report.csv")
REPORT_FILE      = os.path.join(SCRIPT_DIR, "redirect_update_report.txt")
CORRECTIONS_FILE = os.path.join(SCRIPT_DIR, "source_corrections.json")

SITEMAP_URL  = "https://developer.signalwire.com/sitemap.xml"
OLD_BASE     = "https://developer.signalwire.com"
NEW_BASE     = "https://signalwire.com/docs"   # no trailing slash
HOME_DEST    = "https://signalwire.com/docs"

VALIDATE_WORKERS = 40


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def _is_valid(value: str) -> bool:
    """Return True if value is non-empty and not the literal 'N/A'."""
    v = value.strip()
    return bool(v) and v.upper() != "N/A"


def _head_no_follow(url: str) -> int:
    """
    HEAD request without following redirects.
    Returns the raw HTTP status code, or -1 on connection error.
    Used for source validation: any non-404 means the path exists.
    """
    try:
        parsed = urllib.parse.urlparse(url)
        cls = http.client.HTTPSConnection if parsed.scheme == "https" else http.client.HTTPConnection
        conn = cls(parsed.netloc, timeout=10)
        conn.request("HEAD", parsed.path or "/")
        resp = conn.getresponse()
        status = resp.status
        conn.close()
        return status
    except Exception:
        return -1


def _head_follow(url: str, retries: int = 3) -> int:
    """
    HEAD request that follows redirects (urllib default).
    Returns final HTTP status, or the error code on HTTPError, or -1 on error.
    Retries up to `retries` times on connection errors with a 2s delay.
    Used for destination validation: we want to know if the final page exists.
    """
    import time as _time
    last_err = None
    for attempt in range(1, retries + 1):
        try:
            req = urllib.request.Request(url, method="HEAD")
            req.add_header("User-Agent", "SignalWire-redirect-builder/1.0")
            with urllib.request.urlopen(req, timeout=10) as resp:
                return resp.status
        except urllib.error.HTTPError as exc:
            return exc.code
        except Exception as exc:
            last_err = exc
            if attempt < retries:
                _time.sleep(2)
    print(f"\n    CONN ERROR ({retries} attempts): {url}  [{type(last_err).__name__}: {last_err}]")
    return -1


def _run_parallel(fn, items: list, workers: int, label: str) -> list:
    """
    Execute fn(*item) for every item in parallel.
    Returns results in original order while printing a progress counter.
    """
    ordered: dict = {}
    total = len(items)
    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as ex:
        future_to_idx = {ex.submit(fn, *item): i for i, item in enumerate(items)}
        done = 0
        for future in concurrent.futures.as_completed(future_to_idx):
            ordered[future_to_idx[future]] = future.result()
            done += 1
            print(f"  {label}: {done}/{total}", end="\r", flush=True)
    print()
    return [ordered[i] for i in range(total)]


# ---------------------------------------------------------------------------
# Parsing
# ---------------------------------------------------------------------------

def parse_full_report(filepath: str) -> tuple:
    """
    Read full_report.csv → ({old_url: dest_url}, {old_url: (csv_name, row_num)}).

    Column indices (0-based):
      col[1]  = old_url        — source slug
      col[14] = cur_full_url   — current slug on new site (empty/N/A = deleted)
      col[18] = prop_full_url  — proposed slug on new site

    Destination priority:
      1. prop_full_url if valid  → NEW_BASE + prop_full_url
      2. cur_full_url  if valid  → NEW_BASE + cur_full_url
      3. fallback                → HOME_DEST

    When the same source slug appears multiple times, the row with the best
    destination (specific > HOME) wins.
    """
    csv_name = os.path.basename(filepath)
    redirects: dict = {}
    origins:   dict = {}
    with open(filepath, encoding="utf-8-sig", newline="") as fh:
        for row_num, row in enumerate(csv.reader(fh), 1):
            if len(row) <= 18:
                continue
            old_url       = row[1].strip()
            cur_full_url  = row[14].strip()
            prop_full_url = row[18].strip()

            if not old_url.startswith("/"):
                continue

            old_url = old_url.rstrip("/")

            if _is_valid(prop_full_url):
                dest = NEW_BASE + prop_full_url.rstrip("/")
            elif _is_valid(cur_full_url):
                dest = NEW_BASE + cur_full_url.rstrip("/")
            else:
                dest = HOME_DEST

            # Keep a specific destination over HOME if same slug appears twice
            existing = redirects.get(old_url)
            if existing is None or (existing == HOME_DEST and dest != HOME_DEST):
                redirects[old_url] = dest
                origins[old_url] = (csv_name, row_num)

    return redirects, origins


def parse_rest_report(filepath: str) -> tuple:
    """
    Read rest_report.csv → ({old_slug: dest_url}, {old_slug: (csv_name, row_num)}).

    Column indices (0-based):
      col[0] = old slug
      col[1] = current slug
      col[2] = NOTE

    If col[1] is empty, 'N/A', or 'x' → HOME_DEST.
    """
    csv_name = os.path.basename(filepath)
    redirects: dict = {}
    origins:   dict = {}
    with open(filepath, encoding="utf-8-sig", newline="") as fh:
        for row_num, row in enumerate(csv.reader(fh), 1):
            if not row:
                continue
            old_slug = row[0].strip()
            if not old_slug.startswith("/"):
                continue

            old_slug     = old_slug.rstrip("/")
            current_slug = row[1].strip() if len(row) > 1 else ""

            if not current_slug or current_slug.upper() in ("N/A", "X"):
                dest = HOME_DEST
            else:
                dest = NEW_BASE + current_slug.rstrip("/")

            redirects[old_slug] = dest
            origins[old_slug] = (csv_name, row_num)
    return redirects, origins


def fetch_sitemap_paths(url: str) -> set:
    """
    Fetch sitemap XML and return a set of /paths.
    Returns an empty set and prints a warning on failure.
    """
    paths: set = set()
    try:
        with urllib.request.urlopen(url, timeout=15) as resp:
            xml_bytes = resp.read()
        root = ET.fromstring(xml_bytes)
        ns   = {"sm": "http://www.sitemaps.org/schemas/sitemap/0.9"}
        locs = root.findall(".//sm:loc", ns) or root.findall(".//loc")
        for loc in locs:
            text = (loc.text or "").strip()
            if text:
                path = urllib.parse.urlparse(text).path.rstrip("/") or "/"
                paths.add(path)
    except Exception as exc:
        print(f"WARNING: Could not fetch sitemap from {url}: {exc}")
    return paths


# ---------------------------------------------------------------------------
# Building
# ---------------------------------------------------------------------------

def build_redirect_map(full: dict, rest: dict, sitemap: set,
                       full_origins: dict = None, rest_origins: dict = None) -> tuple:
    """
    Merge sources with priority: full_report > rest_report > sitemap.
    Returns ({slug: dest_url}, {slug: (csv_name, row_num)}).

    Sitemap entries not covered by the CSVs are initially assigned HOME_DEST;
    validate_sitemap_destinations() later upgrades any that resolve to a real
    page on the new site.
    """
    redirect_map: dict = {}
    origin_map:   dict = {}

    for slug, dest in full.items():
        bare = slug.rstrip("/")
        redirect_map[bare] = dest
        if full_origins and slug in full_origins:
            origin_map[bare] = full_origins[slug]

    for slug, dest in rest.items():
        bare = slug.rstrip("/")
        if bare not in redirect_map:
            redirect_map[bare] = dest
            if rest_origins and slug in rest_origins:
                origin_map[bare] = rest_origins[slug]

    for path in sitemap:
        bare = path.rstrip("/") or "/"
        if bare not in redirect_map:
            redirect_map[bare] = HOME_DEST
            origin_map[bare] = ("sitemap", 0)

    return redirect_map, origin_map


def validate_sitemap_destinations(redirect_map: dict) -> tuple:
    """
    For every entry that still holds HOME_DEST (i.e. came from the sitemap
    with no CSV mapping), try to find a real page on the new site by checking:
      1. The path as-is:              NEW_BASE + slug
      2. Underscores → hyphens:       NEW_BASE + slug.replace("_", "-")

    If either resolves to a non-404 page, upgrade the destination.
    Returns (updated_map, upgraded_list).
    """
    sitemap_home_slugs = [s for s, d in redirect_map.items() if d == HOME_DEST and s != "/"]
    if not sitemap_home_slugs:
        return redirect_map, []

    print(f"  Probing {len(sitemap_home_slugs)} sitemap-only slugs for candidate destinations …")

    def probe(slug: str):
        candidates = [NEW_BASE + slug]
        hyphenated = NEW_BASE + slug.replace("_", "-")
        if hyphenated != candidates[0]:
            candidates.append(hyphenated)
        for url in candidates:
            status = _head_no_follow(url)
            if status not in (404, -1):
                return url
        return None

    results = _run_parallel(
        probe,
        [(s,) for s in sitemap_home_slugs],
        VALIDATE_WORKERS,
        "sitemap dest probe",
    )

    upgraded: list = []
    updated_map = dict(redirect_map)
    for slug, dest in zip(sitemap_home_slugs, results):
        if dest is not None:
            updated_map[slug] = dest
            upgraded.append((slug, dest))

    return updated_map, upgraded


# ---------------------------------------------------------------------------
# Validation
# ---------------------------------------------------------------------------

def validate_sources(redirect_map: dict) -> tuple:
    """
    HEAD every source slug against OLD_BASE (no redirect-following).
    404 → the path never existed on the old site → skip it.
    Any other status (200, 301, 302, 5xx, -1/timeout) → keep it.

    Returns (valid_map, skipped_list).
    """
    slugs = list(redirect_map.keys())
    print(f"  Checking {len(slugs)} source slugs on {OLD_BASE} …")

    statuses = _run_parallel(
        lambda slug: _head_no_follow(OLD_BASE + slug),
        [(s,) for s in slugs],
        VALIDATE_WORKERS,
        "source validation",
    )

    valid_map: dict = {}
    skipped:   list = []
    for slug, status in zip(slugs, statuses):
        if status == 404:
            # Preserve original destination so interactive fix can reuse it
            skipped.append((slug, status, redirect_map[slug]))
        else:
            valid_map[slug] = redirect_map[slug]

    return valid_map, skipped


def load_corrections() -> dict:
    """
    Load persisted source corrections from CORRECTIONS_FILE.
    Returns {bad_slug: corrected_slug} or {} if the file doesn't exist.
    """
    if not os.path.exists(CORRECTIONS_FILE):
        return {}
    with open(CORRECTIONS_FILE, encoding="utf-8") as fh:
        return json.load(fh)


def save_corrections(corrections: dict) -> None:
    """Persist the full corrections dict to CORRECTIONS_FILE."""
    with open(CORRECTIONS_FILE, "w", encoding="utf-8") as fh:
        json.dump(corrections, fh, indent=2, sort_keys=True)
        fh.write("\n")


def apply_corrections(redirect_map: dict, origin_map: dict, corrections: dict) -> tuple:
    """
    Replace every bad source slug with its corrected counterpart (in memory only).
    The destination is preserved unchanged.

    If the corrected slug already exists in the map (e.g. added by the sitemap
    catch-all with HOME_DEST), the correction takes priority and the duplicate
    sitemap entry is dropped.

    Returns (updated_map, updated_origin_map, applied_list) where applied_list is
    [(bad_slug, corrected_slug, dest), ...].
    """
    correction_targets = set(corrections.values())

    updated_map = {}
    updated_origins = {}
    applied: list = []
    for slug, dest in redirect_map.items():
        if slug in corrections:
            corrected = corrections[slug]
            updated_map[corrected] = dest
            updated_origins[corrected] = origin_map.get(slug, ("unknown", 0))
            applied.append((slug, corrected, dest))
        elif slug not in correction_targets:
            updated_map[slug] = dest
            if slug in origin_map:
                updated_origins[slug] = origin_map[slug]
    return updated_map, updated_origins, applied


def interactive_fix_sources(skipped_sources: list, redirect_map: dict) -> tuple:
    """
    For each source slug that returned 404 on the old site, prompt the user
    for a corrected source URL.  If one is provided:
      - The corrected slug is validated against developer.signalwire.com
      - If valid, it is added to redirect_map with the same destination
      - The original bad slug is recorded as fixed (not just skipped)

    Returns (updated_map, still_skipped, fixed_list).
      still_skipped — entries the user chose to skip or whose replacement also 404d
      fixed_list    — [(bad_slug, corrected_slug, dest), ...]
    """
    if not skipped_sources:
        return redirect_map, [], []

    print()
    print("=" * 62)
    print(" INTERACTIVE SOURCE FIX")
    print(" For each invalid slug, enter the correct old-site path,")
    print(" or press Enter to leave it skipped.")
    print("=" * 62)

    updated_map  = dict(redirect_map)
    still_skipped: list = []
    fixed:         list = []

    for i, (slug, status, original_dest) in enumerate(skipped_sources, 1):
        print(f"\n[{i}/{len(skipped_sources)}] {slug}  (HTTP {status} on {OLD_BASE})")
        print(f"  Intended destination: {original_dest}")
        try:
            answer = input("  Correct source path (Enter to skip): ").strip()
        except (EOFError, KeyboardInterrupt):
            print("\nAborted — remaining entries will be skipped.")
            still_skipped.extend(skipped_sources[i - 1:])
            break

        if not answer:
            still_skipped.append((slug, status, original_dest))
            continue

        corrected = ("/" + answer.lstrip("/")).rstrip("/")
        print(f"  Validating {OLD_BASE}{corrected} …", end=" ", flush=True)
        check_status = _head_no_follow(OLD_BASE + corrected)
        print(f"HTTP {check_status}")

        if check_status == 404:
            print(f"  Still 404 — keeping as skipped.")
            still_skipped.append((slug, check_status, original_dest))
        else:
            updated_map[corrected] = original_dest
            fixed.append((slug, corrected, original_dest))
            print(f"  Fixed: {corrected}  ->  {original_dest}")

    # Persist all new corrections so future runs apply them automatically
    if fixed:
        existing = load_corrections()
        for bad_slug, corrected, _dest in fixed:
            existing[bad_slug] = corrected
        save_corrections(existing)
        print(f"\n  Saved {len(fixed)} correction(s) to {CORRECTIONS_FILE}")

    return updated_map, still_skipped, fixed


def validate_destinations(redirect_map: dict, local_port: int = 0) -> tuple:
    """
    Two-pass destination validation:

      1. HEAD every unique non-HOME destination against the main site (parallel).
      2. If --local is set, re-check each 404/error destination against
         localhost sequentially with a delay between requests to avoid
         crashing the local dev server.

    Returns (validated_map, invalidated_list).
    invalidated_list items are (dest_url, status).
    """
    import time

    unique_dests = list({d for d in redirect_map.values() if d != HOME_DEST})

    # --- Pass 1: main site (parallel) ---
    print(f"  Pass 1: checking {len(unique_dests)} destination URLs on {NEW_BASE} …")
    statuses = _run_parallel(
        _head_follow,
        [(d,) for d in unique_dests],
        VALIDATE_WORKERS,
        "destination validation (main)",
    )
    dest_status = dict(zip(unique_dests, statuses))

    # Separate into ok / failed
    failed_dests = [d for d in unique_dests if dest_status[d] in (404, -1)]

    # --- Pass 2: localhost fallback (sequential + throttled) ---
    if local_port and failed_dests:
        local_base = f"http://localhost:{local_port}/docs"
        print(f"  Pass 2: re-checking {len(failed_dests)} failed URLs on {local_base} (5 s delay) …")
        for i, dest in enumerate(failed_dests):
            local_url = dest.replace(NEW_BASE, local_base, 1)
            status = _head_follow(local_url)
            dest_status[dest] = status
            done = i + 1
            print(f"    local fallback: {done}/{len(failed_dests)}  {dest}  → {status}", flush=True)
            if done < len(failed_dests):
                time.sleep(5)

    # --- Build result ---
    validated_map: dict = {}
    invalidated:   list = []
    for slug, dest in redirect_map.items():
        if dest == HOME_DEST:
            validated_map[slug] = HOME_DEST
            continue
        status = dest_status.get(dest, -1)
        if status == 404 or status == -1:
            invalidated.append((dest, status))
            validated_map[slug] = HOME_DEST
        else:
            validated_map[slug] = dest

    # Deduplicate invalidated destinations for reporting
    seen: set = set()
    deduped: list = []
    for item in invalidated:
        if item[0] not in seen:
            seen.add(item[0])
            deduped.append(item)

    return validated_map, deduped


def interactive_fix_destinations(invalidated_dests: list, redirect_map: dict,
                                 origin_map: dict) -> tuple:
    """
    For each invalidated destination, show which CSV/row it came from and
    prompt the user for a corrected destination path.

    Enter a new path (e.g. /server-sdk/node) to update the destination.
    Press Enter to leave it as HOME_DEST.

    Returns (updated_map, fixed_list, still_invalid).
      fixed_list    — [(slug, old_dest, new_dest, csv_name, row_num), ...]
      still_invalid — destinations the user chose to skip
    """
    if not invalidated_dests:
        return redirect_map, [], []

    # Build reverse map: bad_dest → [(slug, csv_name, row_num), ...]
    bad_dest_set = {d for d, _ in invalidated_dests}
    dest_to_slugs: dict = {}
    for slug, dest in redirect_map.items():
        if dest in bad_dest_set:
            csv_name, row_num = origin_map.get(slug, ("unknown", 0))
            dest_to_slugs.setdefault(dest, []).append((slug, csv_name, row_num))

    print()
    print("=" * 62)
    print(" INTERACTIVE DESTINATION FIX")
    print(" For each invalid destination, enter the correct new-site path,")
    print(" or press Enter to leave it pointing to home.")
    print("=" * 62)

    updated_map   = dict(redirect_map)
    fixed:  list  = []
    still_invalid: list = []

    for i, (dest, status) in enumerate(sorted(invalidated_dests), 1):
        label = "connection error" if status == -1 else f"HTTP {status}"
        slugs_info = dest_to_slugs.get(dest, [])

        print(f"\n[{i}/{len(invalidated_dests)}] {dest}  [{label}]")
        print(f"  Source slugs pointing here ({len(slugs_info)}):")
        for slug, csv_name, row_num in slugs_info[:10]:
            row_label = f" row {row_num}" if row_num else ""
            print(f"    {slug}  ({csv_name}{row_label})")
        if len(slugs_info) > 10:
            print(f"    … and {len(slugs_info) - 10} more")

        try:
            answer = input("  Correct destination path (Enter to skip): ").strip()
        except (EOFError, KeyboardInterrupt):
            print("\nAborted — remaining entries will be left as home.")
            still_invalid.extend(invalidated_dests[i - 1:])
            break

        if not answer:
            still_invalid.append((dest, status))
            continue

        new_dest = NEW_BASE + ("/" + answer.lstrip("/")).rstrip("/")
        for slug, csv_name, row_num in slugs_info:
            updated_map[slug] = new_dest
            fixed.append((slug, dest, new_dest, csv_name, row_num))
            print(f"    Updated: {slug}  →  {new_dest}  ({csv_name} row {row_num})")

    return updated_map, fixed, still_invalid


def patch_rest_destinations(csv_file: str, fixed_dests: list) -> int:
    """
    Rewrite rest_report.csv in-place, updating col[1] (current slug) for rows
    whose destinations were corrected interactively.

    fixed_dests items are (slug, old_dest, new_dest, csv_name, row_num).
    Only rows from rest_report.csv are patched.

    Returns the number of rows updated.
    """
    # Build {row_num: new_slug_path} for rest_report.csv rows only
    row_fixes: dict = {}
    for slug, old_dest, new_dest, csv_name, row_num in fixed_dests:
        if csv_name == os.path.basename(csv_file) and row_num > 0:
            # Strip NEW_BASE prefix to get the bare slug for the CSV
            new_slug = new_dest.replace(NEW_BASE, "", 1)
            row_fixes[row_num] = new_slug

    if not row_fixes:
        return 0

    rows = []
    updated = 0
    with open(csv_file, encoding="utf-8-sig", newline="") as fh:
        for row_num, row in enumerate(csv.reader(fh), 1):
            if row_num in row_fixes and len(row) > 1:
                row[1] = row_fixes[row_num]
                updated += 1
            rows.append(row)

    with open(csv_file, "w", encoding="utf-8-sig", newline="") as fh:
        writer = csv.writer(fh)
        writer.writerows(rows)

    return updated


# ---------------------------------------------------------------------------
# Output
# ---------------------------------------------------------------------------

def format_entries(redirect_map: dict) -> list:
    """
    Build sorted nginx map lines. Each slug produces two lines
    (bare path + trailing-slash variant), except "/" which only gets one.
    """
    lines = []
    for slug in sorted(redirect_map):
        dest = redirect_map[slug]
        bare = slug.rstrip("/")
        if not bare:        # root "/"
            lines.append(f"/ {dest};")
        else:
            lines.append(f"{bare} {dest};")
            lines.append(f"{bare}/ {dest};")
    return lines


def write_map_file(map_file: str, entries: list) -> None:
    """Overwrite redirects.map entirely with the fresh auto-generated section."""
    today = datetime.date.today().isoformat()
    header = "\n".join([
        "# ============================================================",
        "# Auto-generated redirects: developer.signalwire.com → signalwire.com/docs",
        f"# Generated {today} by update_redirects.py",
        "# Sources: full_report.csv, rest_report.csv, developer.signalwire.com/sitemap.xml",
        "# ============================================================",
    ])
    with open(map_file, "w", encoding="utf-8") as fh:
        fh.write(header + "\n")
        for line in entries:
            fh.write(line + "\n")


def write_report(
    report_file: str,
    redirect_map: dict,
    origin_map: dict,
    applied_corrections: list,
    skipped_sources: list,
    fixed_sources: list,
    upgraded_sources: list,
    invalidated_dests: list,
    fixed_dests: list,
) -> None:
    """Write redirect_update_report.txt."""
    today       = datetime.date.today().isoformat()
    total       = len(redirect_map)
    home_count  = sum(1 for d in redirect_map.values() if d == HOME_DEST)
    specific    = total - home_count

    lines = [
        f"Redirect Update Report - {today}",
        "=" * 54,
        f"Redirects written       : {total} (pairs)",
        f"  Specific destination  : {specific}",
        f"  Home (no valid dest)  : {home_count}",
        "",
        f"Saved corrections applied                     : {len(applied_corrections)}",
        f"New source corrections entered this run       : {len(fixed_sources)}",
        f"Destination fixes entered this run            : {len(fixed_dests)}",
        f"Source slugs skipped (404 on old site)        : {len(skipped_sources)}",
        f"Sitemap entries upgraded to specific dest      : {len(upgraded_sources)}",
        f"Destinations replaced with home (404 on new)  : {len(invalidated_dests)}",
    ]

    if applied_corrections:
        lines += ["", "SAVED CORRECTIONS APPLIED:"]
        for bad_slug, corrected, dest in sorted(applied_corrections):
            lines.append(f"  {bad_slug}  ->  {corrected}  ->  {dest}")

    if fixed_sources:
        lines += ["", "NEW SOURCE CORRECTIONS (saved to source_corrections.json):"]
        for bad_slug, corrected, dest in sorted(fixed_sources):
            lines.append(f"  {bad_slug}  ->  {corrected}  ->  {dest}")

    if fixed_dests:
        lines += ["", "DESTINATION FIXES (update these rows in the spreadsheet):"]
        for slug, old_dest, new_dest, csv_name, row_num in sorted(fixed_dests, key=lambda x: (x[3], x[4])):
            lines.append(f"  {csv_name} row {row_num}: {slug}  {old_dest}  ->  {new_dest}")

    if skipped_sources:
        lines += ["", "SKIPPED SOURCES (not found on developer.signalwire.com):"]
        for slug, status, _dest in sorted(skipped_sources):
            lines.append(f"  {slug}  [{status}]")

    if upgraded_sources:
        lines += ["", "UPGRADED SITEMAP ENTRIES (found on signalwire.com/docs):"]
        for slug, dest in sorted(upgraded_sources):
            lines.append(f"  {slug}  ->  {dest}")

    if invalidated_dests:
        lines += ["", "INVALIDATED DESTINATIONS (not found on signalwire.com/docs):"]
        # Group by dest, show which CSV/row each came from
        bad_dest_set = {d for d, _ in invalidated_dests}
        dest_slugs: dict = {}
        for slug, dest in redirect_map.items():
            if dest in bad_dest_set or (dest == HOME_DEST and slug in origin_map):
                pass  # we only care about the bad ones
        for dest, status in sorted(invalidated_dests):
            label = "connection error" if status == -1 else f"HTTP {status}"
            lines.append(f"  {dest}  [{label}]")

    with open(report_file, "w", encoding="utf-8") as fh:
        fh.write("\n".join(lines) + "\n")


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main() -> None:
    import argparse
    parser = argparse.ArgumentParser(description="Generate validated nginx redirect map")
    parser.add_argument(
        "--interactive", "-i", action="store_true",
        help="Interactively fix invalid source slugs and bad destinations",
    )
    parser.add_argument(
        "--local", "-l", type=int, metavar="PORT",
        help="Fallback: re-check 404'd destinations against http://localhost:PORT/docs (with throttling)",
    )
    parser.add_argument(
        "--rest", action="store_true",
        help="Only process rest_report.csv (skip full_report.csv and sitemap)",
    )
    parser.add_argument(
        "--full", action="store_true",
        help="Only process full_report.csv (skip rest_report.csv and sitemap)",
    )
    parser.add_argument(
        "--report", action="store_true",
        help="Dry run: validate destinations and print bad ones with CSV origins. No files written.",
    )
    args = parser.parse_args()

    if args.rest and args.full:
        parser.error("--rest and --full are mutually exclusive")

    # 1. Parse sources
    full = {}
    full_origins = {}
    rest = {}
    rest_origins = {}
    sitemap = set()

    if not args.rest:
        print("Parsing full_report.csv …")
        full, full_origins = parse_full_report(FULL_CSV)
        print(f"  {len(full)} entries")

    if not args.full and not args.rest:
        print(f"Fetching sitemap from {SITEMAP_URL} …")
        sitemap = fetch_sitemap_paths(SITEMAP_URL)
        print(f"  {len(sitemap)} paths")

    if not args.full:
        print("Parsing rest_report.csv …")
        rest, rest_origins = parse_rest_report(REST_CSV)
        print(f"  {len(rest)} entries")

    # 2. Merge
    print("Building redirect map …")
    redirect_map, origin_map = build_redirect_map(
        full, rest, sitemap, full_origins, rest_origins,
    )
    print(f"  {len(redirect_map)} unique slugs")

    # 3. Validate sources (removes slugs that 404 on the old site)
    print("Validating source slugs …")
    redirect_map, skipped_sources = validate_sources(redirect_map)
    print(f"  {len(redirect_map)} valid, {len(skipped_sources)} skipped (404 on old site)")

    # 4. Interactively fix remaining bad source slugs (opt-in)
    applied_corrections: list = []
    fixed_sources: list = []
    if args.interactive:
        # Re-apply saved corrections from previous interactive runs
        corrections = load_corrections()
        if corrections:
            redirect_map, origin_map, applied_corrections = apply_corrections(
                redirect_map, origin_map, corrections,
            )
            print(f"Applied {len(applied_corrections)} saved correction(s) from {CORRECTIONS_FILE}")
        if skipped_sources:
            redirect_map, skipped_sources, fixed_sources = interactive_fix_sources(
                skipped_sources, redirect_map
            )
            print(f"\n  {len(fixed_sources)} fixed, {len(skipped_sources)} still skipped")

    # 6. For sitemap-only HOME_DEST entries, probe the new site for a real page
    if not args.rest and not args.full:
        print("Probing sitemap-only entries for candidate destinations …")
        redirect_map, upgraded_sources = validate_sitemap_destinations(redirect_map)
        print(f"  {len(upgraded_sources)} sitemap entries upgraded from HOME to a specific dest")
    else:
        upgraded_sources = []

    # 7. Validate destinations (demotes bad dests to HOME_DEST)
    print("Validating destination URLs …")
    pre_validate_map = dict(redirect_map)  # keep a copy for --report lookups
    redirect_map, invalidated_dests = validate_destinations(redirect_map, local_port=args.local or 0)
    print(f"  {len(invalidated_dests)} destinations replaced with home (404/error)")

    # --report: print bad destinations with CSV origins and exit (no files written)
    if args.report:
        if not invalidated_dests:
            print("\nNo invalid destinations found.")
            return

        # Build reverse map from the pre-validation map
        bad_dest_set = {d for d, _ in invalidated_dests}
        dest_to_slugs: dict = {}
        for slug, dest in pre_validate_map.items():
            if dest in bad_dest_set:
                csv_name, row_num = origin_map.get(slug, ("unknown", 0))
                dest_to_slugs.setdefault(dest, []).append((slug, csv_name, row_num))

        print(f"\n{'='*70}")
        print(f" INVALID DESTINATIONS — {len(invalidated_dests)} unique bad URLs")
        print(f" Update these rows in the spreadsheet")
        print(f"{'='*70}")
        for dest, status in sorted(invalidated_dests):
            label = "connection error" if status == -1 else f"HTTP {status}"
            slugs_info = dest_to_slugs.get(dest, [])
            print(f"\n  {dest}  [{label}]")
            for slug, csv_name, row_num in sorted(slugs_info, key=lambda x: (x[1], x[2])):
                row_label = f" row {row_num}" if row_num else ""
                print(f"    ← {slug}  ({csv_name}{row_label})")

        print(f"\n{'='*70}")
        print(f"  Total bad destinations : {len(invalidated_dests)}")
        print(f"  Total affected slugs   : {sum(len(v) for v in dest_to_slugs.values())}")
        print(f"{'='*70}")
        return

    # 8. Interactively fix bad destinations (opt-in)
    fixed_dests: list = []
    if args.interactive and invalidated_dests:
        redirect_map, fixed_dests, invalidated_dests = interactive_fix_destinations(
            invalidated_dests, redirect_map, origin_map,
        )
        print(f"\n  {len(fixed_dests)} destination(s) fixed, {len(invalidated_dests)} still invalid")

        # Write fixes back to rest_report.csv
        if fixed_dests:
            patched = patch_rest_destinations(REST_CSV, fixed_dests)
            if patched:
                print(f"  Updated {patched} row(s) in {REST_CSV}")

    # 9. Write
    print("Formatting nginx entries …")
    entries = format_entries(redirect_map)

    print(f"Writing {MAP_FILE} …")
    write_map_file(MAP_FILE, entries)

    print(f"Writing report to {REPORT_FILE} …")
    write_report(
        REPORT_FILE, redirect_map, origin_map,
        applied_corrections, skipped_sources, fixed_sources,
        upgraded_sources, invalidated_dests, fixed_dests,
    )

    home_count = sum(1 for d in redirect_map.values() if d == HOME_DEST)
    print("\nDone.")
    print(f"  Redirects written     : {len(redirect_map)} pairs ({len(entries)} lines)")
    print(f"  Specific destination  : {len(redirect_map) - home_count}")
    print(f"  Home (no valid dest)  : {home_count}")
    print(f"  Fixed sources         : {len(fixed_sources)}")
    print(f"  Fixed destinations    : {len(fixed_dests)}")
    print(f"  Sources skipped       : {len(skipped_sources)}")
    print(f"  Destinations demoted  : {len(invalidated_dests)}")
    print(f"  Report                : {REPORT_FILE}")


if __name__ == "__main__":
    main()
