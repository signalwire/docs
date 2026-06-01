---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces"
title: "namespaces"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
---
# `namespaces`

Package namespaces contains the individual API namespace implementations for the SignalWire REST client.

## Signature

```go
package namespaces
```

## Constants

| Name                               | Type                                                | Required | Default | Description                                                     |
| ---------------------------------- | --------------------------------------------------- | -------- | ------- | --------------------------------------------------------------- |
| `PhoneCallHandlerAiAgent`          | `PhoneCallHandlerAiAgent PhoneCallHandler`          | yes      | —       | PhoneCallHandler wire values accepted by phone\_numbers.Update. |
| `PhoneCallHandlerCallFlow`         | `PhoneCallHandlerCallFlow PhoneCallHandler`         | yes      | —       | PhoneCallHandler wire values accepted by phone\_numbers.Update. |
| `PhoneCallHandlerDialogflow`       | `PhoneCallHandlerDialogflow PhoneCallHandler`       | yes      | —       | PhoneCallHandler wire values accepted by phone\_numbers.Update. |
| `PhoneCallHandlerLamlApplication`  | `PhoneCallHandlerLamlApplication PhoneCallHandler`  | yes      | —       | PhoneCallHandler wire values accepted by phone\_numbers.Update. |
| `PhoneCallHandlerLamlWebhooks`     | `PhoneCallHandlerLamlWebhooks PhoneCallHandler`     | yes      | —       | PhoneCallHandler wire values accepted by phone\_numbers.Update. |
| `PhoneCallHandlerRelayApplication` | `PhoneCallHandlerRelayApplication PhoneCallHandler` | yes      | —       | PhoneCallHandler wire values accepted by phone\_numbers.Update. |
| `PhoneCallHandlerRelayConnector`   | `PhoneCallHandlerRelayConnector PhoneCallHandler`   | yes      | —       | PhoneCallHandler wire values accepted by phone\_numbers.Update. |
| `PhoneCallHandlerRelayContext`     | `PhoneCallHandlerRelayContext PhoneCallHandler`     | yes      | —       | PhoneCallHandler wire values accepted by phone\_numbers.Update. |
| `PhoneCallHandlerRelayScript`      | `PhoneCallHandlerRelayScript PhoneCallHandler`      | yes      | —       | PhoneCallHandler wire values accepted by phone\_numbers.Update. |
| `PhoneCallHandlerRelayTopic`       | `PhoneCallHandlerRelayTopic PhoneCallHandler`       | yes      | —       | PhoneCallHandler wire values accepted by phone\_numbers.Update. |
| `PhoneCallHandlerVideoRoom`        | `PhoneCallHandlerVideoRoom PhoneCallHandler`        | yes      | —       | PhoneCallHandler wire values accepted by phone\_numbers.Update. |

## Functions

