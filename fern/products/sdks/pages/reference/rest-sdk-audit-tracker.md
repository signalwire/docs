# REST SDK Audit Tracker (TypeScript + Python)

## SDK Identity

| Field | TypeScript | Python |
|-------|-----------|--------|
| Package | `@signalwire/sdk` | `signalwire` |
| Version | 2.0.0 | 2.0.0 |
| Import | `import { RestClient } from "@signalwire/sdk"` | `from signalwire.rest import RestClient` |
| Interface | `any`-passthrough (all REST namespaces) | `**params` passthrough |
| Key transform | None | None |
| REST spec | `fern/apis/signalwire-rest/openapi.yaml` | same |
| Compat spec | `fern/apis/compatibility/openapi.yaml` | same |

## Full Inventory

### fabric (112 files per variant)

| Sub-resource | TS files | PY files | Base class (TS) | Status |
|---|---|---|---|---|
| ai-agents | 7 | 7 | FabricResource (PATCH) | AUDITED + FIXED |
| swml-webhooks | 7 | 7 | FabricResource (PATCH) | NOT STARTED |
| sip-gateways | 7 | 7 | FabricResource (PATCH) | NOT STARTED |
| cxml-webhooks | 7 | 7 | FabricResource (PATCH) | NOT STARTED |
| swml-scripts | 7 | 7 | FabricResourcePUT | NOT STARTED |
| relay-applications | 7 | 7 | FabricResourcePUT | NOT STARTED |
| freeswitch-connectors | 7 | 7 | FabricResourcePUT | NOT STARTED |
| sip-endpoints | 7 | 7 | FabricResourcePUT | NOT STARTED |
| cxml-scripts | 7 | 7 | FabricResourcePUT | NOT STARTED |
| call-flows | 9 | 9 | CallFlowsResource (special) | NOT STARTED |
| conference-rooms | 7 | 7 | ConferenceRoomsResource (special) | NOT STARTED |
| subscribers | 12 | 12 | SubscribersResource (special) | NOT STARTED |
| cxml-applications | 6 | 6 | CxmlApplicationsResource (special) | NOT STARTED |
| resources | 7 | 7 | GenericResources (special) | NOT STARTED |
| tokens | 6 | 6 | FabricTokens (special) | NOT STARTED |
| addresses (top-level) | 1 | 1 | FabricAddresses (special) | NOT STARTED |
| index (top-level) | 1 | 1 | — | NOT STARTED |

### Other namespaces

| Namespace | TS files | PY files | Status |
|---|---|---|---|
| compat | 91 | 91 | NOT STARTED |
| calling | 38 | 38 | NOT STARTED |
| video | 38 | 38 | NOT STARTED |
| registry | 15 | 15 | NOT STARTED |
| datasphere | 10 | 10 | NOT STARTED |
| number-groups | 10 | 10 | NOT STARTED |
| queues | 9 | 9 | NOT STARTED |
| logs | 8 | 8 | NOT STARTED |
| verified-callers | 8 | 8 | NOT STARTED |
| phone-numbers | 7 | 7 | NOT STARTED |
| addresses | 5 | 5 | NOT STARTED |
| project | 4 | 4 | NOT STARTED |
| mfa | 4 | 4 | NOT STARTED |
| short-codes | 4 | 4 | NOT STARTED |
| recordings | 4 | 4 | NOT STARTED |
| sip-profile | 3 | 3 | NOT STARTED |
| chat | 2 | 2 | NOT STARTED |
| lookup | 2 | 2 | NOT STARTED |
| pubsub | 2 | 2 | NOT STARTED |
| imported-numbers | 2 | 2 | NOT STARTED |
| client | 1 | 1 | NOT STARTED |
| overview | 1 | 1 | NOT STARTED |
| rest-error | 1 | 1 | NOT STARTED |

## Findings Log

### fabric/ai-agents (AUDITED + FIXED)

**Findings:**
- [TS list.mdx] P3 WRONG_LANG: "keyword arguments" is Python terminology in TS doc (systemic across all TS fabric list.mdx files)
- [_update-params.mdx] P1 MISSING: `name` and `agent_id` optional params exist in OpenAPI AIAgentUpdateRequest but were absent
- [TS get/update/delete/list-addresses.mdx] P0 WRONG_NAME: ParamField path="resource_id" should be "resourceId" per TS source — DEFERRED (systemic: 30 files use snake_case, 34 use camelCase across all TS REST docs; fixing in isolation would worsen inconsistency)
- [_create-params.mdx, _update-params.mdx] P3 SPEC_DESC: SWAIG type="object" is correct per spec, but spec description says "array of JSON objects" — spec-level issue, not doc bug

**Fixes applied:**
- [_update-params.mdx] FIXED: Added missing `name` (string, optional) and `agent_id` (string, optional) ParamFields
- [TS list.mdx] FIXED: Changed "keyword arguments" to "additional parameters"

**Systemic issues noted (apply across all REST namespaces later):**
- TS REST docs inconsistently use `resource_id` vs `resourceId` for positional arg ParamField paths (30 vs 34 files)
- TS fabric list.mdx files all use "keyword arguments" — needs batch fix across ~15 TS list pages
