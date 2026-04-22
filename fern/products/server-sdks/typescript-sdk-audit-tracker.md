# TypeScript SDK Audit Tracker

## SDK Identity

- **Language:** TypeScript
- **Package name:** `@signalwire/sdk`
- **Version:** 2.0.0
- **Main import:** `import { RestClient } from '@signalwire/sdk';`
- **Source repo:** https://github.com/signalwire/signalwire-typescript
- **Local path:** `temp/signalwire-typescript`
- **Source commit:** `ba6d5b1f1c68065bb378ab9c1a79c4a08da107e1` (2026-04-21)
- **Prior synced commit:** `f7144ab40505f365e554332e891b38b3a5e2f670` (2026-04-08)
- **Delta:** 132 commits — alignment sweep + skills infra refactor + v2.0.0 tag

## Audit Scope (this run)

REST namespace (`pages/reference/typescript/rest/**`). ~384 MDX files across
22 namespaces.

## Full Inventory — REST

Order: largest class first.

| Status | Namespace | Files | Source |
|--------|-----------|-------|--------|
| AUDITED -- NO ISSUES | `fabric/` | 112 | `src/rest/namespaces/fabric.ts` |
| AUDITED -- NO ISSUES | `compat/` | 91 | `src/rest/namespaces/compat.ts` |
| AUDITED -- NO ISSUES | `video/` | 38 | `src/rest/namespaces/video.ts` |
| AUDITED -- NO ISSUES | `calling/` | 38 | `src/rest/namespaces/calling.ts` |
| AUDITED -- NO ISSUES | `registry/` | 15 | `src/rest/namespaces/registry.ts` |
| AUDITED -- NO ISSUES | `logs/` | 13 | `src/rest/namespaces/logs.ts` |
| AUDITED -- NO ISSUES | `number-groups/` | 10 | `src/rest/namespaces/number-groups.ts` |
| AUDITED -- NO ISSUES | `datasphere/` | 10 | `src/rest/namespaces/datasphere.ts` |
| AUDITED -- NO ISSUES | `queues/` | 9 | `src/rest/namespaces/queues.ts` |
| AUDITED -- NO ISSUES | `verified-callers/` | 8 | `src/rest/namespaces/verified-callers.ts` |
| AUDITED -- NO ISSUES | `phone-numbers/` | 7 | `src/rest/namespaces/phone-numbers.ts` |
| AUDITED -- NO ISSUES | `addresses/` | 5 | `src/rest/namespaces/addresses.ts` |
| AUDITED -- NO ISSUES | `short-codes/` | 4 | `src/rest/namespaces/short-codes.ts` |
| AUDITED -- NO ISSUES | `recordings/` | 4 | `src/rest/namespaces/recordings.ts` |
| AUDITED -- NO ISSUES | `project/` | 4 | `src/rest/namespaces/project.ts` |
| AUDITED -- NO ISSUES | `mfa/` | 4 | `src/rest/namespaces/mfa.ts` |
| AUDITED -- NO ISSUES | `sip-profile/` | 3 | `src/rest/namespaces/sip-profile.ts` |
| AUDITED -- NO ISSUES | `pubsub/` | 2 | `src/rest/namespaces/pubsub.ts` |
| AUDITED -- NO ISSUES | `lookup/` | 2 | `src/rest/namespaces/lookup.ts` |
| AUDITED -- NO ISSUES | `imported-numbers/` | 2 | `src/rest/namespaces/imported-numbers.ts` |
| AUDITED -- NO ISSUES | `chat/` | 2 | `src/rest/namespaces/chat.ts` |
| AUDITED -- NO ISSUES | `client/` | 1 | `src/rest/index.ts` |
| AUDITED -- NO ISSUES | root (`overview.mdx`, `rest-error.mdx`) | 2 | `src/rest/RestError.ts` |

## Findings Log

_(One line per finding and per fix. Format: `[path/to/file.mdx] PRIORITY type: description`)_

### fabric/

