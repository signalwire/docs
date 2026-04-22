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

