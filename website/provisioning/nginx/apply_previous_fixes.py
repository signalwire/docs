"""
One-time script to recover destination fixes from previous_work.txt
and apply them to rest_report.csv.
"""
import csv
import os
import re

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PREVIOUS_WORK = os.path.join(SCRIPT_DIR, "previous_work.txt")
REST_CSV = os.path.join(SCRIPT_DIR, "rest_report.csv")
NEW_BASE = "https://signalwire.com/docs"

# Parse the terminal output to extract corrections
# Format: old_dest URL on the [N/63] line, correction on the "Correct destination path" line
fixes = {}  # {old_dest_slug: new_dest_slug}

with open(PREVIOUS_WORK, encoding="utf-8") as fh:
    lines = fh.readlines()

current_dest = None
for line in lines:
    # Match: [N/63] https://signalwire.com/docs/some/path  [HTTP 404]
    m = re.match(r'\[(\d+)/\d+\]\s+(https://signalwire\.com/docs\S+)\s+\[', line)
    if m:
        current_dest = m.group(2)
        continue

    # Match: Correct destination path (Enter to skip): /some/new/path
    m = re.match(r'\s+Correct destination path \(Enter to skip\):\s*(.+)', line)
    if m and current_dest:
        answer = m.group(1).strip()
        if answer:
            old_slug = current_dest.replace(NEW_BASE, "", 1)
            new_slug = ("/" + answer.lstrip("/")).rstrip("/")
            fixes[old_slug] = new_slug
        current_dest = None
        continue

    # Empty answer (just Enter)
    if 'Correct destination path (Enter to skip):' in line and current_dest:
        current_dest = None

print(f"Parsed {len(fixes)} corrections from previous_work.txt:\n")
for old, new in sorted(fixes.items()):
    print(f"  {old}  ->  {new}")

# Now apply to rest_report.csv
# rest_report.csv col[1] = current slug (destination)
rows = []
updated = 0
with open(REST_CSV, encoding="utf-8-sig", newline="") as fh:
    for row in csv.reader(fh):
        if len(row) > 1:
            current_slug = row[1].strip()
            if current_slug in fixes:
                row[1] = fixes[current_slug]
                updated += 1
        rows.append(row)

if updated > 0:
    with open(REST_CSV, "w", encoding="utf-8-sig", newline="") as fh:
        writer = csv.writer(fh)
        writer.writerows(rows)
    print(f"\nUpdated {updated} row(s) in {REST_CSV}")
else:
    print(f"\nNo matching rows found in {REST_CSV}. Checking if slugs need NEW_BASE prefix stripped...")
    # Debug: show what col[1] values look like
    with open(REST_CSV, encoding="utf-8-sig", newline="") as fh:
        reader = csv.reader(fh)
        samples = []
        for row in reader:
            if len(row) > 1 and row[1].strip().startswith("/apis/relay-rest"):
                samples.append(row[1].strip())
            if len(samples) >= 5:
                break
    print("  Sample col[1] values:", samples)
