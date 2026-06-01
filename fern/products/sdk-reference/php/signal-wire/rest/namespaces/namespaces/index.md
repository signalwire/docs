---
slug: "/reference/php/signal-wire/rest/namespaces/namespaces"
title: "Namespaces"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "module"
  language: "php"
  qualified_name: "SignalWire\\REST\\Namespaces"
  module: "SignalWire.REST.Namespaces"
---
# `Namespaces`

## Signature

```php
namespace SignalWire\REST\Namespaces
```

## Classes

- [`Addresses`](/reference/php/signal-wire/rest/namespaces/namespaces/addresses) — Addresses namespace — list / create / get / delete (no update).
- [`Calling`](/reference/php/signal-wire/rest/namespaces/namespaces/calling) — Calling API namespace.
- [`Compat`](/reference/php/signal-wire/rest/namespaces/namespaces/compat) — Compatibility (Twilio-compatible LAML) API namespace.
- [`CompatAccounts`](/reference/php/signal-wire/rest/namespaces/namespaces/compat-accounts) — Compat account / sub-project management.
- [`CompatConferences`](/reference/php/signal-wire/rest/namespaces/namespaces/compat-conferences) — Compat conference management with participants, recordings, and streams.
- [`CompatPhoneNumbers`](/reference/php/signal-wire/rest/namespaces/namespaces/compat-phone-numbers) — Compat IncomingPhoneNumbers + AvailablePhoneNumbers + ImportedPhoneNumbers
- [`CompatRecordings`](/reference/php/signal-wire/rest/namespaces/namespaces/compat-recordings) — Compat recording management.
- [`CompatTokens`](/reference/php/signal-wire/rest/namespaces/namespaces/compat-tokens) — Compat API token management.
- [`CompatTranscriptions`](/reference/php/signal-wire/rest/namespaces/namespaces/compat-transcriptions) — Compat transcription management.
- [`ConferenceLogs`](/reference/php/signal-wire/rest/namespaces/namespaces/conference-logs) — Conference log queries — list-only resource.
- [`Datasphere`](/reference/php/signal-wire/rest/namespaces/namespaces/datasphere) — Datasphere API namespace — exposes the documents sub-resource.
- [`Fabric`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric) — Fabric API namespace.
- [`FabricAddresses`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric-addresses) — Read-only fabric addresses (`/api/fabric/addresses`).
- [`FabricGenericResources`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric-generic-resources) — Generic operations across all fabric resource types
- [`FabricTokens`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric-tokens) — Subscriber, guest, invite, and embed token creation under
- [`FaxLogs`](/reference/php/signal-wire/rest/namespaces/namespaces/fax-logs) — Fax log queries — list + get by id.
- [`ImportedNumbers`](/reference/php/signal-wire/rest/namespaces/namespaces/imported-numbers) — Imported phone numbers — create only (registers an externally-hosted
- [`Logs`](/reference/php/signal-wire/rest/namespaces/namespaces/logs) — Logs namespace — message, voice, fax, and conference logs (read-only).
- [`MessageLogs`](/reference/php/signal-wire/rest/namespaces/namespaces/message-logs) — Message log queries — list + get by id.
- [`Mfa`](/reference/php/signal-wire/rest/namespaces/namespaces/mfa) — Multi-factor authentication via SMS or phone call.
- [`Project`](/reference/php/signal-wire/rest/namespaces/namespaces/project) — Project API namespace — currently exposes the project tokens sub-resource.
- [`ProjectTokens`](/reference/php/signal-wire/rest/namespaces/namespaces/project-tokens) — Project API token management — create / update (PATCH) / delete.
- [`Recordings`](/reference/php/signal-wire/rest/namespaces/namespaces/recordings) — Recordings — read-only list/get plus delete (no create or update).
- [`Registry`](/reference/php/signal-wire/rest/namespaces/namespaces/registry) — 10DLC Campaign Registry namespace — brands, campaigns, orders, numbers.
- [`RegistryBrands`](/reference/php/signal-wire/rest/namespaces/namespaces/registry-brands) — 10DLC brand management — list, create, get, list\_campaigns, create\_campaign.
- [`RegistryCampaigns`](/reference/php/signal-wire/rest/namespaces/namespaces/registry-campaigns) — 10DLC campaign management — get, update (PUT), list\_numbers,
- [`RegistryNumbers`](/reference/php/signal-wire/rest/namespaces/namespaces/registry-numbers) — 10DLC number assignment management — release a number.
- [`RegistryOrders`](/reference/php/signal-wire/rest/namespaces/namespaces/registry-orders) — 10DLC assignment order management — read-only, retrieve by id.
- [`ShortCodes`](/reference/php/signal-wire/rest/namespaces/namespaces/short-codes) — Short codes management — read + update (PUT) only.
- [`SipProfile`](/reference/php/signal-wire/rest/namespaces/namespaces/sip-profile) — Project SIP profile (singleton resource) — get + update (PUT).
- [`Video`](/reference/php/signal-wire/rest/namespaces/namespaces/video) — Video API namespace.
- [`VideoConferenceTokens`](/reference/php/signal-wire/rest/namespaces/namespaces/video-conference-tokens) — Video conference token management — get + reset.
- [`VideoRoomRecordings`](/reference/php/signal-wire/rest/namespaces/namespaces/video-room-recordings) — Video room recording management — top-level recordings collection
- [`VideoRoomSessions`](/reference/php/signal-wire/rest/namespaces/namespaces/video-room-sessions) — Video room session management. Read-only with several sub-collections
- [`VideoRoomTokens`](/reference/php/signal-wire/rest/namespaces/namespaces/video-room-tokens) — Video room token generation. Surface is `create` only.
- [`VideoStreams`](/reference/php/signal-wire/rest/namespaces/namespaces/video-streams) — Top-level video stream management — get / update (PUT) / delete.
- [`VoiceLogs`](/reference/php/signal-wire/rest/namespaces/namespaces/voice-logs) — Voice log queries — list + get by id + per-id event sub-collection.