- [`AllPhoneCallHandlers`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/all-phone-call-handlers) — AllPhoneCallHandlers returns every PhoneCallHandler value. Useful for enum-contract tests and for callers that need to validate or enumerate the set.
- [`NewAddressesNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-addresses-namespace) — NewAddressesNamespace creates a new AddressesNamespace.
- [`NewCallingNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-calling-namespace) — NewCallingNamespace creates a new CallingNamespace.
- [`NewChatNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-chat-namespace) — NewChatNamespace creates a new ChatNamespace.
- [`NewCompatNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-compat-namespace) — NewCompatNamespace creates a new CompatNamespace with all sub-resources scoped to the given account SID.
- [`NewCrudResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-crud-resource) — NewCrudResource creates a CrudResource with PATCH as the update method.
- [`NewCrudResourcePUT`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-crud-resource-put) — NewCrudResourcePUT creates a CrudResource that uses PUT for updates.
- [`NewCrudWithAddresses`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-crud-with-addresses) — NewCrudWithAddresses constructs a CrudWithAddresses backed by a PATCH-default CrudResource. Use NewCrudWithAddressesPUT for resources that update via PUT.
- [`NewCrudWithAddressesPUT`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-crud-with-addresses-put) — NewCrudWithAddressesPUT constructs a CrudWithAddresses backed by a PUT-update CrudResource.
- [`NewDatasphereNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-datasphere-namespace) — NewDatasphereNamespace creates a new DatasphereNamespace.
- [`NewFabricNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-fabric-namespace) — NewFabricNamespace creates a new FabricNamespace with all sub-resources initialized.
- [`NewImportedNumbersNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-imported-numbers-namespace) — NewImportedNumbersNamespace creates a new ImportedNumbersNamespace.
- [`NewLogsNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-logs-namespace) — NewLogsNamespace creates a new LogsNamespace with all sub-resources initialized.
- [`NewLookupNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-lookup-namespace) — NewLookupNamespace creates a new LookupNamespace.
- [`NewMFANamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-mfa-namespace) — NewMFANamespace creates a new MFANamespace.
- [`NewNumberGroupsNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-number-groups-namespace) — NewNumberGroupsNamespace creates a new NumberGroupsNamespace.
- [`NewPhoneNumbersNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-phone-numbers-namespace) — NewPhoneNumbersNamespace creates a new PhoneNumbersNamespace.
- [`NewProjectNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-project-namespace) — NewProjectNamespace creates a new ProjectNamespace.
- [`NewPubSubNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-pub-sub-namespace) — NewPubSubNamespace creates a new PubSubNamespace.
- [`NewQueuesNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-queues-namespace) — NewQueuesNamespace creates a new QueuesNamespace.
- [`NewRecordingsNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-recordings-namespace) — NewRecordingsNamespace creates a new RecordingsNamespace.
- [`NewRegistryNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-registry-namespace) — NewRegistryNamespace creates a new RegistryNamespace with all sub-resources.
- [`NewShortCodesNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-short-codes-namespace) — NewShortCodesNamespace creates a new ShortCodesNamespace.
- [`NewSipProfileNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-sip-profile-namespace) — NewSipProfileNamespace creates a new SipProfileNamespace.
- [`NewVerifiedCallersNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-verified-callers-namespace) — NewVerifiedCallersNamespace creates a new VerifiedCallersNamespace.
- [`NewVideoNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-video-namespace) — NewVideoNamespace creates a new VideoNamespace with all sub-resources initialized.
- [`ResetDeprecationWarnOnce`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/reset-deprecation-warn-once) — ResetDeprecationWarnOnce clears the "once" tracking set so deprecation warnings fire again. Test-only helper.
- [`SetDeprecationLogger`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/set-deprecation-logger) — SetDeprecationLogger replaces the package-level deprecation logger. The previous logger is returned so tests can restore it. Passing nil is a no-op.

## Type Aliases

- [`AddressesResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/addresses-resource) — AddressesResource is an alias for AddressesNamespace, matching the Python class name for cross-SDK parity. Prefer AddressesNamespace in new Go code.
- [`CxmlWebhooksResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/cxml-webhooks-resource) — CxmlWebhooksResource is the Python class name for the auto-materialized CXML webhook resource. Go aliases AutoMaterializedWebhookResource here.
- [`FabricResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/fabric-resource) — FabricResource is the Python class name for a CrudResource that exposes the addresses sub-resource. Go aliases CrudWithAddresses here for the same reason as FabricResourcePUT.
- [`FabricResourcePUT`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/fabric-resource-put) — FabricResourcePUT is the Python class name for a CrudResource that uses PUT for updates. Go aliases CrudResource here so the cross-language audit sees the same type name on both sides without requiring a distinct struct.
- [`LookupResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/lookup-resource) — LookupResource is an alias for LookupNamespace, matching the Python class name for cross-SDK parity. Prefer LookupNamespace in new Go code.
- [`NumberGroupsResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/number-groups-resource) — NumberGroupsResource is an alias for NumberGroupsNamespace, matching the Python class name for cross-SDK parity.
- [`PhoneCallHandler`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/phone-call-handler) — PhoneCallHandler is the value of the “call\_handler“ field accepted by phone\_numbers.Update.
- [`PhoneNumbersResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/phone-numbers-resource) — PhoneNumbersResource is an alias for PhoneNumbersNamespace, matching the Python class name for cross-SDK parity. Prefer PhoneNumbersNamespace in new Go code.
- [`PubSubResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/pub-sub-resource) — PubSubResource is an alias for PubSubNamespace, matching the Python class name for cross-SDK parity. Prefer PubSubNamespace in new Go code.
- [`QueuesResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/queues-resource) — QueuesResource is an alias for QueuesNamespace, matching the Python class name for cross-SDK parity. Prefer QueuesNamespace in new Go code.
- [`RecordingsResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/recordings-resource) — RecordingsResource is an alias for RecordingsNamespace, matching the Python class name for cross-SDK parity. Prefer RecordingsNamespace in new Go code.
- [`ShortCodesResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/short-codes-resource) — ShortCodesResource is an alias for ShortCodesNamespace, matching the Python class name for cross-SDK parity. Prefer ShortCodesNamespace in new Go code.
- [`SipProfileResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/sip-profile-resource) — SipProfileResource is an alias for SipProfileNamespace, matching the Python class name for cross-SDK parity. Prefer SipProfileNamespace in new Go code.
- [`SwmlWebhooksResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/swml-webhooks-resource) — SwmlWebhooksResource is the Python class name for the auto-materialized SWML webhook resource. Go aliases AutoMaterializedWebhookResource here.

