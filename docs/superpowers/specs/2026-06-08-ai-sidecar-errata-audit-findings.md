# AI Sidecar — errata audit findings (2026-06-08)

Audit of the "Errata — corrections to the public reference" section of
`temp/RELAY Calling — AI Sidecar.md` against the repo (SWML TypeSpec + MDX) and the
FreeSWITCH C source ground truth.

## Method

Three-way comparison per item: **errata MD** ↔ **repo** (`specs/swml/calling/Methods/ai_sidecar/*.tsp`,
`fern/products/swml/pages/reference/methods/calling/ai_sidecar/`) ↔ **C source ground truth**.

C source traced fresh (clones pulled to latest before tracing):
- `mod_openai` @ `82eb1da` (branch `main`) — `sidecar.c`, `api_commands.c`
- `mod_infrastructure` @ `434412a` (branch `master`) — `swml_schema.c`, `relay_apis.c`, `swml.c`, `relay.c`

Full ground-truth trace: `temp/ai_sidecar_csource_groundtruth.md`.

**Architecture note (why a schema-only audit would mislead):** the SWML `ai_sidecar` schema does
*zero* field-level validation — `swml_schema.c:1665` whitelists the top-level keys and nothing
else. Every default, range, and enum lives in `mod_openai/sidecar.c`. The C trace, not the schema,
is the authoritative column.

## Headline

**Every item in the errata's correction tables is already fixed in the repo (`main`) and confirmed
correct by the C source.** The public reference the errata complains about is a **stale deploy** —
the source was corrected in commit `654efadf0` ("sidecar docs and schema additions") and is already
merged. **Action required for those items: rebuild/redeploy the docs site. No source change.**

A grep of `specs/swml` + `fern/products/swml` for every *wrong* name the errata lists returned
zero hits.

## Errata tables — all already correct

| Errata "fix" | Repo today | C source ground truth | Verdict |
|---|---|---|---|
| `customer_channel` → `customer_role` | `customer_role` | `sidecar.c:2112` (enum `remote-caller`/`local-caller`, def `remote-caller`) | ✅ already correct |
| `lang` "Optional" → **Required** | required (no `?`, `required={true}`) | `sidecar.c:1956` — only required field | ✅ already correct |
| `url` default "None" → `relay_only` | behavior documented (relay-only when unset) | `sidecar.c:2006`, def `relay_only` | ✅ already correct |
| `swaig_allow_global_data` → `swaig_set_global_data` | `swaig_set_global_data` | `sidecar.c:1747`; wrong spelling absent in C | ✅ already correct |
| `act_on_channel` under `permissions` → `params` tunable | in `params` (def `true`) | `sidecar.c:2136` (params), def `true` | ✅ already correct |
| 6 wrong SWAIG action names¹ | all correct names + `extensive_data` | all 15 confirmed; 6 wrong names grep-absent | ✅ already correct |

¹ `inject_message`→`user_input`, `set_session_metadata`→`set_meta_data`,
`unset_session_metadata`→`unset_meta_data`, `set_max_chaining`→`back_to_back_functions`,
`set_model_settings`→`settings`, `toggle_function`→`toggle_functions`.

## Genuine residual gap — FIXED this pass

**Top-level `action` field missing from `AISidecarObject`.** The C whitelist accepts **12** keys
(`swml_schema.c:1665`); the repo modeled **11**. The generated SWML schema is **strict**
(`unevaluatedProperties: {not:{}}`), so a valid `ai_sidecar: { action: { summarize: {…} } }`
request was **rejected by our schema even though the backend accepts it** — the relay layer routes
`action.summarize` to the summarize path (`relay.c:9350-9365`).

