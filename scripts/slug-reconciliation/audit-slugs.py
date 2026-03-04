#!/usr/bin/env python3
"""Slug Audit Tool — visual comparison of old vs new URLs.

Opens a browser-based controller that manages two side-by-side windows
(old site / new site). The terminal drives the audit: for each row the
windows auto-navigate, and you mark the match as valid or not.

Usage:
    python scripts/slug-reconciliation/audit-slugs.py
    python scripts/slug-reconciliation/audit-slugs.py --reaudit   # re-review 'n' rows
    python scripts/slug-reconciliation/audit-slugs.py --fix       # fix 'n' rows with correct slugs
    python scripts/slug-reconciliation/audit-slugs.py --port 9000
"""

import csv
import json
import sys
import time
import urllib.request
import urllib.error
import webbrowser
import threading
from http.server import HTTPServer, BaseHTTPRequestHandler
from pathlib import Path

# ─── Configuration ───────────────────────────────────────────────────────────

SCRIPT_DIR = Path(__file__).resolve().parent
REPORT_PATH = SCRIPT_DIR / "reports" / "slug-final-report.csv"

OLD_DOMAIN = "https://developer.signalwire.com"
NEW_DOMAIN = "https://signalwire.docs.buildwithfern.com"

AUDITABLE_ACTIONS = {"redirect", "review"}
DEFAULT_PORT = 8742
AUTO_SAVE_INTERVAL = 5


# ─── Terminal colors ─────────────────────────────────────────────────────────

class C:
    RESET  = "\033[0m"
    BOLD   = "\033[1m"
    DIM    = "\033[2m"
    RED    = "\033[31m"
    GREEN  = "\033[32m"
    YELLOW = "\033[33m"
    BLUE   = "\033[34m"
    CYAN   = "\033[36m"


# ─── Shared state (HTTP server ↔ main thread) ───────────────────────────────

class AuditState:
    def __init__(self):
        self.old_url = ""
        self.new_url = ""
        self.row_num = 0
        self.total_rows = 0
        self.action = ""
        self.category = ""
        self.confidence = ""
        self.product = ""
        self.done = False

state = AuditState()


# ─── Embedded HTTP server ───────────────────────────────────────────────────

