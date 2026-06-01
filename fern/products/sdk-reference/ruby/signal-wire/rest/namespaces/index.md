---
slug: "/reference/ruby/signal-wire/rest/namespaces"
title: "Namespaces"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "module"
  language: "ruby"
  qualified_name: "SignalWire::REST::Namespaces"
  parent: "SignalWire::REST"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/mfa.rb"
  visibility: "public"
---
# `Namespaces`

## Signature

```ruby
module Namespaces
```

## Classes

- [`AddressesResource`](/reference/ruby/signal-wire/rest/namespaces/addresses-resource) — Address management (no update endpoint).
- [`AutoMaterializedWebhook`](/reference/ruby/signal-wire/rest/namespaces/auto-materialized-webhook) — Fabric webhook resource that's normally auto-created by +phone\_numbers.set\_\*\_webhook+. Exposed for backwards compatibility.
- [`CallFlowsResource`](/reference/ruby/signal-wire/rest/namespaces/call-flows-resource) — Call flows with version management.
- [`CallingNamespace`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace) — REST call control -- all 37 commands dispatched via single POST endpoint.
- [`ChatResource`](/reference/ruby/signal-wire/rest/namespaces/chat-resource) — Chat token generation.
- [`CompatAccounts`](/reference/ruby/signal-wire/rest/namespaces/compat-accounts) — Compat account/subproject management.
- [`CompatApplications`](/reference/ruby/signal-wire/rest/namespaces/compat-applications) — Compat application management.
- [`CompatCalls`](/reference/ruby/signal-wire/rest/namespaces/compat-calls) — Compat call management with recording and stream sub-resources.
- [`CompatConferences`](/reference/ruby/signal-wire/rest/namespaces/compat-conferences) — Compat conference management.
- [`CompatFaxes`](/reference/ruby/signal-wire/rest/namespaces/compat-faxes) — Compat fax management with media sub-resources.
- [`CompatLamlBins`](/reference/ruby/signal-wire/rest/namespaces/compat-laml-bins) — Compat cXML/LaML script management.
- [`CompatMessages`](/reference/ruby/signal-wire/rest/namespaces/compat-messages) — Compat message management with media sub-resources.
- [`CompatNamespace`](/reference/ruby/signal-wire/rest/namespaces/compat-namespace) — Twilio-compatible LAML API namespace.
- [`CompatPhoneNumbers`](/reference/ruby/signal-wire/rest/namespaces/compat-phone-numbers) — Compat phone number management.
- [`CompatQueues`](/reference/ruby/signal-wire/rest/namespaces/compat-queues) — Compat queue management with members.
- [`CompatRecordings`](/reference/ruby/signal-wire/rest/namespaces/compat-recordings) — Compat recording management.
- [`CompatTokens`](/reference/ruby/signal-wire/rest/namespaces/compat-tokens) — Compat API token management.
- [`CompatTranscriptions`](/reference/ruby/signal-wire/rest/namespaces/compat-transcriptions) — Compat transcription management.
- [`ConferenceLogs`](/reference/ruby/signal-wire/rest/namespaces/conference-logs) — Conference log queries.
- [`ConferenceRoomsResource`](/reference/ruby/signal-wire/rest/namespaces/conference-rooms-resource) — Conference rooms -- uses singular 'conference\_room' for sub-resource paths.
- [`CxmlApplicationsResource`](/reference/ruby/signal-wire/rest/namespaces/cxml-applications-resource) — cXML applications -- no create method.
- [`CxmlWebhooksResource`](/reference/ruby/signal-wire/rest/namespaces/cxml-webhooks-resource) — cXML webhooks -- auto-materialized by +phone\_numbers.set\_cxml\_webhook+.
- [`DatasphereDocuments`](/reference/ruby/signal-wire/rest/namespaces/datasphere-documents) — Document management with search and chunk operations.
- [`DatasphereNamespace`](/reference/ruby/signal-wire/rest/namespaces/datasphere-namespace) — Datasphere API namespace.
- [`FabricAddresses`](/reference/ruby/signal-wire/rest/namespaces/fabric-addresses) — Read-only fabric addresses.
- [`FabricNamespace`](/reference/ruby/signal-wire/rest/namespaces/fabric-namespace) — Fabric API namespace grouping all resource types.
- [`FabricResource`](/reference/ruby/signal-wire/rest/namespaces/fabric-resource) — Standard fabric resource with CRUD + addresses.
- [`FabricResourcePUT`](/reference/ruby/signal-wire/rest/namespaces/fabric-resource-put) — Fabric resource that uses PUT for updates.
- [`FabricTokens`](/reference/ruby/signal-wire/rest/namespaces/fabric-tokens) — Subscriber, guest, invite, and embed token creation.
- [`FaxLogs`](/reference/ruby/signal-wire/rest/namespaces/fax-logs) — Fax log queries.
- [`GenericResources`](/reference/ruby/signal-wire/rest/namespaces/generic-resources) — Generic resource operations across all fabric resource types.
- [`ImportedNumbersResource`](/reference/ruby/signal-wire/rest/namespaces/imported-numbers-resource) — Import externally-hosted phone numbers.
- [`LogsNamespace`](/reference/ruby/signal-wire/rest/namespaces/logs-namespace) — Logs API namespace.
- [`LookupResource`](/reference/ruby/signal-wire/rest/namespaces/lookup-resource) — Phone number lookup (carrier, CNAM).
- [`MessageLogs`](/reference/ruby/signal-wire/rest/namespaces/message-logs) — Message log queries.
- [`MfaResource`](/reference/ruby/signal-wire/rest/namespaces/mfa-resource) — Multi-factor authentication via SMS or phone call.
- [`NumberGroupsResource`](/reference/ruby/signal-wire/rest/namespaces/number-groups-resource) — Number group management with membership operations.
- [`PhoneNumbersResource`](/reference/ruby/signal-wire/rest/namespaces/phone-numbers-resource) — Phone number management.
- [`ProjectNamespace`](/reference/ruby/signal-wire/rest/namespaces/project-namespace) — Project API namespace.
- [`ProjectTokens`](/reference/ruby/signal-wire/rest/namespaces/project-tokens) — Project API token management.
- [`PubSubResource`](/reference/ruby/signal-wire/rest/namespaces/pub-sub-resource) — PubSub token generation.
- [`QueuesResource`](/reference/ruby/signal-wire/rest/namespaces/queues-resource) — Queue management with member operations.
- [`RecordingsResource`](/reference/ruby/signal-wire/rest/namespaces/recordings-resource) — Recording management (read-only + delete).
- [`RegistryBrands`](/reference/ruby/signal-wire/rest/namespaces/registry-brands) — 10DLC brand management.
- [`RegistryCampaigns`](/reference/ruby/signal-wire/rest/namespaces/registry-campaigns) — 10DLC campaign management.
- [`RegistryNamespace`](/reference/ruby/signal-wire/rest/namespaces/registry-namespace) — 10DLC Campaign Registry namespace.
- [`RegistryNumbers`](/reference/ruby/signal-wire/rest/namespaces/registry-numbers) — 10DLC number assignment management.
- [`RegistryOrders`](/reference/ruby/signal-wire/rest/namespaces/registry-orders) — 10DLC assignment order management.
- [`ShortCodesResource`](/reference/ruby/signal-wire/rest/namespaces/short-codes-resource) — Short code management (read + update only).
- [`SipProfileResource`](/reference/ruby/signal-wire/rest/namespaces/sip-profile-resource) — Project SIP profile (singleton resource).
- [`SubscribersResource`](/reference/ruby/signal-wire/rest/namespaces/subscribers-resource) — Subscribers with SIP endpoint management.
- [`SwmlWebhooksResource`](/reference/ruby/signal-wire/rest/namespaces/swml-webhooks-resource) — SWML webhooks -- auto-materialized by +phone\_numbers.set\_swml\_webhook+.
- [`VerifiedCallersResource`](/reference/ruby/signal-wire/rest/namespaces/verified-callers-resource) — Verified caller ID management with verification flow.
- [`VideoConferences`](/reference/ruby/signal-wire/rest/namespaces/video-conferences) — Video conference management with tokens and streams.
- [`VideoConferenceTokens`](/reference/ruby/signal-wire/rest/namespaces/video-conference-tokens) — Video conference token management.
- [`VideoNamespace`](/reference/ruby/signal-wire/rest/namespaces/video-namespace) — Video API namespace.
- [`VideoRoomRecordings`](/reference/ruby/signal-wire/rest/namespaces/video-room-recordings) — Video room recording management.
- [`VideoRooms`](/reference/ruby/signal-wire/rest/namespaces/video-rooms) — Video room management with streams.
- [`VideoRoomSessions`](/reference/ruby/signal-wire/rest/namespaces/video-room-sessions) — Video room session management.
- [`VideoRoomTokens`](/reference/ruby/signal-wire/rest/namespaces/video-room-tokens) — Video room token generation.
- [`VideoStreams`](/reference/ruby/signal-wire/rest/namespaces/video-streams) — Video stream management.
- [`VoiceLogs`](/reference/ruby/signal-wire/rest/namespaces/voice-logs) — Voice log queries.

## Source

[`lib/signalwire/rest/namespaces/mfa.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/mfa.rb)

Line 5.