Fix (mirrors `live_transcribe`'s `TranscribeSummarizeAction` pattern):
- `specs/.../ai_sidecar/main.tsp` — added `action?: AISidecarSummarizeAction` and the
  `AISidecarSummarizeAction` model (`summarize: { webhook?, prompt? }`, matching the C `summarize`
  subcommand params at `api_commands.c:915-944`).
- `fern/.../ai_sidecar/index.mdx` — added `ai_sidecar.action` / `action.summarize` /
  `summarize.webhook` / `summarize.prompt` `<ParamField>`s.
- Verified: `tsp compile` succeeds; generated `AISidecarObject` now has all 12 properties.

## Minor polish — applied

- `history_pruned` callback row now lists `tokens_before` / `tokens_after` alongside
  `dropped_count` (all three emitted, `sidecar.c:460-468`).

## Highlighted disagreements — no change (by design)

- **`ask_request` / `ask_answer` callbacks** — errata says the SWML callback list omits them. They
  are real (`sidecar.c:2427`, `1526`) but fire **only via the `ask` runtime method, which is not a
  SWML surface** (SWML only *starts* the sidecar; `poke`/`ask`/`stop`/`status` are RELAY/HTTP-RPC
  only). The repo correctly scopes its callback table to the SWML instruction. Omitting them is
  correct, not a bug.
- **SWAIG `includes` / `native_functions`** — the errata's SWAIG table lists them ("schema shared
  with `ai`"), but `sidecar.c` does **not** parse them; the sidecar SWAIG accepts only
  `functions` / `defaults` / `mcp_servers`. The repo's SWAIG spec correctly omits them. Here the
  **errata over-claims**, not the repo.

## Deliberately not surfaced (internal / non-SWML)

Confirmed real in C but intentionally left undocumented:
- `params.deepgram_url_override`, `params.deepgram_key_override` — per-call Deepgram credential
  overrides (`sidecar.c:2064-65`), internal.
- Top-level `event_url`, top-level `debug` — read by `sidecar_build_app` but **not** in the schema
  whitelist (`sidecar.c:1844-1859`), so they would be rejected if sent via SWML.

## Bottom line

The errata describes a public site that predates the merged sidecar work; the source is already
correct. The one real source defect — the strict schema rejecting the valid `action` field — is
fixed here, plus a one-row callback-completeness improvement.

---

# Phase 2 — Sidecar calling commands + webhook callbacks (2026-06-09)

Follow-up: document the sidecar's runtime/calling surface and the previously-missing callbacks.

## Surface decision

"Calling commands" in this repo = TypeSpec request models in
`specs/signalwire-rest/calling-api/` that generate the `POST /api/calling/calls`
(`call-commands`) reference. Added there, mirroring `live_transcribe`/`live_translate`.

Deliberately **not** touched:
- `fern/apis/calling-rpc/openrpc.yaml` (JSON-RPC) — **commented out in `apis.yml`**, unpublished.
- Server-SDK RELAY bindings — the sidecar has **no typed SDK wrapper by design** (errata: use raw
  `execute()`); fabricating bindings would document something that doesn't exist.

Ground truth: `api_commands.c:785` (subcommand syntax), `relay.c:18794-18798` (RELAY verbs),
`relay_apis.c:1875-1913` (envelope schemas).

## Commands added (5)

| Command | params | C source |
|---|---|---|
| `calling.ai_sidecar` | full sidecar config (reuses `AISidecarObject`) + `action.summarize` | `api_commands.c:843` |
| `calling.ai_sidecar.poke` | `{ text }` | `api_commands.c:888`, `relay.c:9400` |
| `calling.ai_sidecar.ask` | `{ text }` → `ask_id`, later `ask_answer` callback | `api_commands.c:896`, `relay.c:9446` |
| `calling.ai_sidecar.stop` | `{}` (no params; addressed by call `id` only) | `api_commands.c:945`, `relay.c:9502` |
| `calling.ai_sidecar.status` | `{}` → counters | `api_commands.c:877`, `relay.c:9542` |

Start body **reuses the SWML `AISidecarObject`** (the REST spec already
`import`s + `using SWML.Calling`) — single source of truth, zero drift with the SWML page, fully
expanded in the generated OpenAPI. Files: `requests.tsp` (5 models + `CallRequest` union entries),
`calls/main.tsp` (command table + `@opExample`s), `examples.tsp` (5 example consts).

## Webhook callbacks

Per the "document callbacks via the webhook payload" decision: added
`AISidecarCallbackPayload` to `webhooks.tsp` (the `call_info` + `sidecar_event` envelope with the
common fields `type`/`ts`/`tick_id`/`channel_data`) and an `AISidecarCallbackType` enum of **all 16
callback types — including the previously-missing `ask_request` / `ask_answer`**. Registered via
`@webhook("aiSidecarCallback", …)` in `calls/main.tsp`; nav entry
`subpackage_calls.ai_sidecar_callback` under APIs → Calling → Webhooks (`apis.yml`). Per-`type`
fields are cross-linked to the SWML `ai_sidecar` reference (single conceptual home), per the
cross-ref decision. The SWML page's own callback table also gained the `ask_request`/`ask_answer`
rows.

## Verification

- `tsp compile` (signalwire-rest) succeeds; OpenAPI regenerated with all 5 commands in the
  `command` enum and the `Calling.AISidecarCallbackPayload` webhook (16-member type enum confirmed).
- `tsp format` applied to all 4 changed REST specs.
- `fern check` — 0 errors (1 pre-existing color-contrast warning, unrelated).

---

# Phase 3 — Completeness audit + fixes (2026-06-09)

Full re-trace of the C source vs everything documented (REST + SWML). Detailed delta:
`temp/ai_sidecar_completeness_delta.md`. The param models (SWML + REST request models) were
confirmed complete and accurate; gaps were in the callback per-type field lists and a couple of
REST response specifics. Fixes applied:

**SWML callback table** (`ai_sidecar/index.mdx`) — added C-confirmed per-type fields:
- `request`: `iter`, `messages_count`, `messages_token_count`, `tool_choice`
- `thought` / `tool_call` / `tool_result`: `iter`
- `insight` / `ask_answer`: `iter`, `total_iters`
- `history_pruned`: `kept_count`
- `error.webhook_http_failure`: `curl_code`
- Added a note: `iter`/`total_iters` semantics, and that any event during an `ask` carries
  `ask_id` + `triggered_by: "ask"`.

(The REST `AISidecarCallbackPayload` cross-links to this table for per-type fields, so the same
fix covers both surfaces.)

**REST** (`requests.tsp`) — clarified the `calling.ai_sidecar.status` response is an opaque
`+OK key=value` text line (`running`, `ticks`, `insights`, `skips`, `tools`, `errors`,
`in_tokens`, `out_tokens`, `history_size`, `event_log_bytes`), not structured JSON. `ask`'s
`ask_id` response was already documented in prose. The endpoint uses one shared `CallResponse`,
so per-command response models aren't modeled (consistent with every other command).

**SWML params** (`params.tsp`) — added C-enforced ranges to `speech_timeout` (0–600000),
`vad_silence_ms` (0–60000), `vad_thresh` (0–10000), matching the in-spec convention. Note: like the
other `integer | SWMLVar` params (`idle_timeout_ms` etc.), the numeric bounds live in the `@doc`
(`Range: …`) — the json-schema emitter does not propagate min/max into a union member, so this is
consistent with existing behavior.

**Confirmed correct, no change:** 16-type callback enum complete; all 15 SWAIG action keys; all 5
stop_reasons / 5 error_reasons; all enums (`customer_role`, `direction`, `speech_engine`); SWAIG
sub-object correctly omits unparsed keys (`includes`, `native_functions`, `aliases`, `data_map`).

**Intentional omissions (internal):** `event_url` (not in SWML whitelist), `deepgram_url_override`
/ `deepgram_key_override`, `web_hook_auth_pass` alias, `swml`/`async` relay-envelope fields.

Verified: `tsp compile` (SWML + REST) ✓; `fern check` 0 errors.

---

# Phase 4 — SWAIG tool webhook: sidecar vs AI (2026-06-09)

Question: can the sidecar's SWAIG tool webhook share one callback entry with the regular `ai`
method's, or do they need two? Full C comparison: `temp/ai_sidecar_swaig_webhook_compare.md`.

**Verdict: NOT 1:1 → two separate entries.** Decisive differences (file:line in the compare doc):
- Sidecar POST is only `{function, argument, call_id, global_data, channel_data}`
  (`sidecar_dispatch_webhook`, sidecar.c:685); the regular AI POST (`execute_user_function`,
  actions.c:1845) carries ~24 fields (`app_name`, `version`, `content_type`, `argument_desc`,
  `meta_data*`, `ai_session_id`, `project_id`/`space_id`, `SWMLVars`, `call_log`, …).
- Caller info: sidecar nests it in `channel_data` (`caller_id_number`, `destination_number`); AI
  sends flat `caller_id_name`/`caller_id_num` (different name), no `channel_data`.
- `say` is report-only in the sidecar (no TTS); AI speaks. Action-key sets differ (15 vs ~28).
- Sidecar gates all actions behind `act_on_channel`; AI has no read-only mode.
- Only `function`, `argument` (`{parsed,raw,substituted}`), `call_id`, `global_data` overlap identically.

**Changes:**
- Added `AISidecarToolWebhookPayload` (`webhooks.tsp`) + `@webhook("aiSidecarToolWebhook", …)` +
  nav entry `subpackage_calls.ai_sidecar_tool_webhook`. Documents the inbound request payload; the
  response/action contract is cross-linked to the SWML page (the `@webhook` decorator captures only
  the request payload).
- **Fixed pre-existing inaccuracies** in the SWML "Tool webhook contract" Request section (these were
  wrong before this work): `argument` is `{parsed, raw, substituted}` (not "a JSON string or
  `arguments` object"); removed the top-level `project_id`/`space_id` the sidecar does **not** send;
  added top-level `call_id`; added a Note contrasting the narrower sidecar shape vs the `ai` SWAIG webhook.

Not done (separate scope): the regular `ai` SWAIG tool webhook remains prose-only — adding its own
`@webhook` entry is an `ai`-method task, not sidecar work.

Verified: `tsp compile` (REST) ✓; `aiSidecarToolWebhook` present in generated OpenAPI with the
C-verified field set; `fern check` 0 errors.

---

# Phase 5 — Both tool-webhook entries + WebhookPayloadSnippet wiring (2026-06-09)

Made the **two** SWAIG tool-webhook entries (sidecar already existed; added the regular `ai` one) and
surfaced the callbacks on the SWML pages via the `<WebhookPayloadSnippet>` component, then re-verified
against the C source.

**New entry — `aiSwaigToolWebhook`** (`AiSwaigToolWebhookPayload`, webhooks.tsp + `@webhook` +
nav `subpackage_calls.ai_swaig_tool_webhook`). Modeled exactly from `execute_user_function`
(actions.c:2005-2133): 27 fields, required = the always-added ones (`function`, `argument`,
`argument_desc`, `description`, `call_id`, `ai_session_id`, `app_name`, `channel_active/offhook/ready`,
`content_type:"text/swaig"`, `version` (`SWAIG_VERSION`="2.0"), `content_disposition:"SWAIG Function"`),
optional = the conditional ones (`global_data`, `caller_id_name`/`caller_id_num`, `project_id`/`space_id`,
`meta_data_token`/`meta_data`, `conversation_id`, `fatal_error`/`error_reason`, `SWMLVars`/`SWMLCall`,
`call_log`/`raw_call_log`).

**Source re-verification (the reason for this pass):** scanning the *full* `post_data` assembly
(actions.c:2005-2216) caught fields beyond the initial slice — `params` (line 2025, `#if 0` disabled),
and `args`/`input` (2199/2204). Confirmed `args`/`input` are added **only** inside the
`if (sh->data_map)` branch, which is processed locally (`process_data_map`) and does **not** POST a
webhook; the webhook POST is the `else` branch without them. So they are correctly excluded. `SWAIG_VERSION`
confirmed `"2.0"` (mod_openai.h:34).

**Snippet wiring (`<WebhookPayloadSnippet>`):**
- Sidecar page: `aiSidecarCallback` under "Callback body shape", `aiSidecarToolWebhook` under "Tool
  webhook contract" (replacing the hand-maintained field list, eliminating drift), each with a link to
  its generated webhook page.
- `ai` method page (`ai/swaig/functions`): new "Tool webhook" section embedding `aiSwaigToolWebhook`.

**Callback envelope precision fix:** verified `get_call_info` (ai_utils.c:198-221) — `call_info`'s
`content_type:"text/json"`, `content_disposition`, `conversation_type:"voice"`, and `call_id` are always
present (only `project_id`/`space_id` are conditional). Tightened those three from optional to required in
`AISidecarCallbackPayload`. (Note: the sidecar *event* webhook uses `text/json` via `get_call_info`,
whereas the `ai` *tool* webhook uses `text/swaig` inline — correctly different in the two models.)

Verified: `tsp compile` ✓; 3 webhooks (`aiSidecarCallback`, `aiSidecarToolWebhook`, `aiSwaigToolWebhook`)
in generated OpenAPI; `AiSwaigToolWebhookPayload` 27 fields match actions.c; `fern check` 0 errors.