## Classes

- [`AddressesNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/addresses-namespace) — AddressesNamespace provides address management (no update endpoint).
- [`AutoMaterializedWebhookResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/auto-materialized-webhook-resource) — AutoMaterializedWebhookResource is a Fabric webhook resource that is normally auto-created by the phone\_numbers.Set\*Webhook helpers. Exposed for backwards compatibility: list/get/update/delete work as usual, but Create now emits a deprecation warning because creating a webhook resource directly produces an orphan that isn't bound to any phone number.
- [`CallFlowOptions`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/call-flow-options) — CallFlowOptions holds optional fields for SetCallFlow.
- [`CallFlowsResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/call-flows-resource) — CallFlowsResource extends CrudResource with version management and a singular sub-resource path convention.
- [`CallingNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace) — CallingNamespace provides REST-based call control. All commands are dispatched as POST /api/calling/calls with a "command" field.
- [`ChatNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/chat-namespace) — ChatNamespace provides Chat token generation.
- [`CompatAccounts`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-accounts) — CompatAccounts provides compat account/subproject management.
- [`CompatApplications`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-applications) — CompatApplications provides compat application management.
- [`CompatCalls`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-calls) — CompatCalls provides compat call management with recording and stream sub-resources.
- [`CompatConferences`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences) — CompatConferences provides compat conference management with participants, recordings, and streams.
- [`CompatFaxes`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-faxes) — CompatFaxes provides compat fax management with media sub-resources.
- [`CompatLamlBins`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-laml-bins) — CompatLamlBins provides compat cXML/LaML script management.
- [`CompatMessages`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-messages) — CompatMessages provides compat message management with media sub-resources.
- [`CompatNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-namespace) — CompatNamespace provides the Twilio-compatible LAML API with AccountSid scoping.
- [`CompatPhoneNumbers`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-phone-numbers) — CompatPhoneNumbers provides compat phone number management.
- [`CompatQueues`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-queues) — CompatQueues provides compat queue management with members.
- [`CompatRecordings`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-recordings) — CompatRecordings provides compat recording management.
- [`CompatTokens`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-tokens) — CompatTokens provides compat API token management.
- [`CompatTranscriptions`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-transcriptions) — CompatTranscriptions provides compat transcription management.
- [`ConferenceLogs`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/conference-logs) — ConferenceLogs provides conference log queries.
- [`ConferenceRoomsResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/conference-rooms-resource) — ConferenceRoomsResource uses singular "conference\_room" for sub-resource paths.
- [`CrudResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/crud-resource) — CrudResource provides standard List, Create, Get, Update, Delete operations against a REST collection endpoint within a namespace.
- [`CrudWithAddresses`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/crud-with-addresses) — CrudWithAddresses extends CrudResource with the nested addresses endpoint. Matches Python's CrudWithAddresses at \_base.py:109-113. Only resources that explicitly support the addresses sub-resource should embed this type; plain CrudResource does not expose ListAddresses.
- [`CxmlApplicationsResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/cxml-applications-resource) — CxmlApplicationsResource exposes the fabric cXML applications sub-resource. Create is explicitly disallowed — cXML applications cannot be created via this API. This mirrors Python's CxmlApplicationsResource.create raising NotImplementedError (fabric.py:90).
- [`CxmlWebhookOptions`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/cxml-webhook-options) — CxmlWebhookOptions holds optional fields for SetCxmlWebhook.
- [`DatasphereDocuments`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/datasphere-documents) — DatasphereDocuments provides document management with search and chunk operations for the Datasphere API.
- [`DatasphereNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/datasphere-namespace) — DatasphereNamespace groups Datasphere API resources.
- [`FabricAddresses`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/fabric-addresses) — FabricAddresses provides read-only access to fabric addresses.
- [`FabricNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/fabric-namespace) — FabricNamespace groups all Fabric API resource types.
- [`FabricTokens`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/fabric-tokens) — FabricTokens provides subscriber, guest, invite, and embed token creation.
- [`FaxLogs`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/fax-logs) — FaxLogs provides fax log queries.
- [`GenericResources`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/generic-resources) — GenericResources provides operations across all fabric resource types.
- [`ImportedNumbersNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/imported-numbers-namespace) — ImportedNumbersNamespace provides imported phone number management.
- [`LogsNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/logs-namespace) — LogsNamespace groups all log query resources.
- [`LookupNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/lookup-namespace) — LookupNamespace provides phone number lookup (carrier, CNAM).
- [`MessageLogs`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/message-logs) — MessageLogs provides message log queries.
- [`MFANamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/mfa-namespace) — MFANamespace provides multi-factor authentication via SMS or phone call.
- [`NumberGroupsNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/number-groups-namespace) — NumberGroupsNamespace provides number group management with membership operations.
- [`PhoneNumbersNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/phone-numbers-namespace) — PhoneNumbersNamespace provides phone number management with search and typed helpers for binding an inbound call to a handler (SWML webhook, cXML webhook, AI agent, call flow, RELAY application/topic).
- [`ProjectNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/project-namespace) — ProjectNamespace groups project management resources.
- [`ProjectTokens`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/project-tokens) — ProjectTokens provides project API token management.
- [`PubSubNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/pub-sub-namespace) — PubSubNamespace provides PubSub token generation.
- [`QueuesNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/queues-namespace) — QueuesNamespace provides queue management with member operations.
- [`RecordingsNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/recordings-namespace) — RecordingsNamespace provides recording management (read-only + delete).
- [`RegistryBrands`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-brands) — RegistryBrands provides 10DLC brand management.
- [`RegistryCampaigns`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-campaigns) — RegistryCampaigns provides 10DLC campaign management.
- [`RegistryNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-namespace) — RegistryNamespace groups all 10DLC Campaign Registry resources.
- [`RegistryNumbers`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-numbers) — RegistryNumbers provides 10DLC number assignment management.
- [`RegistryOrders`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-orders) — RegistryOrders provides 10DLC assignment order management.
- [`RelayTopicOptions`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/relay-topic-options) — RelayTopicOptions holds optional fields for SetRelayTopic.
- [`Resource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/resource) — Resource is a helper for building sub-paths from a base path.
- [`ShortCodesNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/short-codes-namespace) — ShortCodesNamespace provides short code management (read + update only).
- [`SipProfileNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/sip-profile-namespace) — SipProfileNamespace provides project SIP profile management (singleton resource).
- [`SubscribersResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/subscribers-resource) — SubscribersResource extends CrudResource with SIP endpoint management.
- [`VerifiedCallersNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/verified-callers-namespace) — VerifiedCallersNamespace provides verified caller ID management with verification flow.
- [`VideoConferences`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-conferences) — VideoConferences provides video conference management with tokens and streams.
- [`VideoConferenceTokens`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-conference-tokens) — VideoConferenceTokens provides video conference token management.
- [`VideoNamespace`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-namespace) — VideoNamespace groups all Video API resources.
- [`VideoRoomRecordings`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-room-recordings) — VideoRoomRecordings provides video room recording management.
- [`VideoRooms`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-rooms) — VideoRooms provides video room management with stream sub-resources.
- [`VideoRoomSessions`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-room-sessions) — VideoRoomSessions provides video room session management.
- [`VideoRoomTokens`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-room-tokens) — VideoRoomTokens provides video room token generation.
- [`VideoStreams`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-streams) — VideoStreams provides video stream management.
- [`VoiceLogs`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/voice-logs) — VoiceLogs provides voice log queries.

## Interfaces

- [`HTTPClient`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/http-client) — HTTPClient is the interface that namespace implementations use to make HTTP requests. It is satisfied by the httpAdapter in the parent rest package, which prevents an import cycle.
