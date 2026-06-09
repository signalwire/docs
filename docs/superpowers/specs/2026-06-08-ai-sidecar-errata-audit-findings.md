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