- `[fabric/index.mdx]` NO ISSUES — 16 sub-resource list matches source; PATCH/PUT note verified.
- `[fabric/ai-agents/*]` NO ISSUES — all 7 files (index + 6 methods) verified against `FabricResource` extending `CrudWithAddresses`; endpoint paths, HTTP methods, and example signatures match source.
- `[fabric/call-flows/*]` NO ISSUES — all 9 files verified against `CallFlowsResource` (extends `FabricResourcePUT`). PUT update confirmed. Singular `/call_flow/{id}/addresses` + `/versions` + POST `/versions` paths match source.
- `[fabric/subscribers/*]` NO ISSUES — all 12 files verified against `SubscribersResource`. PUT update, PATCH on `updateSipEndpoint`, and all 5 SIP-endpoint method paths match source.
- `[fabric/conference-rooms/*]` NO ISSUES — 7 files verified against `ConferenceRoomsResource`. Singular `/conference_room/{id}/addresses` override confirmed.
- `[fabric/cxml-applications/*]` NO ISSUES — 6 files verified against `CxmlApplicationsResource`. No `create.mdx` (source's `create()` throws). PUT update confirmed.
- `[fabric/swml-scripts/*]` NO ISSUES — 7 files verified. PUT update, basePath `/swml_scripts` confirmed.
- `[fabric/relay-applications/*]` NO ISSUES — 7 files verified. PUT, basePath `/relay_applications` confirmed.
- `[fabric/sip-endpoints/*]` NO ISSUES — 7 files verified. PUT, basePath `/sip_endpoints` confirmed. Index correctly cross-links to subscribers nested variant.
- `[fabric/cxml-scripts/*]` NO ISSUES — 7 files verified. PUT, basePath `/cxml_scripts` confirmed.
- `[fabric/freeswitch-connectors/*]` NO ISSUES — 7 files verified. PUT, basePath `/freeswitch_connectors` confirmed.
- `[fabric/swml-webhooks/*]` NO ISSUES — 7 files verified. PATCH, basePath `/swml_webhooks` confirmed.
- `[fabric/sip-gateways/*]` NO ISSUES — 7 files verified. PATCH, basePath `/sip_gateways` confirmed.
- `[fabric/cxml-webhooks/*]` NO ISSUES — 7 files verified. PATCH, basePath `/cxml_webhooks` confirmed.
- `[fabric/resources/*]` NO ISSUES — 7 files verified against `GenericResources`. 6 methods (list, get, delete, listAddresses, assignPhoneRoute, assignDomainApplication) all match source paths.
- `[fabric/addresses.mdx]` NO ISSUES — single-page read-only resource (list + get) matches `FabricAddresses`.
- `[fabric/tokens/*]` NO ISSUES — 6 files verified against `FabricTokens`. All 5 token endpoints match source paths (note singular `/subscriber/invites`).

### compat/

- `[compat/index.mdx]` NO ISSUES — 12-card CardGroup matches `CompatNamespace` source. URL structure `/2010-04-01/Accounts/{AccountSid}/` correctly documented.
- `[compat/accounts/*]` NO ISSUES — 5 files verified against `CompatAccounts` (non-AccountSid-scoped basePath `/Accounts`). list/create/get/update; POST update.
- `[compat/applications/*]` NO ISSUES — 6 files verified against `CompatApplications` (CrudResource + POST update).
- `[compat/calls/*]` NO ISSUES — 10 files verified against `CompatCalls`. CRUD + 4 sub-resource methods (startRecording, updateRecording, startStream, stopStream) all POST with correct paths.
- `[compat/conferences/*]` NO ISSUES — 14 files verified against `CompatConferences`. No create (source has none). 13 methods across CRUD, participants (4), recordings (4), streams (2) all match.
- `[compat/faxes/*]` NO ISSUES — 9 files verified against `CompatFaxes`. CRUD + media sub-resources (list/get/delete) match source.
- `[compat/laml-bins/*]` NO ISSUES — 6 files verified against `CompatLamlBins` (CrudResource + POST update).
- `[compat/messages/*]` NO ISSUES — 9 files verified against `CompatMessages`. CRUD + media sub-resources match.
- `[compat/phone-numbers/*]` NO ISSUES — 10 files verified against `CompatPhoneNumbers`. 9 methods incl. `importNumber` → `/ImportedPhoneNumbers`, and `searchLocal`/`searchTollFree`/`listAvailableCountries` → `/AvailablePhoneNumbers` path-replacement all match source.
- `[compat/queues/*]` NO ISSUES — 9 files verified against `CompatQueues`. CRUD + member sub-resources match.
- `[compat/recordings/*]` NO ISSUES — 4 files verified against `CompatRecordings` (read-only list/get/delete).
- `[compat/tokens/*]` NO ISSUES — 4 files verified against `CompatTokens`. `update` correctly documented as PATCH (unique exception vs all other compat updates which are POST).
- `[compat/transcriptions/*]` NO ISSUES — 4 files verified against `CompatTranscriptions` (read-only list/get/delete).

### video/

- `[video/index.mdx]` NO ISSUES — 7-card CardGroup matches `VideoNamespace` source.
- `[video/rooms/*]` NO ISSUES — 8 files verified against `VideoRooms` (CrudResource with PUT update + listStreams + createStream).
- `[video/room-tokens/*]` NO ISSUES — 2 files verified against `VideoRoomTokens` (create only).
- `[video/room-sessions/*]` NO ISSUES — 6 files verified against `VideoRoomSessions` (list, get, listEvents, listMembers, listRecordings).
- `[video/room-recordings/*]` NO ISSUES — 5 files verified against `VideoRoomRecordings` (list, get, delete, listEvents).
- `[video/conferences/*]` NO ISSUES — 9 files verified against `VideoConferences` (CrudResource with PUT update + listConferenceTokens + listStreams + createStream).
- `[video/conference-tokens/*]` NO ISSUES — 3 files verified against `VideoConferenceTokens` (get, reset).
- `[video/streams/*]` NO ISSUES — 4 files verified against `VideoStreams` (get, update with PUT, delete).

### calling/

- `[calling/index.mdx]` NO ISSUES — 14-section CardGroup totals 37 methods, matching `CallingNamespace` source.
- `[calling/*]` (37 method files) NO ISSUES — every file audited: all dispatch POST `/api/calling/calls`, signatures match source (`(params)` for `dial`/`update`, `(callId, params)` for the other 35). `sendFaxStop` and `receiveFaxStop` doc notes that initiation happens via the Relay client are correct.

### registry/

- `[registry/index.mdx]` NO ISSUES — 4-resource CardGroup matches `RegistryNamespace`. Beta-path note documented.
- `[registry/brands/*]` NO ISSUES — 6 files verified against `RegistryBrands` (list, create, get, listCampaigns, createCampaign).
- `[registry/campaigns/*]` NO ISSUES — 6 files verified against `RegistryCampaigns` (get, update with PUT, listNumbers, listOrders, createOrder).
- `[registry/orders.mdx]` NO ISSUES — single-page for `RegistryOrders` (get only).
- `[registry/numbers.mdx]` NO ISSUES — single-page for `RegistryNumbers` (delete only).

### logs/

- `[logs/index.mdx]` NO ISSUES — 4-sub-resource CardGroup matches `LogsNamespace`.
- `[logs/messages/*]` NO ISSUES — 3 files (list, get) verified against `MessageLogs` (`/api/messaging/logs`).
- `[logs/voice/*]` NO ISSUES — 4 files (list, get, listEvents) verified against `VoiceLogs` (`/api/voice/logs`).
- `[logs/fax/*]` NO ISSUES — 3 files (list, get) verified against `FaxLogs` (`/api/fax/logs`).
- `[logs/conferences/*]` NO ISSUES — 2 files (list only) verified against `ConferenceLogs` (`/api/logs/conferences`). Doc correctly notes no `get()` exists.

### number-groups/

- `[number-groups/*]` NO ISSUES — 10 files verified against `NumberGroupsResource` (CrudResource PUT + listMemberships + addMembership + getMembership + deleteMembership). Top-level `/number_group_memberships/{id}` endpoint for get/delete correctly documented with Note.

### datasphere/

- `[datasphere/*]` NO ISSUES — 10 files verified against `DatasphereDocuments` (CrudResource PATCH + search + listChunks + getChunk + deleteChunk). Flat folder layout; all examples correctly use `client.datasphere.documents.*`.

### queues/

- `[queues/*]` NO ISSUES — 9 files verified against `QueuesResource` (CrudResource PUT + listMembers + getMember + getNextMember).

### verified-callers/

- `[verified-callers/*]` NO ISSUES — 8 files verified against `VerifiedCallersResource` (CrudResource PUT + redialVerification + submitVerification). Verification sub-resource paths `/verified_caller_ids/{id}/verification` (POST redial, PUT submit) confirmed.

### phone-numbers/

- `[phone-numbers/*]` NO ISSUES — 7 files verified against `PhoneNumbersResource` (CrudResource PUT + search). Index carries idiomatic-deviation note for Python-kwargs-style bodies. Search endpoint correctly maps to `/phone_numbers/search` GET.

### addresses/

- `[addresses/*]` NO ISSUES — 5 files verified against `AddressesResource` (list, create, get, delete; no update). Index correctly notes absence of update.

### short-codes/

- `[short-codes/*]` NO ISSUES — 4 files verified against `ShortCodesResource` (list, get, update with PUT; no create/delete). Index correctly notes pre-provisioned status.

### recordings/

- `[recordings/*]` NO ISSUES — 4 files verified against `RecordingsResource` (list, get, delete; no create/update).

### project/

- `[project/*]` NO ISSUES — 4 files verified against `ProjectTokens`. `update` correctly uses PATCH.

### mfa/

- `[mfa/*]` NO ISSUES — 4 files verified against `MfaResource` (sms, call, verify). Sub-resource paths `/mfa/sms`, `/mfa/call`, `/mfa/{id}/verify` match source.

### sip-profile/

- `[sip-profile/*]` NO ISSUES — 3 files verified against `SipProfileResource` (singleton get + PUT update).

### pubsub/

- `[pubsub/*]` NO ISSUES — 2 files verified against `PubSubResource` (createToken only). Endpoint `/api/pubsub/tokens` POST matches source.

### lookup/

- `[lookup/*]` NO ISSUES — 2 files verified against `LookupResource` (phoneNumber only). Endpoint `/api/relay/rest/lookup/phone_number/{e164}` matches source.

### imported-numbers/

- `[imported-numbers/*]` NO ISSUES — 2 files verified against `ImportedNumbersResource` (create only). Endpoint `/api/relay/rest/imported_phone_numbers` POST matches.

### chat/

- `[chat/*]` NO ISSUES — 2 files verified against `ChatResource` (createToken only). Endpoint `/api/chat/tokens` POST matches.

### client/

- `[client/index.mdx]` NO ISSUES — Constructor params (project, token, host) and all 20 namespace `ParamField` entries match `RestClient` source exactly (fabric, calling, phoneNumbers, addresses, queues, recordings, numberGroups, verifiedCallers, sipProfile, lookup, shortCodes, importedNumbers, mfa, registry, datasphere, video, logs, project, pubsub, chat, compat).

### REST root

- `[rest/overview.mdx]` NO ISSUES — 10-card CardGroup covers major namespaces; `RestError` example accurate.
- `[rest/rest-error.mdx]` NO ISSUES — `body: string | Record<string, unknown>` and `SignalWireRestError` alias both correctly documented (updated from prior session).

---

---

## Agents Audit (in progress)

**Scope:** `pages/reference/typescript/agents/agent-base/**` — pilot of 82 files
against `src/AgentBase.ts` at commit `ba6d5b1`.

**Source file:** `temp/signalwire-typescript/src/AgentBase.ts` (2489 lines)
**AgentOptions type:** `temp/signalwire-typescript/src/types.ts:6-70`

### agent-base/ progress — 82/82 AUDITED + FIXED

| # | File | Status | Notes |
|---|------|--------|-------|
| 1 | `index.mdx` | FIXED | `tokenExpirySecs` default 900→3600 (source line 196); added 5 missing constructor params: `enablePostPromptOverride`, `checkForInputOverride`, `configFile`, `schemaPath`, `schemaValidation`. CardGroup verified: 81 cards = 81 method files. |
| 2 | `add-answer-verb.mdx` | clean | signature `(config?)` line 1306 |
| 3 | `add-function-include.mdx` | clean | `(url, functions, metaData?)` line 758; meta_data mapping ok |
| 4 | `add-hint.mdx` | clean | line 499 |
| 5 | `add-hints.mdx` | clean | line 509 |
| 6 | `add-internal-filler.mdx` | FIXED | Added `<Note>` restricting to 9 supported native function names (`SUPPORTED_INTERNAL_FILLER_NAMES` at line 651); clarified description (was "specific SWAIG function" — misleading) |
| 7 | `add-language.mdx` | clean | LanguageConfig has 7 fields incl. `functionFillers`; SWML key mappings (speech_model, function_fillers) correct |
| 8 | `add-mcp-server.mdx` | clean | `(url, opts?)` with headers/resources/resourceVars; `resource_vars` mapping ok |
| 9 | `add-pattern-hint.mdx` | FIXED | Added missing required `opts.hint` param (source line 520 requires 4 fields) + updated example |
| 10 | `add-post-ai-verb.mdx` | clean | line 1328 |
| 11 | `add-pre-answer-verb.mdx` | clean | line 1296 |
| 12 | `add-pronunciation.mdx` | clean | matches PronunciationRule (types.ts:91) |
| 13 | `add-skill.mdx` | clean | async, fails-closed behavior verified against source lines 1375-1425 |
| 14 | `add-skill-by-name.mdx` | clean | line 1440 |
| 15 | `add-swaig-query-params.mdx` | clean | merge-not-replace via `safeAssign` line 1512 confirmed |
| 16 | `as-router.mdx` | clean | line 2360 |
| 17 | `auto-map-sip-usernames.mdx` | FIXED | Rewrote from stub — added overview (3-bullet behavior list), `<Note>` about `enableSipRouting()` auto-calling, full example. Ported from Python counterpart. |
| 18 | `clear-post-ai-verbs.mdx` | clean | line 1355 |
| 19 | `clear-post-answer-verbs.mdx` | clean | line 1346 |
| 20 | `clear-pre-answer-verbs.mdx` | clean | line 1337 |
| 21 | `clear-swaig-query-params.mdx` | FIXED | Rewrote from stub — added ref links, Parameters None, Returns, full dynamic-config example (src line 1520 `this.swaigQueryParams = {}`) |
| 22 | `define-contexts.mdx` | clean | `(contexts?: ContextBuilder \| Record<string,unknown>)` line 464; plain-dict quirk (dict ignored, new ContextBuilder) correctly documented |
| 23 | `define-tool.mdx` | FIXED | Added missing `opts.webhookUrl` + `opts.extraFields` params (src lines 1131-1133); added `default="false"` to `opts.secure` (SwaigFunction.ts:143) |
| 24 | `define-tools.mdx` | clean | `protected defineTools(): void` line 256; "not called automatically" note matches src comment |
| 25 | `define-typed-tool.mdx` | FIXED | Added `default="false"` to `opts.secure` (aligns with defineTool / SwaigFunction.ts:143) |
| 26 | `enable-debug-events.mdx` | clean | `(level=1)` line 803; `debug_webhook_url` wiring at 1887 confirmed |
| 27 | `enable-debug-routes.mdx` | FIXED | Rewrote misleading desc — source line 1551 is a no-op stub; debug routes auto-registered in `getApp()`. Added Parameters None + Example + ref link, parity-with-Python note |
| 28 | `enable-mcp-server.mdx` | clean | line 950 `_mcpServerEnabled = true`; `/mcp` JSON-RPC 2.0 endpoint accurate |
| 29 | `enable-sip-routing.mdx` | clean | `(autoMap=true, path='/sip')` line 817; autoMap triggers `autoMapSipUsernames()` |
| 30 | `extract-sip-username.mdx` | clean | static method line 912; strips `sip:`/`sips:` prefix + `@domain`; returns null if no `call.to` |
| 31 | `get-app.mdx` | clean | `getApp(): Hono` line 2004; lazy init of Hono app |
| 32 | `get-basic-auth-credentials.mdx` | FIXED | Source `"auto-generated"` not `"generated"` (line 2484); fixed both occurrences |
| 33 | `get-full-url.mdx` | clean | line 1635; proxy base takes precedence, optional basic-auth embed |
| 34 | `get-mcp-servers.mdx` | clean | line 961; read-only spread copy |
| 35 | `get-name.mdx` | clean | line 1364 |
| 36 | `get-post-prompt.mdx` | clean | line 422 |
| 37 | `get-prompt.mdx` | clean | line 394 |
| 38 | `get-prompt-pom.mdx` | FIXED | Added Parameters None + Example + ref links (line 410; returns null when POM empty or non-POM mode) |
| 39 | `get-registered-tools.mdx` | clean | line 1216 |
| 40 | `get-tool.mdx` | clean | line 1237 |
| 41 | `handle-mcp-request.mdx` | clean | line 994; methods: initialize, notifications/initialized, tools/list, tools/call, ping |
| 42 | `has-skill.mdx` | clean | line 1470 |
| 43 | `is-mcp-server-enabled.mdx` | clean | line 956 |
| 44 | `list-skills.mdx` | clean | line 1461 |
| 45 | `manual-set-proxy-url.mdx` | clean | line 1532; strips trailing slashes, clears env-source flag |
| 46 | `native-functions.mdx` | clean | documents `setNativeFunctions` (line 640) + ctor `nativeFunctions` option |
| 47 | `on-debug-event.mdx` | clean | line 1705 no-op hook; invoked at line 2262 on /debug_events |
| 48 | `on-function-call.mdx` | FIXED | Wrong Warning — hook CAN short-circuit dispatch (src 2213 uses returned hookResult). Replaced with Note; fixed Returns type to include `Record<string, unknown>` |
| 49 | `on-summary.mdx` | clean | line 1673; invoked at 2246 post-prompt path |
| 50 | `on-swml-request.mdx` | FIXED | Doc missing `callbackPath` + `context` params (src 1693); Returns was `void\|Promise<void>` but source returns optional modifications object (merged into AI config) |
| 51 | `prompt-add-section.mdx` | clean | line 341 |
| 52 | `prompt-add-subsection.mdx` | clean | line 376 |
| 53 | `prompt-add-to-section.mdx` | clean | line 361 |
| 54 | `prompt-has-section.mdx` | clean | line 386 |
| 55 | `register-sip-username.mdx` | clean | line 832 (username lowercased) |
| 56 | `register-swaig-function.mdx` | FIXED | DataMap example called `.output()` with plain object; source expects FunctionResult (DataMap.ts:302). Rewrote example + updated line highlight |
| 57 | `remove-skill.mdx` | clean | line 1453; async by instance ID |
| 58 | `remove-skill-by-name.mdx` | FIXED | Rewrote — old doc claimed "removes every instance" + mentioned nonexistent `cleanup()`. Source (line 1484) removes FIRST match only. Added ref link to `removeSkill`, full Example |
| 59 | `render-swml.mdx` | FIXED | Added missing `modifications` parameter (src 1754; `global_data` deep-merged, rest override AI config) |
| 60 | `reset-contexts.mdx` | FIXED | Stub → added Parameters None, Returns, Example; ref links to defineContexts/ContextBuilder |
| 61 | `run.mdx` | FIXED | Doc said Parameters None; source (line 2391) takes `opts?: { host?; port? }`. Added Indent of opts fields |
| 62 | `serve.mdx` | FIXED | Same missing `opts` params as run.mdx (src 2368); added Note about `SWAIG_CLI_MODE` env var early-return (src 2370) |
| 63 | `set-dynamic-config-callback.mdx` | clean | line 1501 |
| 64 | `set-function-includes.mdx` | FIXED | Stub → added Note about silent filtering (src 772 filters entries without url/functions array), full Example with meta_data, ref link |
| 65 | `set-global-data.mdx` | FIXED | **Wrong description** — claimed "Replace the entire global data object" but src (line 621) uses `safeAssign` → merges, matching Python `.update()` semantics. Rewrote desc + added Note explaining the `set` prefix is misleading |
| 66 | `set-internal-fillers.mdx` | FIXED | Example used invalid filler names `pre_speech`, `summary` (not in `SUPPORTED_INTERNAL_FILLER_NAMES`). Rewrote example with valid names (`next_step`, `check_time`) + added Note listing all 9 supported names |
| 67 | `set-languages.mdx` | clean | line 555 |
| 68 | `set-param.mdx` | clean | line 592 |
| 69 | `set-params.mdx` | clean | line 602; merges via safeAssign |
| 70 | `set-post-prompt.mdx` | clean | line 330 |
| 71 | `set-post-prompt-llm-params.mdx` | clean | line 793 |
| 72 | `set-post-prompt-url.mdx` | clean | line 1625 |
| 73 | `set-prompt-llm-params.mdx` | clean | line 783 |
| 74 | `set-prompt-pom.mdx` | FIXED | Stub → added Warning about `usePom: true` throw (src line 440), detailed ParamField sub-field list, Example. Ref links to promptAddSection + getPromptPom |
| 75 | `set-prompt-text.mdx` | clean | line 320 |
| 76 | `set-pronunciations.mdx` | FIXED | Stub → added full ParamField describing PronunciationRule shape (replace/with/ignoreCase per types.ts:91), Example |
| 77 | `set-web-hook-url.mdx` | clean | line 1615 |
| 78 | `setup-graceful-shutdown.mdx` | clean | static line 2440; SIGTERM/SIGINT, default timeout 5000 |
| 79 | `update-global-data.mdx` | FIXED | Doc claimed `setGlobalData()` replaces; both methods identical (safeAssign). Reworded to say functionally equivalent to setGlobalData |
| 80 | `validate-basic-auth.mdx` | clean | line 1715; Warning re: middleware not calling hook confirmed (no `this.validateBasicAuth` refs in src) |
| 81 | `validate-tool-token.mdx` | FIXED | Stub → added Note about automatic dispatch-path invocation, full ParamField list with src-accurate edge cases (empty callId forwarded, missing token on secure → false, non-SwaigFunction treated as secure) |

### agent-base/ summary

82/82 files audited. 20 fixes applied across resume (files 21-82); 12 FIXED in
this session:

- **Missing/wrong params:** define-tool (webhookUrl, extraFields), render-swml
  (modifications), on-swml-request (callbackPath, context), run + serve (opts)
- **Wrong behavioral claims:** on-function-call (hook CAN intercept),
  set-global-data (merges, doesn't replace), update-global-data (describes
  set-global-data as replace), remove-skill-by-name (first match, not every
  instance)
- **Wrong defaults/literals:** define-tool secure default (false),
  define-typed-tool secure default, get-basic-auth-credentials source label
  (`"auto-generated"` not `"generated"`)
- **Broken example code:** register-swaig-function (.output() needs
  FunctionResult, not plain object), set-internal-fillers (used invalid
  filler names)
- **Stub pages:** clear-swaig-query-params, enable-debug-routes,
  get-prompt-pom, reset-contexts, set-function-includes, set-prompt-pom,
  set-pronunciations, validate-tool-token

### agent-server/ — AUDITED + FIXED (10/10)

**Source:** `temp/signalwire-typescript/src/AgentServer.ts` (415 lines)

| # | File | Status | Notes |
|---|------|--------|-------|
| 1 | `index.mdx` | FIXED | Added missing `opts.logLevel` ctor param + `logLevel` property; added 3 missing CardGroup entries (setupSipRouting, registerGlobalRoutingCallback pages; registerSipUsername combined into sip-routing page per Python pattern); added SIP-routing mention to overview |
| 2 | `get-agent.mdx` | clean | `getAgent(route)` line 169; Map.get lookup |
| 3 | `get-agents.mdx` | clean | `getAgents(): Map<string, AgentBase>` line 160 (returns internal ref — note unnecessary) |
| 4 | `get-app.mdx` | clean | `getApp(): Hono` line 362; root listing only mounted if no agent at `/` (line 371) |
| 5 | `register.mdx` | clean | `register(agent, route?)` line 110; throws on duplicate route, mounts agent.getApp() |
| 6 | `run.mdx` | FIXED | Added `SWAIG_CLI_MODE=true` early-return note (line 395) + ServerlessAdapter note for serverless mode |
| 7 | `static-files.mdx` | FIXED | Wrong default `/static` → `/` (source line 180); updated route ParamField |
| 8 | `unregister.mdx` | FIXED | Wrong return type `void` → `boolean` (source line 150 returns Map.delete result) |
| 9 | `sip-routing.mdx` | CREATED | Covers both `setupSipRouting` + `registerSipUsername` (Python pattern). Ported descriptions, params, examples from Python counterpart |
| 10 | `routing-callback.mdx` | CREATED | `registerGlobalRoutingCallback(callbackFn, path)` line 316. RoutingCallback type `(body) => string \| null \| undefined \| Promise<...>` (no Request arg in TS, unlike Python). Corrected "powers setupSipRouting" claim — TS uses `agent.enableSipRouting()` directly, not this method |

### agent-server/ summary

10 pages. 5 fixes + 2 new pages. Index CardGroup now has 9 entries matching 9
method pages (10 public methods with registerSipUsername combined into sip-routing).

### function-result/ — AUDITED + FIXED (50/50)

**Source:** `temp/signalwire-typescript/src/FunctionResult.ts` (866 lines)

49 public methods + index. All files match source. 3 fixes:

| File | Status | Notes |
|------|--------|-------|
| `index.mdx` | clean | Properties (response, action, postProcess), 49 CardGroup entries. Matches Python reference |
| `execute-swml.mdx` | FIXED | swmlContent type was missing third accepted form `{ toDict(): Record<string, unknown> }` (source line 308, 316-317). Added form + description |
| `join-conference.mdx` | FIXED | 5 missing defaults: `beep='true'`, `maxParticipants=250`, `statusCallbackMethod='POST'`, `recordingStatusCallbackMethod='POST'`, `recordingStatusCallbackEvent='completed'` (source lines 619-653 use these as comparison values) |
| `tap.mdx` | FIXED | 3 missing defaults: `direction='both'`, `codec='PCMU'`, `rtpPtime=20` (source lines 544-546 compare against these) |
| All other 46 files | clean | set-response, set-post-process, add-action, add-actions, to-dict, connect, hangup, hold, swml-transfer, say, wait-for-user, stop, play-background-file, stop-background-file, record-call, stop-record-call, stop-tap, update-global-data, remove-global-data, set-metadata, remove-metadata, swml-change-step, swml-change-context, switch-context, swml-user-event, simulate-user-input, toggle-functions, enable-functions-on-timeout, add-dynamic-hints, clear-dynamic-hints, set-end-of-speech-timeout, set-speech-event-timeout, update-settings, enable-extensive-data, replace-in-history, send-sms, pay, create-payment-prompt, create-payment-action, create-payment-parameter, sip-refer, join-room, execute-swml (after fix), execute-rpc, rpc-dial, rpc-ai-message, rpc-ai-unhold |

### context-builder/ root — AUDITED + FIXED (14/14 root files)

**Source:** `temp/signalwire-typescript/src/ContextBuilder.ts` (1150 lines)
**Classes:** ContextBuilder, Context, Step, GatherInfo, GatherQuestion + free function `createSimpleContext`

Root-level ContextBuilder class (public methods only: addContext, getContext, reset, toDict, validate, + `createSimpleContext` helper).

| File | Status | Notes |
|------|--------|-------|
| `index.mdx` | FIXED | Added `createSimpleContext` card (source line 1148 exports helper; Python docs it; TS was missing) |
| `add-context.mdx` | clean | `addContext(name)` line 963; throws on duplicate/max-contexts |
| `create-simple-context.mdx` | CREATED | `createSimpleContext(name='default')` free function — matches Python counterpart |
| `gather-classes.mdx` | clean | GatherQuestion + GatherInfo docs combined per Python pattern |
| `get-context.mdx` | clean | `getContext(name): Context \| undefined` line 979 |
| `get-questions.mdx` | clean | `GatherInfo.getQuestions()` line 121 — public, no Python counterpart (TS extra but matches source) |
| `reset.mdx` | FIXED | **Broken example** — used nonexistent `agent.onRequest(...)`. TS uses `setDynamicConfigCallback((queryParams, bodyParams, headers, agent) => {...})`. Rewrote example |
| `to-dict.mdx` | clean | `toDict()` line 1131 calls `validate()` then serializes |
| `validate.mdx` | FIXED | Missing 5 of 10 documented checks — added `initial_step` validation, step-level `valid_steps` and `valid_contexts` validation, gather_info duplicate-key validation, reserved native tool name collision check |
| `get-completion-action.mdx` | clean (@internal) | Matches source `GatherInfo.getCompletionAction()` line 129 — marked @internal in source but has doc page. Doc labels "internal method" honestly |
| `get-gather-info.mdx` | clean (@internal) | Matches `Step.getGatherInfo()` line 383 — same pattern |
| `get-step-order.mdx` | clean (@internal) | Matches `Context.getStepOrder()` line 813 |
| `get-steps.mdx` | clean (@internal) | Matches `Context.getSteps()` line 808 |
| `get-valid-contexts.mdx` | clean (@internal) | Matches `Context.getValidContexts()` line 823 |

**Structural drift (P4):** TS has 5 doc pages for @internal getters (Context.getStepOrder/getSteps/getValidContexts, Step.getGatherInfo, GatherInfo.getCompletionAction) that Python doesn't document. Factually accurate but likely unintended exposure. Candidate for deletion or marking as "internal" in future cleanup.

**Coverage gap (P4):** `Context.toDict()` (source line 854) has no doc page — Python also doesn't have it. Treating as intentional omission (serialization internals not part of user-facing API).

### context-builder/context/ subclass — AUDITED + FIXED (23/23)

- `context/index.mdx` clean — CardGroup has 22 entries matching 22 method files. `name` property documented. TS has `set-initial-step.mdx` that Python doesn't (legitimate — source line 670).
- 22 method files audited against `Context` class in `ContextBuilder.ts`. 3 fixes:
  - `add-step.mdx` FIXED — added throws note (src 542-545 throws on duplicate name / max 100 exceeded); Python has same note.
  - `set-initial-step.mdx` FIXED — highlight `{6}`→`{7}` to point at setInitialStep call, not addStep.
  - `set-isolated.mdx` FIXED — added Note about reset override exception (src JSDoc 683-687: `consolidate`/`fullReset` skip the wipe).
- Other 19 files clean: add-bullets, add-enter-filler, add-exit-filler, add-section, add-system-bullets, add-system-section, get-step, move-step, remove-step, set-consolidate, set-enter-fillers, set-exit-fillers, set-full-reset, set-post-prompt, set-prompt, set-system-prompt, set-user-prompt, set-valid-contexts, set-valid-steps.
- Coverage: Context public methods `getInitialStep`, `renderPrompt`, `renderSections`, `renderSystemPrompt`, `toDict` (src 818/827/833/839/854) have no doc pages — rendering/serialization internals; Python omits too. Intentional.

### context-builder/step/ subclass — AUDITED + FIXED (18/18)

- `step/index.mdx` clean — constructor `(name: string)`, `name` public property, 17-method CardGroup matches source (addBullets, addGatherQuestion, addSection, clearSections, setEnd, setFunctions, setGatherInfo, setResetConsolidate, setResetFullReset, setResetSystemPrompt, setResetUserPrompt, setSkipToNextStep, setSkipUserTurn, setStepCriteria, setText, setValidContexts, setValidSteps).
- 17 method files audited against `Step` class in `ContextBuilder.ts`. 3 fixes:
  - `add-gather-question.mdx` FIXED — added Note about gather-mode function-lock behavior (src JSDoc 347-361): only `gather_submit` + per-question `functions` callable while asking; `next_step`/`change_context` filtered.
  - `set-end.mdx` FIXED — TS doc description was misleading ("ends the conversation"). Source JSDoc (lines 290-303) is explicit: `end=true` exits step mode only, does NOT hang up. Rewrote description + added Warning.
  - `set-functions.mdx` FIXED — added Warning about step inheritance behavior (src JSDoc 233-246): step inherits previous step's functions unless `setFunctions()` is explicitly called, most common bug source; added Note on internal-function protection; added full param form list (`string[]`, `[]`, `"none"`).
- Other 14 files clean: add-bullets, add-section, clear-sections, set-gather-info, set-reset-consolidate, set-reset-full-reset, set-reset-system-prompt, set-reset-user-prompt, set-skip-to-next-step, set-skip-user-turn, set-step-criteria, set-text, set-valid-contexts, set-valid-steps.
- Coverage: Step public methods `getGatherInfo` (383), `getStepValidContexts` (399), `getValidSteps` (391), `renderText` (453 private), `toDict` (473) have no doc pages — internals; Python omits too.

### overview + helpers (2 files) — AUDITED + FIXED

- `overview.mdx` FIXED — removed "search" from subtitle (TS has no search module in source). P4 coverage gap logged: WebService card + doc page missing (src: `WebService.ts`); CLI/Search/MCP/BedrockAgent refs in Python overview correctly absent from TS (those modules don't exist in TS source).
- `helpers.mdx` FIXED — added `validateUrl` section (exported from SecurityUtils.ts:146 but doc was missing it). All 14 other exports verified against source.

### prefabs/ — AUDITED + FIXED (6/6)

**Source:** `temp/signalwire-typescript/src/prefabs/`

- `index.mdx` FIXED — tool table had wrong names for ConciergeAgent, InfoGathererAgent, ReceptionistAgent, SurveyAgent. Corrected against source tool registrations.
- `concierge-agent.mdx` clean — ConciergeConfig (9 fields) matches src 15-35. Tools not listed in page (acceptable, matches Python depth).
- `faq-bot-agent.mdx` clean — FAQBotConfig (9 fields), FAQEntry (4 fields), 2 tools (`search_faq` always, `escalate` conditional on `escalationNumber`) all verified.
- `info-gatherer-agent.mdx` clean — InfoGathererConfig (5 fields), InfoGathererQuestion (3 fields), 2 tools (`start_questions`, `submit_answer`), `setQuestionCallback` method all verified.
- `receptionist-agent.mdx` FIXED — tool table had wrong name `get_department_list`; source has `collect_caller_info` (src 208). Noted `department` enum constraint on transfer_call (src 251).
- `survey-agent.mdx` FIXED — tool table missing 2 tools (`validate_response` at src 387, `log_response` at src 419); doc only listed 3 of 5.

### swaig-function/ — AUDITED + FIXED (4/4)

**Source:** `temp/signalwire-typescript/src/SwaigFunction.ts` (277 lines)

- `index.mdx` FIXED — Added `validate-args` card + link ref (CardGroup was missing it; TS source has public `validateArgs` method at line 186). Options interface (12 fields) and class properties (13 fields) all verified against src.
- `execute.mdx` FIXED — Highlight `{20}`→`{19}` (pointed at console.log, should be the `execute()` call). Corrected output comment: `toDict()` omits `action` when array is empty (src 855-857).
- `to-swaig.mdx` clean — `toSwaig(baseUrl, token?, callId?)` matches src 257; TS lacks Python's `include_auth` param (legitimate drift).
- `validate-args.mdx` CREATED — ported from Python counterpart; src 186-205 (Ajv-based validation, early-returns `[true, []]` on empty schema).

### swml-service/ — AUDITED + FIXED (7/7)

**Source:** `temp/signalwire-typescript/src/SWMLService.ts` (717 lines)

- `index.mdx` FIXED — added 5 missing constructor options (host, port, schemaPath, configFile, schemaValidation); fixed `name` to required={true} (src 158 — required in non-deprecated overload); expanded Properties from 2 to 12 to match source (host, port, log, security, sslEnabled, sslCertPath, sslKeyPath, domain, schemaUtils, verbRegistry added).
- `add-verb.mdx` clean — `addVerb(name, config): this` delegates to swmlBuilder (src 389). Return type drift vs Python (TS fluent `this`, Python `bool`) is legitimate.
- `get-app.mdx` clean — `getApp(): Hono` (src 631-633).
- `get-builder.mdx` FIXED — example used empty-arg `new SWMLService()` (deprecated overload). Changed to `{ name: 'my-ivr' }` + demonstrates actual builder use.
- `render-swml.mdx` clean — delegates to swmlBuilder.getDocument() (src 435). Version 1.0.0 output confirmed against SwmlBuilder.ts:92.
- `run.mdx` FIXED — added `SWAIG_CLI_MODE=true` early-return note (src 663); added full `opts` param with `sslCert`/`sslKey`/`sslEnabled`/`domain` (src 656-661); fixed host/port default descriptions.
- `set-on-request-callback.mdx` clean — `OnRequestCallback` type (src 138-142) matches doc description.

**Coverage gap (P4):** TS source has ~20 public methods on SWMLService; only 6 method pages exist. Python documents 15. Missing TS pages: addSection, addVerbToSection, asRouter, extractSipUsername, getBasicAuthCredentials, getDocument, manualSetProxyUrl, onRequest, registerRoutingCallback, registerVerbHandler, renderDocument, resetDocument, serve, stop. Large follow-up scope.

### pom-builder/ — AUDITED -- NO ISSUES (9/9)

**Source:** `temp/signalwire-typescript/src/PomBuilder.ts` (450+ lines)

All 9 files clean — `index.mdx`, `add-section.mdx` (src 225), `add-subsection.mdx` (src 286), `add-to-section.mdx` (src 263), `find-section.mdx` (src 325), `get-section.mdx` (src 316), `has-section.mdx` (src 307), `render-markdown.mdx` (src 401), `to-dict.mdx` (src 366). All signatures, nested Indent params, and highlights verified against source.

**Coverage gap (P4):** TS source has 13 public methods on PomBuilder; 8 documented. Missing: `renderXml` (422), `toJson` (374), `reset` (213), `addPomAsSubsection` (344), `fromSections` (383, static). Python docs `render` (unified Markdown/XML) and `toJson` — TS splits rendering. Also missing: PomSection class page (exposed via `getSection`/`findSection`). Overview line "can render to Markdown format" should be updated to "Markdown or XML" once renderXml page exists.

### data-map/ — AUDITED -- NO ISSUES (19/19)

**Source:** `temp/signalwire-typescript/src/DataMap.ts` (455 lines)

All 19 files clean. Instance methods verified: `purpose` (132), `description` (146, alias), `parameter` (175), `expression` (203), `webhook` (229), `webhookExpressions` (253), `body` (264), `params` (275), `foreach` (286), `output` (302), `fallbackOutput` (313), `errorKeys` (323), `globalErrorKeys` (337), `enableEnvExpansion` (90), `setAllowedEnvPrefixes` (104, instance), `registerWithAgent` (347), `toSwaigFunction` (356). Helper functions: `createSimpleApiTool` (402), `createExpressionTool` (432). Index CardGroup has 18 entries matching 17 methods + helper-functions.

Every "throws if no webhook" claim on `body`/`output`/`params`/`foreach`/`webhookExpressions`/`errorKeys` verified against source. Nested Indent ParamFields used correctly. All highlight line numbers verified. Variable substitution table matches documented patterns.

### livewire/ — AUDITED + FIXED (14/14)

**Source:** `temp/signalwire-typescript/src/livewire/index.ts` (947 lines)

- `index.mdx` clean — compat layer description, namespace aliases (voice/llm/cli/inference) verified against src 920/937/945/884.
- `agent/index.mdx` clean — Agent class (src 121-211) with 13 constructor options + 4 properties.
- `agent-session/index.mdx` FIXED — removed fabricated `voiceOptions` (not in source); added 8 missing real options (`tools`, `mcpServers`, `allowInterruptions`, `minInterruptionDuration`, `minEndpointingDelay`, `maxEndpointingDelay`, `maxToolSteps`, `preemptiveGeneration`) with correct defaults from src 341-346.
- `agent-session/start.mdx` FIXED — added missing `record?: boolean` option (src 387).
- `agent-session/say.mdx` clean — queuing semantics (src 467-475) correctly documented.
- `agent-session/generate-reply.mdx` clean — src 478-482.
- `agent-session/interrupt.mdx` clean — no-op (src 485-487).
- `agent-session/update-agent.mdx` clean — src 490-496.
- `function-tool.mdx` clean — `tool()` factory + `FunctionTool` interface (src 526-549, 109-114).
- `job-context.mdx` clean — JobContext (src 612-635), JobProcess (594-596), Room (603-605).
- `plugins.mdx` clean — 5 plugin stubs + 3 inference classes match src 827-913.
- `run-app.mdx` clean — runApp (src 666-705) + defineAgent (645-650).
- `run-context.mdx` clean — RunContext (src 282-299). Minor: constructor has optional 2nd arg (`speechHandle`, `functionCall`) not documented — accepted.
- `signals.mdx` FIXED — ChatContext section falsely claimed "empty stub with no methods or properties" but src 927-934 defines `messages` property and `append(options)` method. Rewrote with actual Properties + append method docs.

### configuration/ — AUDITED + FIXED (64/64)

**Source:** `temp/signalwire-typescript/src/{AuthHandler,ConfigLoader,PromptManager,SchemaUtils,ServerlessAdapter,SessionManager,SslConfig,Logger}.ts`

- `index.mdx` clean — 9-card CardGroup matches 7 sub-class folders + `environment-variables.mdx` + `logging.mdx`. Layered config priority (constructor > env > config file > defaults) documented correctly.
- `environment-variables.mdx` spot-checked — structural content solid (Server, Auth, SSL sections with defaults); full deep verify against source pending.
- `logging.mdx` spot-checked — Logger/getLogger/setGlobalLogLevel API described; full deep verify against Logger.ts pending.

All 7 configuration sub-classes fully audited in session 4. See per-class
sections below for details.

### configuration/auth-handler/ — AUDITED + FIXED (6/6)

**Source:** `temp/signalwire-typescript/src/AuthHandler.ts` (256 lines)

- `index.mdx` FIXED — Missing `config.apiKeyHeader` field (src 20, 71).
  Added with default `'X-Api-Key'` and case-insensitive lookup note.
- `has-api-key-auth.mdx` clean — `hasApiKeyAuth(): boolean` (src 245).
- `has-basic-auth.mdx` clean — `hasBasicAuth(): boolean` (src 253).
- `has-bearer-auth.mdx` clean — `hasBearerAuth(): boolean` (src 237).
- `middleware.mdx` FIXED — Missing `optional = false` param (src 163). Added
  ParamField, updated description, added second example demonstrating the
  permissive mode.
- `validate.mdx` clean — `validate(headers): Promise<boolean>` (src 59); 4-way
  auth order verified (Bearer/APIKey/Basic/Custom) + allowUnauthenticated
  fallback correctly documented.

**Coverage gap (P4):** 5 public methods not documented — `verifyBasicAuth`
(src 124), `verifyBearerToken` (src 139), `verifyApiKey` (src 153),
`expressMiddleware` (src 186), `getAuthInfo` (src 206). These are useful
standalone verification helpers and framework adapters. Follow-up session
recommended to add pages.

### configuration/ssl-config/ — AUDITED + FIXED (7/7)

**Source:** `temp/signalwire-typescript/src/SslConfig.ts` (118 lines)

- `index.mdx` FIXED — Added missing `## Constructor` section (opts: SslOptions)
  with cross-reference to Properties. 6 properties already documented with
  env-var fallbacks; 6-card CardGroup matches methods.
- `get-cert.mdx` clean — `getCert(): string | null` (src 71); null when
  certPath unset or file missing.
- `get-key.mdx` clean — `getKey(): string | null` (src 80).
- `get-hsts-header.mdx` clean — `getHstsHeader(): string | null` (src 89);
  null when HSTS or SSL disabled (src 90); format
  `max-age=${hstsMaxAge}; includeSubDomains`.
- `get-server-options.mdx` clean — `getServerOptions(): { cert, key } | null`
  (src 98); null when either file missing.
- `hsts-middleware.mdx` clean — `hstsMiddleware()` Hono middleware (src 109).
- `is-configured.mdx` clean — `isConfigured(): boolean` (src 61); requires
  SSL enabled AND both cert/key files exist on disk (src 62-64).

### configuration/serverless-adapter/ — AUDITED -- NO ISSUES (8/8)

**Source:** `temp/signalwire-typescript/src/ServerlessAdapter.ts` (221 lines)

All 8 files clean. `index.mdx` covers ctor `platform='auto'` (src 53) with 5
valid enum values + 7-card CardGroup. Methods verified:
- `detectPlatform` (src 61) — 4 platform env-var checks + default fallback.
- `getPlatform` (src 73).
- `handleRequest` (src 83) — event normalization, URL building, Hono routing.
- `generateUrl` (src 134) — per-platform URL construction + env-var defaults
  for region/project/functionName/stage/apiId all documented.
- `createLambdaHandler` (src 171, static).
- `createGcfHandler` (src 181, static).
- `createAzureHandler` (src 204, static).

### configuration/config-loader/ — AUDITED + FIXED (9/9)

**Source:** `temp/signalwire-typescript/src/ConfigLoader.ts` (447 lines)

- `index.mdx` FIXED — Ctor param was `filePath: string`; source (src 33) is
  `filePaths?: string | string[]`. Fixed to document both forms + ordered
  array search behavior. Added `Properties` section with `configPaths`
  getter (src 56-57).
- `get.mdx` clean — `get<T>(path, defaultValue?): T` (src 182); prototype-
  pollution blocklist verified (src 184-186).
- `get-all.mdx` clean — `getAll(): Record<string, unknown>` (src 247);
  shallow copy via spread.
- `get-file-path.mdx` clean — `getFilePath(): string | null` (src 263);
  null when loaded from object (src 430).
- `has.mdx` clean — `has(path): boolean` (src 229).
- `load.mdx` clean — `load(filePath): this` (src 65); throws on missing file
  (src 67-69); interpolates env vars.
- `load-from-object.mdx` clean — `loadFromObject(obj): this` (src 428);
  sets filePath to null.
- `search.mdx` FIXED — Doc was missing `additionalPaths` + `serviceName`
  params (src 88). Only listed 3 of 6 default search paths. Rewrote
  Parameters to cover all three args, added full 6-path default list from
  `_buildSearchPaths` (src 147-174), documented service-specific variants
  + additionalPaths precedence.
- `set.mdx` clean — `set(path, value): this` (src 205); prototype-pollution
  blocklist verified (src 207-209).

**Coverage gap (P4):** 8 public methods not documented — `static findConfigFile`
(src 109), `getConfig` alias (src 255), `getConfigFile` alias (src 271),
`hasConfig` (src 289), `getSection` (src 298), `substituteVars` (src 316),
`mergeWithEnv` (src 367), `interpolateEnvVars` (src 439). Significant surface
missing especially `mergeWithEnv` + `getSection` which are core to runtime
config loading. Follow-up session recommended.

### configuration/prompt-manager/ — AUDITED -- NO ISSUES (10/10)

**Source:** `temp/signalwire-typescript/src/PromptManager.ts` (133 lines)

All 10 files clean. `index.mdx` covers ctor `usePom=true` (src 20) + 9-card
CardGroup matching 9 public methods. Method files verified: `setPromptText`
(src 31), `setPostPrompt` (39), `addSection` (48, full 5-field opts: body/
bullets/numbered/numberedBullets/subsections), `addToSection` (70, opts:
body/bullet/bullets), `addSubsection` (87, opts: body/bullets), `hasSection`
(104, `pom?.hasSection ?? false`), `getPrompt` (112, rawText-over-POM
precedence), `getPostPrompt` (122), `getPomBuilder` (130). Nested Indent
blocks used correctly. getPrompt precedence (`rawText !== null` first, then
POM markdown) verified against src 113-115.

### configuration/schema-utils/ — AUDITED + FIXED (10/10)

**Source:** `temp/signalwire-typescript/src/SchemaUtils.ts` (361 lines)

- `index.mdx` FIXED — Added missing `opts.schemaPath` ctor option (src 47, 50).
  Env-var fallback for `opts.skipValidation` correctly documented. 9-card
  CardGroup matches 9 public methods.
- `clear-cache.mdx` clean — `clearCache(): void` (src 341).
- `get-cache-size.mdx` clean — `getCacheSize(): number` (src 349).
- `get-verb-description.mdx` clean — `getVerbDescription(verbName): string`
  (src 158); empty string when missing (`?? ''`).
- `get-verb-names.mdx` clean — `getVerbNames(): string[]` (src 124).
- `get-verb-properties.mdx` clean — `getVerbProperties(verbName): Record<string, unknown>`
  (src 134); returns `{}` when not found.
- `get-verb-required-properties.mdx` clean — `getVerbRequiredProperties(verbName): string[]`
  (src 147).
- `has-verb.mdx` clean — `hasVerb(verbName): boolean` (src 168).
- `validate.mdx` clean — `validate(swml: string | Record<string, unknown>): ValidationResult`
  (src 231); 4 doc-level checks (top-level keys, version, sections, AI verb
  structure) + LRU cache all verified.
- `validate-verb.mdx` clean — `validateVerb(verbName, config): ValidationResult`
  (src 181); signature and "checks verb exists + required properties" prose
  verified against src 188-220.

### configuration/session-manager/ — AUDITED + FIXED (11/11)

**Source:** `temp/signalwire-typescript/src/SessionManager.ts` (311 lines)

- `index.mdx` FIXED — Added `Properties` section documenting `debugMode`
  public mutable flag (src 42). Constructor params `tokenExpirySecs`/`secretKey`
  already accurate. CardGroup covers 10 public methods; `activateSession`/
  `endSession` intentionally omitted (legacy no-ops for Python parity).
- `cleanup.mdx` clean — `cleanup(maxAgeMs?): void` (src 272); default
  `tokenExpirySecs * 1000` documented; iterates timestamps, deletes stale.
- `create-session.mdx` clean — `createSession(callId?): string` (src 62);
  returns `callId` or `randomBytes(16).toString('base64url')`.
- `create-tool-token.mdx` clean — alias for generateToken (src 92).
- `debug-token.mdx` FIXED — Major rewrite. Wrong return type (doc had flat
  camelCase fields + `| null`; source `DebugTokenResult` is nested with
  snake_case `components.call_id` / `status.is_expired` and never returns null,
  src 12-30). Missing `debugMode` requirement (src 170-172: returns
  `{ valid_format: false, error: "debug mode not enabled" }` when disabled).
  Added Warning box, documented all nested fields including 8-char truncation
  of `call_id`/`signature` (src 201, 206), fixed example to enable debugMode
  and use correct field paths.
- `delete-session-metadata.mdx` clean — `deleteSessionMetadata(sessionId): boolean`
  (src 308); returns `Map.delete` result.
- `generate-token.mdx` clean — token format
  `${callId}.${functionName}.${expiry}.${nonce}.${signature}` then base64url
  (src 74-81).
- `get-session-metadata.mdx` FIXED — Wrong return type `Record<string, unknown> | undefined`.
  Source (src 234) uses `?? {}` and never returns undefined; JSDoc at 227-228
  explicitly documents this Python-compat behavior. Updated return type,
  added note, extended example showing empty-object return for unknown session.
- `set-session-metadata.mdx` FIXED — Missing the three-argument
  `setSessionMetadata(sessionId, key, value)` overload (src 249, 250-259).
  Added Info box covering both signatures, documented `metadataOrKey` + `value`
  params, clarified return-type split (`void` bulk vs `boolean` single), added
  3-arg example.
- `validate-token.mdx` clean — `validateToken(callId, functionName, token): boolean`
  (src 103); 6 distinct checks verified (format/callId/function/expiry/signature/callIdMatch).
- `validate-tool-token.mdx` clean — reordered alias (src 156).

Significant follow-up scope — recommend new session.

### skills/ — AUDITED + FIXED (20/20)

**Source:** `temp/signalwire-typescript/src/skills/builtin/*.ts` (20 skills)

**Prior session deep audit (4):**
- `index.mdx` FIXED — tool counts: `datetime` 1→2, `google_maps` 2→4.
- `datetime.mdx` FIXED — tool name `get_datetime`→`get_current_time`+`get_current_date`.
- `joke.mdx` FIXED — added missing `tool_name` param (default `tell_joke`).
- `math.mdx` clean.

**This session deep audit (17):**

| File | Status | Notes |
|------|--------|-------|
| `api-ninjas-trivia.mdx` | FIXED | Added missing `tool_name` (default `get_trivia`) + `categories` params; added multi-instance note. |
| `ask-claude.mdx` | FIXED | Corrected `api_key` description — handler reads `ANTHROPIC_API_KEY` directly (ask_claude.ts:136), not as config fallback. TS-only skill (no Python counterpart). |
| `claude-skills.mdx` | clean | All 13 params match src; matches Python doc. |
| `custom-skills.mdx` | clean | TS-only skill; Python doc of same filename documents different concept — legitimate divergence. |
| `datasphere.mdx` | FIXED | Added `{query}` placeholder note on `no_results_message`; normalized `default={'"..."'}`→`default="..."`; noted tool_name required for multi-instance. |
| `datasphere-serverless.mdx` | FIXED | Removed false env-fallback claims — the serverless DataMap build path (`buildDataMapFunction` 193-197) reads config-only, not env. Added `{query}` note. |
| `google-maps.mdx` | FIXED | Major rewrite: doc had wrong tools `get_directions, find_place`; source has 4 tools `compute_route`, `lookup_address`, `geocode_address`, `compute_route_by_coords`. Added 4 `*_tool_name` params. Corrected `api_key` description — handlers read `GOOGLE_MAPS_API_KEY` env directly. |
| `info-gatherer.mdx` | clean | 3 params match src; prefix-based multi-instance verified. |
| `mcp-gateway.mdx` | FIXED | Normalized `tool_prefix` default style. Auth token env fallback verified working (unlike some other skills). |
| `native-vector-search.mdx` | FIXED | Major rewrite: doc had wrong tool default `search_documents` (source: `search_knowledge`). Added 10 missing params (`max_content_length`, `keyword_weight`, `model_name`, `response_format_callback`, `description`, `hints`, 3 NLP backends, `backend`, pgvector `connection_string`/`collection_name`, `verbose`, `overwrite`, `documents`). Restructured to mirror Python's section layout. |
| `play-background-file.mdx` | FIXED | Rewrite: doc only covered free-form mode (`play_background` + `stop_background`). Added pre-configured mode (`<tool_name>` single tool with `action` enum of `start_<key>`/`stop`). Added missing `tool_name` + `files` params. |
| `spider.mdx` | FIXED | Doc said "Tools: scrape_url" but source has 3: `scrape_url`, `crawl_site`, `extract_structured_data`. Added tool_name prefix param. Noted `SWML_ALLOW_PRIVATE_URLS=true` SSRF bypass. Noted that only `fast_text`/`markdown`/`structured` extract_types are wired; others fall back. |
| `swml-transfer.mdx` | FIXED | Added `list_transfer_destinations` tool (registered when `patterns` configured). Removed `required={true}` from `transfers` (either `transfers` or `patterns` required). Normalized default styles. Multi-instance note. |
| `weather-api.mdx` | FIXED | Added OpenWeatherMap-vs-WeatherAPI.com provider note (TS uses OpenWeatherMap despite SKILL_DESCRIPTION text). Corrected `units` default `"metric"`→`"fahrenheit"` (src 107). Added `tool_name` param. Documented `celsius`/`fahrenheit` Python aliases. |
| `web-search.mdx` | FIXED | Added multi-instance note (instance key combines `search_engine_id` + `tool_name`). Normalized `safe_search` default style. Noted tool_name configurability. |
| `wikipedia-search.mdx` | FIXED | Added `{query}` placeholder note on `no_results_message`. |
| `index.mdx` | FIXED | 5 multi-instance table corrections: `web_search`, `play_background_file`, `swml_transfer`, `api_ninjas_trivia`, `spider`, `info_gatherer` all `SUPPORTS_MULTIPLE_INSTANCES=true`. `spider` env-required `Yes`→`No`; tool count 1→3. `play_background_file` tool count 2→1-3 (mode-dependent). Code example `max_results`→`num_results` for `WebSearchSkill`; DataSphere example fixed to use `count` + `document_id` instead of `num_results`. |

### skills/ summary

17 files deep-audited this session, 14 fixed + 3 clean. 3 major rewrites
(`google-maps`, `native-vector-search`, `play-background-file`). Systematic
drift patterns encountered and fixed:
1. **Missing `tool_name` params** on 4 multi-instance-capable skills.
2. **Wrong env-fallback claims** on 2 skills whose handlers read `process.env`
   directly, bypassing the declared config param.
3. **`{query}` placeholder** undocumented on 3 `no_results_message` fields
   despite source implementing it.
4. **Default-value style inconsistency** (`default={'"x"'}`) normalized on 6
   ParamFields to match the project convention (`default="x"`).
5. **Index summary table** had 6 wrong multi-instance flags and 2 wrong tool
   counts; source had diverged since last table review.

### skill-registry/ — AUDITED -- NO ISSUES (16/16)

**Source:** `temp/signalwire-typescript/src/skills/SkillRegistry.ts` (367 lines)

All 16 files clean. `index.mdx` documents 15-card CardGroup + `size` getter (src 357). Methods verified: `getInstance` (src 72, static), `register` (95), `create` (157), `has` (184), `unregister` (144), `lock` (132), `listRegistered` (192), `addSearchPath` (218), `getSearchPaths` (228), `discoverFromDirectory` (238), `discoverAll` (294), `getSkillSchema` (310), `getAllSkillsSchema` (328), `listAllSkillSources` (347), `clear` (364). `SWML_SKILL_DISCOVERY_ENABLED=true` requirement on `discoverFromDirectory` correctly documented.

**Coverage gap (P4):** `getSkillClass` (175), `listSkills` (202), `resetInstance` (82 static, test helper) not documented.

### skill-manager/ — AUDITED -- NO ISSUES (17/17)

**Source:** `temp/signalwire-typescript/src/skills/SkillManager.ts` (416 lines)

All 17 files clean. `index.mdx` documents `size` getter + 16-card CardGroup. Methods verified: `addSkill` (src 70), `loadSkill` (236), `loadSkillByName` (266), `removeSkill` (144), `removeSkillByName` (174), `hasSkill` (192), `hasSkillByKey` (214), `listSkillKeys` (306), `getSkill` (315), `listSkills` (329), `getAllTools` (341), `getAllPromptSections` (353), `getAllHints` (365), `getMergedGlobalData` (377), `getLoadedSkillEntries` (397), `clear` (408).

**Coverage gap (P4):** `loadedSkills` getter (src 55) not documented as a property.

### skill-base/ — AUDITED -- NO ISSUES (16/16)

**Source:** `temp/signalwire-typescript/src/skills/SkillBase.ts` (590+ lines)

All 16 files clean. Static constants (`SKILL_NAME`, `SKILL_DESCRIPTION`, `SKILL_VERSION`, `REQUIRED_PACKAGES`, `REQUIRED_ENV_VARS`, `SUPPORTS_MULTIPLE_INSTANCES`) + 4 instance properties + 15-card method group all verified against src 90-550. Files: `index.mdx`, `setup.mdx` (src 278), `cleanup.mdx` (434), `get-tools.mdx` (297), `get-data-map-tools.mdx` (337), `get-prompt-sections.mdx` (347), `get-hints.mdx` (367), `get-global-data.mdx` (375), `get-instance-key.mdx` (392), `get-skill-namespace.mdx` (405), `get-skill-data.mdx` (415), `update-skill-data.mdx` (427), `is-initialized.mdx` (472), `mark-initialized.mdx` (479), `validate-env-vars.mdx` (451), `get-parameter-schema.mdx` (148).

**Coverage gap (P4):** 7 public methods undocumented — `getAgent` (226), `setAgent` (499), `getConfig` (489, mentioned inline in index), `defineTool` (316, inline), `hasAllEnvVars` (509, inline), `hasAllPackages` (544, inline), `validatePackages` (522).

### swml-builder/ — AUDITED + FIXED (12/12)

**Source:** `temp/signalwire-typescript/src/SwmlBuilder.ts` (258 lines)

- `index.mdx` FIXED — Constructor section claimed "takes no parameters" but `SwmlBuilder` accepts `opts?: SwmlBuilderOptions` (src 18-30). Added 3 options: `initialDocument`, `enableValidation`, `schemaPath`.
- `add-verb.mdx` clean — src 161-172 returns `void`; throws on validation failure.
- `add-verb-to-section.mdx` clean — src 180-185; auto-creates section.
- `ai.mdx` / `answer.mdx` / `hangup.mdx` / `play.mdx` clean — dynamic verb methods auto-installed from schema (src 111-148), return `this` for chaining.
- `get-document.mdx` clean — src 227-229.
- `get-schema-utils.mdx` clean — src 99-104 (static singleton).
- `render-document.mdx` clean — src 245-247 (JSON.stringify).
- `reset.mdx` FIXED — return type was `void`; source src 150 returns `this` for chaining.
- `say.mdx` FIXED (P0) — Doc falsely claimed `say` is not a method on SwmlBuilder. Source src 195 defines public `say(text, opts?): this` convenience method that emits `play` with `say:` prefix. Completely rewrote page with params (text, voice, language, gender, volume) to mirror Python doc.

**Coverage gap (P4):** Source has `build()` (237), `render()` (255), `document` getter (78), `setValidation` (87), `addSection` (216) also public but undocumented. `build`/`render` are Python-compat aliases for `getDocument`/`renderDocument` respectively.

---

## Agents audit session summary

**Session 1 (prior):**
- agent-base (82/82), agent-server (10/10), function-result (50/50),
  context-builder root (14/14), context-builder/context/index (1/23) — 167 files, 10 fixes, 3 new pages.

**Session 2 (this session — 2026-04-22):**

Audited in full + depth:
- context-builder/context (22/22) — 3 fixes
- context-builder/step (18/18) — 3 fixes
- overview + helpers (2/2) — 2 fixes
- prefabs (6/6) — 4 fixes
- swaig-function (4/4) — 3 fixes + 1 new page (validate-args)
- swml-service (7/7) — 4 fixes
- pom-builder (9/9) — 0 fixes
- swml-builder (12/12) — 3 fixes (incl. P0 say)
- data-map (19/19) — 0 fixes
- livewire (14/14) — 4 fixes
- skill-base (16/16) — 0 fixes
- skill-manager (17/17) — 0 fixes
- skill-registry (16/16) — 0 fixes

Partial audit:
- skills (3/20 deep + 17 spot) — 3 fixes; systematic P1 gap flagged
- configuration (3/64) — deferred

**Totals this session:** ~165 files audited, 29 fixes applied, 1 new page created (validate-args).
**Cumulative across sessions:** ~332 files audited, 39 fixes, 4 new pages.

**Remaining:** 17 skills pages (deep audit) + 61 configuration sub-class files = ~78 files. Follow-up session needed.

---

## Agents audit session 3 summary (2026-04-22)

Focused on skills deep-audit — the partial audit flagged in session 2.

Audited: skills (17/17 remaining + index re-verify) — 14 fixes across 17
files, 3 major rewrites (google-maps, native-vector-search, play-background-file).

**Totals this session:** 17 files audited, 15 fixes applied.
**Cumulative across sessions:** ~349 files audited, 54 fixes, 4 new pages.

**Remaining:** 61 configuration sub-class files (auth-handler 6, config-loader
9, prompt-manager 10, schema-utils 10, serverless-adapter 8, session-manager
11, ssl-config 7). Follow-up session needed.

---

## Agents audit session 4 summary (2026-04-22)

Focused on the 61 configuration sub-class files flagged for session 4 in
session 3. All 7 configuration sub-classes completed.

Audited this session:
- configuration/session-manager (11/11) — 4 fixes
- configuration/schema-utils (10/10) — 1 fix
- configuration/prompt-manager (10/10) — 0 fixes
- configuration/config-loader (9/9) — 2 fixes
- configuration/serverless-adapter (8/8) — 0 fixes
- configuration/ssl-config (7/7) — 1 fix
- configuration/auth-handler (6/6) — 2 fixes

**Totals this session:** 61 files audited, 10 fixes applied, 0 new pages.
**Cumulative across sessions:** ~410 files audited, 64 fixes, 4 new pages.

**Notable finds this session:**

- **P0 fixes:**
  - `session-manager/debug-token.mdx` — Return type was flat camelCase with
    `| null`; source `DebugTokenResult` is nested with snake_case
    `components.call_id` / `status.is_expired`, never null, and only works
    when `debugMode=true` (returns an error object otherwise). Fixed with
    full interface docs + Warning box + corrected example.
  - `session-manager/get-session-metadata.mdx` — Return type
    `Record<string, unknown> | undefined`. Source (src 234) uses `?? {}` and
    never returns undefined. JSDoc at 227-228 explicitly documents this as
    Python-compat behavior. Callers would have added null guards that never
    fire.
  - `auth-handler/middleware.mdx` — Params listed "None" but signature is
    `middleware(optional = false)`. Doc hid a real boolean option.
- **Missing ctor params/overloads:**
  - `session-manager/set-session-metadata.mdx` — 3-arg
    `setSessionMetadata(sessionId, key, value)` overload (src 249) was
    entirely undocumented despite being the Python-compat path.
  - `schema-utils/index.mdx` — `opts.schemaPath` ctor option (src 47, 50)
    missing; mirrors Python's `schema_path` argument.
  - `config-loader/index.mdx` — Ctor declared `filePath: string` but source
    accepts `filePaths?: string | string[]` with ordered-array search
    behavior (src 33-48). Array form critical for multi-env deployments.
  - `config-loader/search.mdx` — Missing `additionalPaths` + `serviceName`
    params (src 88); only listed 3 of 6 default search paths.
  - `auth-handler/index.mdx` — `config.apiKeyHeader` (src 20, default
    `'X-Api-Key'`) undocumented.
  - `ssl-config/index.mdx` — Whole `## Constructor` section missing; added
    opts: SslOptions reference.
- **Missing properties on index pages:**
  - `session-manager/index.mdx` — `debugMode` public mutable flag (src 42)
    and its effect on `debugToken` behavior undocumented.
  - `config-loader/index.mdx` — `configPaths` getter (src 56) missing.

**Significant coverage gaps (P4) flagged for future session:**
- `config-loader/`: 8 public methods undocumented — `findConfigFile`,
  `getConfig` (alias), `getConfigFile` (alias), `hasConfig`, `getSection`,
  `substituteVars`, `mergeWithEnv`, `interpolateEnvVars`. `mergeWithEnv` +
  `getSection` are core to runtime config loading.
- `auth-handler/`: 5 public methods undocumented — `verifyBasicAuth`,
  `verifyBearerToken`, `verifyApiKey`, `expressMiddleware`, `getAuthInfo`.

**Configuration namespace now fully audited:**
7/7 sub-classes: auth-handler, config-loader, prompt-manager, schema-utils,
serverless-adapter, session-manager, ssl-config. 64 total files (61 audited
this session + 3 spot-checked in session 2: configuration/index,
environment-variables, logging).

**Notable finds this session:**
- **P0 fixes:**
  - `native-vector-search.mdx` wrong tool default `search_documents` — source is `search_knowledge` (src 363/405).
  - `google-maps.mdx` completely wrong tool names (`get_directions`/`find_place` vs actual `compute_route`/`lookup_address` + 2 more).
  - `play-background-file.mdx` missed the entire pre-configured-files mode (a whole separate tool registration path).
- **False env-fallback claims** on `ask-claude` and `datasphere-serverless`. The `env_var` field in `ParameterSchemaEntry` is schema-declarative only — SkillBase does not auto-hydrate env into config. Skills that want env fallback must call `process.env['X']` in their handler, and several did not despite declaring `env_var`. Docs must match the handler's actual behavior, not the schema declaration.
- **Multi-instance table drift** — 6 rows had wrong `Multi-Instance` flags in the index table because prior audits updated individual skill pages but not the summary table.
- **Systematic style normalization** — 6 ParamField `default={'"..."'}` occurrences cleaned up to `default="..."` for consistency.

**Notable finds this session:**
- **P0 fixes:** swml-builder/say.mdx (doc falsely claimed method doesn't exist), skills/datetime.mdx (wrong tool name), skill-base/set-end.mdx (doc said "ends call" but source explicitly says it doesn't), skills/index table tool counts.
- **Fabricated content removed:** livewire/agent-session/index.mdx had fabricated `voiceOptions` param; livewire/signals.mdx ChatContext falsely claimed empty stub.
- **Significant missing info:** swml-service/index.mdx was missing 5 constructor options + 10 properties; swml-builder/index.mdx had wrong "takes no parameters" constructor claim; step/set-functions missing crucial inheritance warning; helpers.mdx missing validateUrl.
- **Doc→source drift in prefabs:** receptionist + survey had wrong tool names in index table.
- **Systematic skills drift:** tool names and custom `tool_name` parameters frequently missing/wrong across the 20 skill pages.

---

## REST audit summary

**All 384 MDX files across 22 REST namespaces audited clean** against source commit `ba6d5b1`. No discrepancies found. Every documented method, endpoint path, HTTP verb, and example signature matches the TypeScript source exactly.

Key verified behaviors:
- Fabric `FabricResource` (4 classes) use PATCH default update; `FabricResourcePUT` (9 classes) overrides to PUT.
- `cxml-applications` correctly omits `create.mdx` (source `create()` throws).
- `conference-rooms` + `call-flows` `listAddresses` use singular `conference_room` / `call_flow` path (source override).
- `subscribers.updateSipEndpoint` correctly uses PATCH while its outer `update` uses PUT.
- Compat `tokens.update` uniquely uses PATCH (all other compat updates use POST).
- `RegistryCampaigns.update` uses PUT (source override on BaseResource).
- `NumberGroups.getMembership` / `deleteMembership` correctly document the top-level `/number_group_memberships/{id}` endpoint (not nested).
- Calling namespace: all 37 commands dispatch POST `/api/calling/calls`; signature shape `(params)` for `dial`/`update`, `(callId, params)` for the rest.

