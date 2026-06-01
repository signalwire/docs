---
slug: "/reference/dotnet/signal-wire.rest.namespaces"
title: "SignalWire.REST.Namespaces"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "module"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces"
---
# `SignalWire.REST.Namespaces`

## Classes

- [`Addresses`](/reference/dotnet/signal-wire.rest.namespaces/addresses) — Addresses namespace (Relay top-level addresses, no update). Mirrors Python `signalwire.rest.namespaces.addresses.AddressesResource`. Inherits CrudResource for the standard list/create/get/delete surface.
- [`CallFlowsHelper`](/reference/dotnet/signal-wire.rest.namespaces/call-flows-helper) — CallFlows helper providing the singular-path variants (`/api/fabric/resources/call_flow/{id}/{addresses,versions}`).
- [`Calling`](/reference/dotnet/signal-wire.rest.namespaces/calling) — Calling API namespace. Provides 37 call-control command methods that each POST to /api/calling/calls with a JSON body containing the command name, an optional call ID, and parameters.
- [`Compat`](/reference/dotnet/signal-wire.rest.namespaces/compat) — Twilio-compatible (LaML) API namespace with AccountSid scoping. Mirrors Python `signalwire.rest.namespaces.compat.CompatNamespace`: the entry-point exposes 12 sub-resources (accounts, calls, messages, faxes, conferences, phone\_numbers, applications, laml\_bins, queues, recordings, transcriptions, tokens) under a shared per-account prefix. <p>Inherits from <xref href="SignalWire.REST.CrudResource" data-throw-if-not-resolved="false"></xref> so the historical `client.Compat.List()` / `Create` / `Get` / `Update` / `Delete` surface continues to work; the per-account collection accessors are added on top.</p>
- [`CompatAccounts`](/reference/dotnet/signal-wire.rest.namespaces/compat-accounts) — Compat account/subproject management. Lives at the top-level /api/laml/2010-04-01/Accounts collection (no AccountSid prefix).
- [`CompatApplications`](/reference/dotnet/signal-wire.rest.namespaces/compat-applications) — Compat applications (Twilio LaML voice/SMS apps).
- [`CompatCalls`](/reference/dotnet/signal-wire.rest.namespaces/compat-calls) — Compat calls with recording + stream sub-resources. Inherits standard CRUD; adds Twilio-style compat extensions.
- [`CompatConferences`](/reference/dotnet/signal-wire.rest.namespaces/compat-conferences) — Compat conferences with participant, recording, and stream sub-resources.
- [`CompatFaxes`](/reference/dotnet/signal-wire.rest.namespaces/compat-faxes) — Compat faxes with media sub-resources.
- [`CompatLamlBins`](/reference/dotnet/signal-wire.rest.namespaces/compat-laml-bins) — Compat cXML / LaML script bins.
- [`CompatMessages`](/reference/dotnet/signal-wire.rest.namespaces/compat-messages) — Compat messages with media sub-resources.
- [`CompatPhoneNumbers`](/reference/dotnet/signal-wire.rest.namespaces/compat-phone-numbers) — Compat phone-number management with purchase, import, and search.
- [`CompatQueues`](/reference/dotnet/signal-wire.rest.namespaces/compat-queues) — Compat queues with member management.
- [`CompatRecordings`](/reference/dotnet/signal-wire.rest.namespaces/compat-recordings) — Compat recordings (read-only top-level resource).
- [`CompatTokens`](/reference/dotnet/signal-wire.rest.namespaces/compat-tokens) — Compat API tokens — UPDATE uses PATCH (BaseResource style).
- [`CompatTranscriptions`](/reference/dotnet/signal-wire.rest.namespaces/compat-transcriptions) — Compat transcriptions (read-only top-level resource).
- [`ConferenceLogs`](/reference/dotnet/signal-wire.rest.namespaces/conference-logs) — Conference log queries (list-only).
- [`ConferenceRoomsHelper`](/reference/dotnet/signal-wire.rest.namespaces/conference-rooms-helper) — ConferenceRooms helper providing the singular-path variant (`/api/fabric/resources/conference_room/{id}/addresses`).
- [`CxmlApplicationsHelper`](/reference/dotnet/signal-wire.rest.namespaces/cxml-applications-helper) — cXML applications helper. The API has no CREATE endpoint for cXML applications (POST is rejected); calling Create here throws NotImplementedException to mirror Python's deliberate behaviour.
- [`DatasphereDocuments`](/reference/dotnet/signal-wire.rest.namespaces/datasphere-documents) — Datasphere documents (CRUD + search + chunk methods).
- [`DatasphereNs`](/reference/dotnet/signal-wire.rest.namespaces/datasphere-ns) — Datasphere namespace — documents with chunks/search. Mirrors Python `signalwire.rest.namespaces.datasphere.DatasphereNamespace`. Extends CrudResource — the legacy `client.Datasphere.List` etc went to /api/datasphere/documents directly; we preserve that surface and add `Documents` accessor for chunk/search per Python parity.
- [`Fabric`](/reference/dotnet/signal-wire.rest.namespaces/fabric) — Fabric API namespace. Groups all Fabric sub-resources (subscribers, SIP endpoints, call flows, SWML scripts, conference rooms, AI agents, etc.) under a single object. Each sub-resource is lazily initialised as a <xref href="SignalWire.REST.CrudResource" data-throw-if-not-resolved="false"></xref> pointing at the correct API path under /api/fabric/resources.
- [`FabricAddresses`](/reference/dotnet/signal-wire.rest.namespaces/fabric-addresses) — Read-only top-level Fabric addresses resource (lives at /api/fabric/addresses, NOT under /api/fabric/resources). Mirrors Python `signalwire.rest.namespaces.fabric.FabricAddresses`.
- [`FabricResources`](/reference/dotnet/signal-wire.rest.namespaces/fabric-resources) — Generic resource operations across all Fabric resource types. Lives at /api/fabric/resources (the base) and dispatches to per-type sub-paths. Mirrors Python's `signalwire.rest.namespaces.fabric.GenericResources`.
- [`FabricTokens`](/reference/dotnet/signal-wire.rest.namespaces/fabric-tokens) — Fabric tokens — subscriber/guest/invite/embed token creation. All endpoints sit under /api/fabric (NOT /api/fabric/resources or /api/fabric/tokens). Mirrors Python's `signalwire.rest.namespaces.fabric.FabricTokens`.
- [`FaxLogs`](/reference/dotnet/signal-wire.rest.namespaces/fax-logs) — Fax log queries.
- [`ImportedNumbers`](/reference/dotnet/signal-wire.rest.namespaces/imported-numbers) — Imported phone numbers (create only). Mirrors Python `signalwire.rest.namespaces.imported_numbers.ImportedNumbersResource`. Extends CrudResource so the legacy `client.ImportedNumbers.BasePath` surface keeps working; `CreateAsync` is the only method Python exposes.
- [`Logs`](/reference/dotnet/signal-wire.rest.namespaces/logs) — Logs API namespace — message, voice, fax, and conference logs (read-only). Mirrors Python `signalwire.rest.namespaces.logs.LogsNamespace`. Each kind of log lives at a different sub-API path. <p>Inherits from <xref href="SignalWire.REST.CrudResource" data-throw-if-not-resolved="false"></xref> so the legacy `client.Logs.BasePath` accessor still resolves; the new Messages/Voice/Fax/Conferences accessors point at the actual per-API log endpoints.</p>
- [`MessageLogs`](/reference/dotnet/signal-wire.rest.namespaces/message-logs) — Message log queries.
- [`Mfa`](/reference/dotnet/signal-wire.rest.namespaces/mfa) — Multi-Factor Authentication namespace (sms / call / verify dispatch). Mirrors Python `signalwire.rest.namespaces.mfa.MfaResource`. Extends CrudResource so the legacy `client.Mfa.BasePath` / `client.Mfa.Create` surface keeps working.
- [`NumberGroups`](/reference/dotnet/signal-wire.rest.namespaces/number-groups) — Number Groups (CRUD + membership operations; update via PUT). Mirrors Python `signalwire.rest.namespaces.number_groups.NumberGroupsResource`. Note delete\_membership / get\_membership target the top-level `/api/relay/rest/number_group_memberships/{id}` path, NOT the nested per-group sub-collection.
- [`Project`](/reference/dotnet/signal-wire.rest.namespaces/project) — Project namespace — exposes ProjectTokens (PATCH update). Mirrors Python `signalwire.rest.namespaces.project.ProjectNamespace`. Extends CrudResource for the legacy `client.Project.BasePath` test.
- [`ProjectTokens`](/reference/dotnet/signal-wire.rest.namespaces/project-tokens) — Project API tokens — PATCH for update.
- [`Queues`](/reference/dotnet/signal-wire.rest.namespaces/queues) — Queues namespace (Relay queues with member operations). Mirrors Python `signalwire.rest.namespaces.queues.QueuesResource`. Note: per-port adapter mismatches with the legacy CrudResource at /api/fabric/resources/queues — this lives at /api/relay/rest/queues.
- [`Recordings`](/reference/dotnet/signal-wire.rest.namespaces/recordings) — Recordings namespace (Relay top-level recordings, list/get/delete). Mirrors Python `signalwire.rest.namespaces.recordings.RecordingsResource`. Inherits CrudResource for the standard list/get/delete surface.
- [`Registry`](/reference/dotnet/signal-wire.rest.namespaces/registry) — 10DLC Campaign Registry namespace — brands, campaigns, orders, numbers. Mirrors Python `signalwire.rest.namespaces.registry.RegistryNamespace` (everything under /api/relay/rest/registry/beta). <p>Inherits from <xref href="SignalWire.REST.CrudResource" data-throw-if-not-resolved="false"></xref> so the legacy `client.Registry.BasePath` accessor still resolves; the new Brands/Campaigns/Orders/Numbers accessors target the per-resource endpoints under /api/relay/rest/registry/beta.</p>
- [`RegistryBrands`](/reference/dotnet/signal-wire.rest.namespaces/registry-brands) — 10DLC brand management.
- [`RegistryCampaigns`](/reference/dotnet/signal-wire.rest.namespaces/registry-campaigns) — 10DLC campaign management — update via PUT.
- [`RegistryNumbers`](/reference/dotnet/signal-wire.rest.namespaces/registry-numbers) — 10DLC number assignment management.
- [`RegistryOrders`](/reference/dotnet/signal-wire.rest.namespaces/registry-orders) — 10DLC assignment order management (read-only).
- [`ShortCodes`](/reference/dotnet/signal-wire.rest.namespaces/short-codes) — Short codes (list/get/update — no create/delete; update via PUT). Mirrors Python `signalwire.rest.namespaces.short_codes.ShortCodesResource`. Extends CrudResource — overrides UpdateAsync to use PUT (matching Python's \_update\_method = "PUT" on this resource).
- [`SipProfile`](/reference/dotnet/signal-wire.rest.namespaces/sip-profile) — Project SIP profile (singleton resource — get/update only, update via PUT). Mirrors Python `signalwire.rest.namespaces.sip_profile.SipProfileResource`. Extends CrudResource for the legacy `client.SipProfile.BasePath` test — the Python-parity singleton path is /api/relay/rest/sip\_profile; the legacy .NET path was /api/relay/rest/sip\_profiles. The legacy accessor target is preserved while `GetAsync()/UpdateAsync(kwargs)` hit the singleton path.
- [`SubscribersHelper`](/reference/dotnet/signal-wire.rest.namespaces/subscribers-helper) — Subscribers helper exposing per-subscriber SIP-endpoint operations. Mirrors Python's `SubscribersResource` SIP endpoint methods.
- [`Video`](/reference/dotnet/signal-wire.rest.namespaces/video) — Video API namespace. Mirrors Python `signalwire.rest.namespaces.video.VideoNamespace` — rooms, room sessions, room recordings, conferences, conference tokens, streams. <p>The legacy `client.Video.List() / Create / Get / Delete` surface (which targeted `/api/video/rooms`) is preserved by inheriting from <xref href="SignalWire.REST.CrudResource" data-throw-if-not-resolved="false"></xref>.</p>
- [`VideoConferences`](/reference/dotnet/signal-wire.rest.namespaces/video-conferences) — Video conferences (CRUD with PUT update + tokens/streams subresources).
- [`VideoConferenceTokens`](/reference/dotnet/signal-wire.rest.namespaces/video-conference-tokens) — Video conference tokens: get + reset.
- [`VideoRoomRecordings`](/reference/dotnet/signal-wire.rest.namespaces/video-room-recordings) — Video room recordings: list, get, delete, list\_events.
- [`VideoRooms`](/reference/dotnet/signal-wire.rest.namespaces/video-rooms) — Video rooms (CRUD + streams sub-resource).
- [`VideoRoomSessions`](/reference/dotnet/signal-wire.rest.namespaces/video-room-sessions) — Video room sessions: list, get, list\_events/\_members/\_recordings.
- [`VideoRoomTokens`](/reference/dotnet/signal-wire.rest.namespaces/video-room-tokens) — Video room tokens (create-only).
- [`VideoStreams`](/reference/dotnet/signal-wire.rest.namespaces/video-streams) — Video streams: get, update (PUT), delete.
- [`VoiceLogs`](/reference/dotnet/signal-wire.rest.namespaces/voice-logs) — Voice log queries with events sub-collection.