CONTROLLER_HTML = r"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Slug Audit</title>
<style>
  *{margin:0;padding:0;box-sizing:border-box}
  body{font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',system-ui,sans-serif;
       background:#0f172a;color:#e2e8f0;padding:24px;min-height:100vh}
  h1{font-size:20px;color:#38bdf8;margin-bottom:12px}
  .info{color:#94a3b8;font-size:14px;margin-bottom:20px;line-height:1.6}
  code{background:#1e293b;padding:2px 6px;border-radius:4px;font-size:13px}
  button{background:#2563eb;color:#fff;border:none;padding:12px 28px;
         font-size:15px;border-radius:8px;cursor:pointer;transition:background .2s}
  button:hover{background:#1d4ed8}
  button:disabled{background:#475569;cursor:default}
  #status{margin-top:20px;padding:16px;background:#1e293b;border-radius:8px;
          font-size:13px;font-family:Consolas,Monaco,monospace}
  .lbl{color:#94a3b8;font-size:11px;text-transform:uppercase;letter-spacing:.05em}
  .url{color:#38bdf8;word-break:break-all;margin:4px 0 12px}
  .meta{color:#64748b;font-size:12px;margin-top:8px}
  .ok{color:#4ade80} .err{color:#f87171}
  .badge{display:inline-block;padding:2px 8px;border-radius:4px;font-size:11px;font-weight:600}
  .badge-redirect{background:#1e3a5f;color:#38bdf8}
  .badge-review{background:#422006;color:#fbbf24}
  .badge-done{background:#064e3b;color:#34d399}
</style>
</head>
<body>
<h1>Slug Audit Controller</h1>
<p class="info">
  Click each button to open the comparison windows (one click per window).<br>
  They auto-navigate as you step through rows in the terminal.<br>
  Allow popups for <code>localhost</code> if prompted by your browser.
</p>
<button id="btn1" onclick="openOld()">1. Open OLD site window</button>
<button id="btn2" onclick="openNew()" disabled style="margin-left:8px">2. Open NEW site window</button>
<div id="status">Waiting to start…</div>
<script>
let lastOld='', lastNew='';
function dims(){
  const w=Math.floor(screen.availWidth/2), h=screen.availHeight;
  return {w,h};
}
function openOld(){
  const {w,h}=dims();
  const a=window.open('about:blank','audit_old',
    `width=${w},height=${h},left=0,top=0,toolbar=yes,location=yes`);
  if(!a){el('status').innerHTML='<span class="err">Popup blocked — allow popups for localhost.</span>';return}
  el('btn1').disabled=true; el('btn1').textContent='✓ OLD window open';
  el('btn2').disabled=false;
  el('status').innerHTML='Now click button 2 to open the NEW site window.';
}
function openNew(){
  const {w,h}=dims();
  const b=window.open('about:blank','audit_new',
    `width=${w},height=${h},left=${dims().w},top=0,toolbar=yes,location=yes`);
  if(!b){el('status').innerHTML='<span class="err">Popup blocked — allow popups for localhost.</span>';return}
  el('btn2').disabled=true; el('btn2').textContent='✓ NEW window open';
  el('status').innerHTML='Both windows open. Return to the terminal.';
  poll();
}
function el(id){return document.getElementById(id)}
async function poll(){
  try{
    const r=await fetch('/api/urls');
    const d=await r.json();
    if(d.done){
      el('status').innerHTML='<span class="badge badge-done">Audit complete</span>';
      return;
    }
    if(d.old_url && d.old_url!==lastOld){lastOld=d.old_url;window.open(d.old_url,'audit_old')}
    if(d.new_url && d.new_url!==lastNew){lastNew=d.new_url;window.open(d.new_url,'audit_new')}
    const badge=d.action==='review'
      ?'<span class="badge badge-review">review</span>'
      :'<span class="badge badge-redirect">redirect</span>';
    el('status').innerHTML=
      `<span class="ok">● Connected</span> — Row ${d.row_num}/${d.total_rows} ${badge}<br><br>`+
      `<span class="lbl">Old URL</span><div class="url">${d.old_url||'—'}</div>`+
      `<span class="lbl">New URL</span><div class="url">${d.new_url||'—'}</div>`+
      `<div class="meta">Category: ${d.category} · Confidence: ${d.confidence} · Product: ${d.product}</div>`;
  }catch(e){
    el('status').innerHTML='<span class="err">● Disconnected — is the script running?</span>';
  }
  setTimeout(poll,500);
}
</script>
</body></html>"""


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/":
            self._send(200, "text/html", CONTROLLER_HTML)
        elif self.path == "/api/urls":
            body = json.dumps({
                "old_url":    state.old_url,
                "new_url":    state.new_url,
                "row_num":    state.row_num,
                "total_rows": state.total_rows,
                "action":     state.action,
                "category":   state.category,
                "confidence": state.confidence,
                "product":    state.product,
                "done":       state.done,
            })
            self._send(200, "application/json", body, cache=False)
        else:
            self._send(404, "text/plain", "not found")

    def _send(self, code, ctype, body, cache=True):
        self.send_response(code)
        self.send_header("Content-Type", f"{ctype}; charset=utf-8")
        if not cache:
            self.send_header("Cache-Control", "no-cache")
        self.end_headers()
        self.wfile.write(body.encode("utf-8") if isinstance(body, str) else body)

    def log_message(self, *_):
        pass  # silence request logs


def start_server(port):
    srv = HTTPServer(("127.0.0.1", port), Handler)
    t = threading.Thread(target=srv.serve_forever, daemon=True)
    t.start()
    return srv


# ─── CSV helpers ─────────────────────────────────────────────────────────────

def load_report():
    with open(REPORT_PATH, newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        fieldnames = list(reader.fieldnames)
        rows = list(reader)
    return fieldnames, rows


def save_report(fieldnames, rows):
    with open(REPORT_PATH, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames, restval="")
        writer.writeheader()
        writer.writerows(rows)


# ─── Assignee selection ─────────────────────────────────────────────────────

def get_assignees(rows):
    """Extract unique assignee names from the report."""
    return sorted({r["assign"] for r in rows if r.get("assign", "").strip()})


def select_assignee(assignees):
    print(f"\n  {C.BOLD}Select Assignee{C.RESET}\n")
    for i, name in enumerate(assignees, 1):
        print(f"  {C.CYAN}[{i}]{C.RESET} {name}")
    print()

    while True:
        try:
            raw = input(f"  Choice (1-{len(assignees)}): ").strip()
            if not raw:
                continue
            idx = int(raw)
            if 1 <= idx <= len(assignees):
                name = assignees[idx - 1]
                print(f"\n  {C.GREEN}✓{C.RESET} {C.BOLD}{name}{C.RESET}\n")
                return name
        except ValueError:
            pass
        except (EOFError, KeyboardInterrupt):
            print("\n  Cancelled.")
            sys.exit(0)
        print(f"  {C.RED}Invalid.{C.RESET} Enter 1–{len(assignees)}.\n")


# ─── Audit logic ────────────────────────────────────────────────────────────

def get_pending(rows, assignee, reaudit=False):
    """Return (index, row) pairs that still need auditing for this assignee.

    If reaudit=True, include rows where valid_match='n' (re-review failures).
    """
    pending = []
    for i, row in enumerate(rows):
        if row.get("assign", "").strip() != assignee:
            continue
        if row.get("action") not in AUDITABLE_ACTIONS:
            continue
        vm = row.get("valid_match", "").strip()
        if reaudit:
            if vm and vm != "n":
                continue  # skip 'y' rows, include 'n' and empty
        else:
            if vm:
                continue  # skip any filled row
        if not row.get("old_url") or not row.get("cur_full_url"):
            continue
        pending.append((i, row))
    return pending


def build_url(domain, path):
    """Ensure no double-slash between domain and path."""
    if path.startswith("/"):
        return domain + path
    return domain + "/" + path


def show_row(row, seq, total):
    old = build_url(OLD_DOMAIN, row["old_url"])
    new = build_url(NEW_DOMAIN, row["cur_full_url"])

    color = C.YELLOW if row["action"] == "review" else C.BLUE
    print(f"\n  {'━' * 60}")
    print(f"  {C.BOLD}Row {seq}/{total}{C.RESET}  "
          f"{color}{row['action']}{C.RESET} · {row['category']} · "
          f"confidence {row.get('confidence', '?')}")
    print(f"  {'━' * 60}")
    print(f"  {C.DIM}OLD:{C.RESET} {old}")
    print(f"  {C.DIM}NEW:{C.RESET} {new}")
    if row.get("notes", "").strip():
        print(f"  {C.DIM}Notes:{C.RESET} {row['notes']}")
    print()
    return old, new


def prompt():
    print(f"  {C.GREEN}[y]{C.RESET} Yes   "
          f"{C.RED}[n]{C.RESET} No   "
          f"{C.DIM}[s] Skip   [q] Quit{C.RESET}")
    while True:
        try:
            ch = input(f"\n  -> ").strip().lower()
            if ch in ("y", "n", "s", "q"):
                return ch
        except (EOFError, KeyboardInterrupt):
            print()
            return "q"
        print(f"  {C.RED}Invalid.{C.RESET} Enter y, n, s, or q.")


# ─── Fix mode helpers ───────────────────────────────────────────────────────

def probe_url(url):
    """HEAD-request a URL. Returns True if 200."""
    try:
        req = urllib.request.Request(url, method="HEAD")
        req.add_header("User-Agent", "slug-audit/1.0")
        resp = urllib.request.urlopen(req, timeout=10)
        return resp.status == 200
    except urllib.error.HTTPError:
        return False
    except Exception:
        return False


def show_fix_row(row, seq, total):
    """Display row for fix mode with status indicators."""
    old_slug = row["old_url"]
    new_slug = row.get("cur_full_url", "")
    old_full = build_url(OLD_DOMAIN, old_slug)
    new_full = build_url(NEW_DOMAIN, new_slug)

    color = C.YELLOW if row["action"] == "review" else C.BLUE
    print(f"\n  {'=' * 60}")
    print(f"  {C.BOLD}Row {seq}/{total}{C.RESET}  "
          f"{color}{row['action']}{C.RESET} . {row['category']}")
    print(f"  {'=' * 60}")

    # Probe both URLs
    print(f"  Checking URLs...")
    old_ok = probe_url(old_full)
    new_ok = probe_url(new_full)

    old_tag = f"{C.GREEN}200{C.RESET}" if old_ok else f"{C.RED}404{C.RESET}"
    new_tag = f"{C.GREEN}200{C.RESET}" if new_ok else f"{C.RED}404{C.RESET}"

    print(f"  OLD [{old_tag}]: {old_full}")
    print(f"  NEW [{new_tag}]: {new_full}")
    if row.get("notes", "").strip():
        print(f"  {C.DIM}Notes:{C.RESET} {row['notes']}")
    print()

    return old_full, new_full, old_ok, new_ok


def prompt_fix(old_slug, new_slug, old_ok, new_ok):
    """Prompt for fix mode: correct slugs, skip, confirm as-is, or quit.

    Returns:
      ("y", None, None)       — mark valid as-is
      ("n", None, None)       — confirm as true failure
      ("f", new_old, new_new) — corrected slugs
      ("s", None, None)       — skip
      ("q", None, None)       — quit
    """
    print(f"  {C.GREEN}[y]{C.RESET} Valid as-is   "
          f"{C.RED}[n]{C.RESET} True failure   "
          f"{C.CYAN}[f]{C.RESET} Fix slugs   "
          f"{C.DIM}[s] Skip   [q] Quit{C.RESET}")

    while True:
        try:
            ch = input(f"\n  -> ").strip().lower()
        except (EOFError, KeyboardInterrupt):
            print()
            return "q", None, None

        if ch in ("y", "n", "s", "q"):
            return ch, None, None

        if ch == "f":
            print()
            # Old URL slug
            if not old_ok:
                print(f"  {C.YELLOW}Old URL returned 404.{C.RESET}")
            try:
                raw_old = input(
                    f"  Old slug [{C.DIM}{old_slug}{C.RESET}] (Enter to keep): "
                ).strip()
            except (EOFError, KeyboardInterrupt):
                print()
                return "q", None, None
            fixed_old = raw_old if raw_old else old_slug
            if not fixed_old.startswith("/"):
                fixed_old = "/" + fixed_old

            # New URL slug
            if not new_ok:
                print(f"  {C.YELLOW}New URL returned 404.{C.RESET}")
            try:
                raw_new = input(
                    f"  New slug [{C.DIM}{new_slug}{C.RESET}] (Enter to keep): "
                ).strip()
            except (EOFError, KeyboardInterrupt):
                print()
                return "q", None, None
            fixed_new = raw_new if raw_new else new_slug
            if not fixed_new.startswith("/"):
                fixed_new = "/" + fixed_new

            return "f", fixed_old, fixed_new

        print(f"  {C.RED}Invalid.{C.RESET} Enter y, n, f, s, or q.")


def extract_page_slug(full_url, product_slug):
    """Strip product prefix to get the page slug."""
    prefix = f"/{product_slug}"
    if full_url.startswith(prefix):
        rest = full_url[len(prefix):]
        return rest if rest else "/"
    return full_url


def apply_fix(rows, idx, fixed_old, fixed_new, product):
    """Update CSV row with corrected slugs."""
    rows[idx]["old_url"] = fixed_old
    rows[idx]["cur_full_url"] = fixed_new
    rows[idx]["cur_page_slug"] = extract_page_slug(fixed_new, product)
    rows[idx]["prop_full_url"] = fixed_new
    rows[idx]["prop_page_slug"] = extract_page_slug(fixed_new, product)
    rows[idx]["valid_match"] = "y"


# ─── Main ───────────────────────────────────────────────────────────────────

def main():
    port = DEFAULT_PORT
    if "--port" in sys.argv:
        port = int(sys.argv[sys.argv.index("--port") + 1])
    reaudit = "--reaudit" in sys.argv
    fix_mode = "--fix" in sys.argv

    label = "Slug Audit Tool"
    if fix_mode:
        label += " (fix mode)"
    elif reaudit:
        label += " (re-audit mode)"
    print(f"\n  {C.BOLD}=== {label} ==={C.RESET}\n")

    # Load report
    fieldnames, rows = load_report()
    print(f"  Loaded {len(rows)} rows.")

    # Pick assignee from the data
    assignees = get_assignees(rows)
    if not assignees:
        print(f"  {C.RED}No assignees found in the 'assign' column.{C.RESET}")
        sys.exit(1)
    assignee = select_assignee(assignees)

    # Filter to pending work
    if fix_mode:
        # Fix mode: only rows currently marked 'n'
        pending = get_pending(rows, assignee, reaudit=True)
        # Further filter to only 'n' rows (not empty)
        pending = [(i, r) for i, r in pending
                   if r.get("valid_match", "").strip() == "n"]
    else:
        pending = get_pending(rows, assignee, reaudit=reaudit)

    if not pending:
        print(f"  {C.GREEN}Nothing pending for {assignee} -- all done!{C.RESET}")
        return

    total = len(pending)
    print(f"  {C.BOLD}{total}{C.RESET} rows to process for {assignee}.\n")

    # Start local server + open controller
    srv = start_server(port)
    url = f"http://localhost:{port}"
    print(f"  Controller: {C.CYAN}{url}{C.RESET}")
    print(f"  Opening in browser...\n")
    webbrowser.open(url)

    time.sleep(1)
    print(f"  {C.DIM}Click both buttons in the controller page to open the two windows.{C.RESET}")
    input(f"  Press {C.BOLD}Enter{C.RESET} here when ready... ")

    # ── Fix mode loop ────────────────────────────────────────────────────
    if fix_mode:
        fixed = 0
        confirmed_n = 0
        skip_n = 0

        try:
            for seq, (idx, row) in enumerate(pending, 1):
                old_full, new_full, old_ok, new_ok = show_fix_row(
                    row, seq, total)

                # Push to browser
                state.old_url    = old_full
                state.new_url    = new_full
                state.row_num    = seq
                state.total_rows = total
                state.action     = row.get("action", "")
                state.category   = row.get("category", "")
                state.confidence = row.get("confidence", "")
                state.product    = row.get("cur_product_slug", "")

                time.sleep(0.5)

                ch, fixed_old, fixed_new = prompt_fix(
                    row["old_url"],
                    row.get("cur_full_url", ""),
                    old_ok, new_ok,
                )

                if ch == "q":
                    break
                elif ch == "s":
                    skip_n += 1
                elif ch == "n":
                    confirmed_n += 1
                elif ch == "y":
                    rows[idx]["valid_match"] = "y"
                    fixed += 1
                elif ch == "f":
                    product = row.get("cur_product_slug", "")
                    apply_fix(rows, idx, fixed_old, fixed_new, product)

                    # Navigate browser to corrected URLs for verification
                    verify_old = build_url(OLD_DOMAIN, fixed_old)
                    verify_new = build_url(NEW_DOMAIN, fixed_new)
                    state.old_url = verify_old
                    state.new_url = verify_new

                    print(f"\n  {C.CYAN}Updated:{C.RESET}")
                    print(f"  OLD: {verify_old}")
                    print(f"  NEW: {verify_new}")
                    print(f"  {C.GREEN}Marked as valid.{C.RESET}")
                    fixed += 1

                if (fixed + confirmed_n) % AUTO_SAVE_INTERVAL == 0:
                    save_report(fieldnames, rows)
                    print(f"  {C.DIM}[auto-saved]{C.RESET}")

        except KeyboardInterrupt:
            print(f"\n\n  {C.YELLOW}Interrupted.{C.RESET}")

        state.done = True
        save_report(fieldnames, rows)

        print(f"\n  {'=' * 60}")
        print(f"  {C.BOLD}Fix Summary{C.RESET}")
        print(f"  {'=' * 60}")
        print(f"  Fixed    : {C.GREEN}{fixed}{C.RESET}")
        print(f"  Kept n   : {C.RED}{confirmed_n}{C.RESET}")
        print(f"  Skipped  : {skip_n}")
        print(f"  Left     : {total - fixed - confirmed_n - skip_n}")
        print(f"  {'=' * 60}")
        print(f"  {C.GREEN}Saved to report.{C.RESET}\n")

        srv.shutdown()
        return

    # ── Standard audit loop ──────────────────────────────────────────────
    audited = 0
    yes_n = 0
    no_n = 0
    skip_n = 0

    try:
        for seq, (idx, row) in enumerate(pending, 1):
            old, new = show_row(row, seq, total)

            # Push to browser via shared state
            state.old_url    = old
            state.new_url    = new
            state.row_num    = seq
            state.total_rows = total
            state.action     = row.get("action", "")
            state.category   = row.get("category", "")
            state.confidence = row.get("confidence", "")
            state.product    = row.get("cur_product_slug", "")

            time.sleep(0.3)  # let browser poll + navigate

            ch = prompt()
            if ch == "q":
                break
            elif ch == "s":
                skip_n += 1
                continue
            else:
                rows[idx]["valid_match"] = ch
                audited += 1
                if ch == "y":
                    yes_n += 1
                else:
                    no_n += 1

                if audited % AUTO_SAVE_INTERVAL == 0:
                    save_report(fieldnames, rows)
                    print(f"  {C.DIM}[auto-saved]{C.RESET}")

    except KeyboardInterrupt:
        print(f"\n\n  {C.YELLOW}Interrupted.{C.RESET}")

    # Final save
    state.done = True
    save_report(fieldnames, rows)

    # Summary
    print(f"\n  {'=' * 60}")
    print(f"  {C.BOLD}Summary{C.RESET}")
    print(f"  {'=' * 60}")
    print(f"  Audited : {audited}  ({C.GREEN}{yes_n} yes{C.RESET}, {C.RED}{no_n} no{C.RESET})")
    print(f"  Skipped : {skip_n}")
    print(f"  Left    : {total - audited - skip_n}")
    print(f"  {'=' * 60}")
    print(f"  {C.GREEN}Saved to report.{C.RESET}\n")

    srv.shutdown()


if __name__ == "__main__":
    main()
