# SWML reuse gaps — debts to true up in the SWML specs

The Relay `calling.ai` / `calling.amazon_bedrock` AI config now **reuses the SWML
`SWML.Calling.*` models directly** (commit on branch `Devon/relay-asyncapi-tooling`), making
**SWML the single source of truth** for the shared AI-agent config object (one FreeSWITCH
`mod_openai` parser, `create_app_from_json`, serves both surfaces).

Per the agreed approach we reused SWML **as-is**, even where SWML is currently *less* correct
or complete than Relay's prior hand-rolled models. This file records every such gap so a
later **SWML-truing effort** can fix the SWML specs (`specs/swml/calling/Methods/ai/**`).
Until then, the Relay AI reference inherits these SWML imperfections.

---

## A. Regressions — SWML should be corrected to restore prior Relay fidelity

### A1. SWAIG basic-auth fields missing (systematic)
The SWML SWAIG models drop the basic-auth credential fields that Relay documented. Affects:
- **`SWAIGDefaults`** (`specs/swml/calling/Methods/ai/swaig/defaults.tsp`) — has only `web_hook_url`.
  Missing: `web_hook_auth_user`, `web_hook_auth_password`, `meta_data_token`, `meta_data`.
- **`SWAIGFunctionBase`** (`specs/swml/calling/Methods/ai/swaig/functions/main.tsp`) — has
  `web_hook_url`. Missing: `web_hook_auth_user`, `web_hook_auth_password`.

**Fix:** add `web_hook_auth_user?` / `web_hook_auth_password?` to both, and
`meta_data_token?` / `meta_data?` to `SWAIGDefaults`. (Basic auth may also be inlined as
`username:password@url`, but the discrete fields were documented and accepted.)

### A2. `Hint` wrongly requires `pattern` / `replace`
`SWML.Calling.Hint` (`specs/swml/calling/Methods/ai/ai_hints.tsp`) marks `pattern` and
`replace` **required**. The engine treats them **optional** (a hint can be a bare phrase),
and Relay's prior `AiHint` modeled them optional. Reusing SWML as-is now wrongly requires them.

**Fix:** make `pattern?` and `replace?` optional in SWML `Hint`.

### A3. `AIPrompt` / `AIPostPrompt` missing `barge_confidence` and `model`
`AIPromptBase` (`specs/swml/calling/Methods/ai/prompt/main.tsp`) lacks two per-prompt fields
Relay documented:
- **`barge_confidence`** — engine-confirmed: read as a prompt setting in `mod_openai`
  (`settings.c:413`, alongside `confidence`).
- **`model`** — per-prompt LLM model override (Relay documented it; confirm against the engine
  during the SWML fix).

**Fix:** add `barge_confidence?` (and `model?`, pending engine confirmation) to `AIPromptBase`.

---

## B. Expansions — correct, now exposed (informational, not regressions)

Reusing SWML *adds* engine-accepted surface the prior Relay hand-replica omitted. These are
improvements (the engine accepts them on the Relay path too), just larger:
- **Prompt:** `text` **XOR** `pom` (Prompt Object Model) forms, plus `contexts` (context-step
  flows) and `max_tokens`. Previously Relay modeled only a flat `{ text }`.
- **SWAIG functions:** typed `parameters` (full JSON-schema `SchemaType` tree) and `data_map`
  (expressions / webhooks / output / actions); previously `Record<unknown>`. Plus `fillers`,
  `skip_fillers`, `wait_file`, `wait_file_loops`, `wait_for_fillers`.
- **Languages:** the `LanguageParams` TTS-tuning tree (stability/similarity/speed/…), `emotion`,
  `speed`, `function_fillers`/`speech_fillers`; previously only `name`/`code`/`voice`/`model`.
- **Hints:** now `(string | Hint)[]` (bare-string hints allowed), matching SWML.

---

## C. Out of scope this pass (separate efforts)

- `live_transcribe` / `live_translate` action shapes — reusable, but the SWML models carry
  markup-only bare-string arms (`"stop"`/`"summarize"`) that need per-action reconciliation.
- Non-AI shared shapes (play/ringback, record, tap, detect) — a **different backend**
  (FreeSWITCH core / `mod_infrastructure`), not `create_app_from_json`; each needs its own
  source verification before reuse.
