---
slug: "/reference/cpp/signalwire/rest/rest-client"
title: "RestClient"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient"
  parent: "signalwire::rest"
  module: "signalwire.rest"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `RestClient`

Top-level SignalWire REST client with all API namespaces.

## Signature

```cpp
class signalwire::rest::RestClient
```

## Methods

- [`addresses`](/reference/cpp/signalwire/rest/rest-client/addresses)
- [`calling`](/reference/cpp/signalwire/rest/rest-client/calling)
- [`chat`](/reference/cpp/signalwire/rest/rest-client/chat)
- [`compat`](/reference/cpp/signalwire/rest/rest-client/compat)
- [`datasphere`](/reference/cpp/signalwire/rest/rest-client/datasphere)
- [`fabric`](/reference/cpp/signalwire/rest/rest-client/fabric)
- [`from_env`](/reference/cpp/signalwire/rest/rest-client/from-env) — Initialize from environment variables.
- [`http_client`](/reference/cpp/signalwire/rest/rest-client/http-client) — Get the underlying HTTP client.
- [`imported_numbers`](/reference/cpp/signalwire/rest/rest-client/imported-numbers)
- [`logs`](/reference/cpp/signalwire/rest/rest-client/logs)
- [`lookup`](/reference/cpp/signalwire/rest/rest-client/lookup)
- [`mfa`](/reference/cpp/signalwire/rest/rest-client/mfa)
- [`number_groups`](/reference/cpp/signalwire/rest/rest-client/number-groups)
- [`phone_numbers`](/reference/cpp/signalwire/rest/rest-client/phone-numbers)
- [`project`](/reference/cpp/signalwire/rest/rest-client/project)
- [`project_id`](/reference/cpp/signalwire/rest/rest-client/project-id) — Project ID accessor (read-only).
- [`pubsub`](/reference/cpp/signalwire/rest/rest-client/pubsub)
- [`queues`](/reference/cpp/signalwire/rest/rest-client/queues)
- [`recordings`](/reference/cpp/signalwire/rest/rest-client/recordings)
- [`registry`](/reference/cpp/signalwire/rest/rest-client/registry)
- [`RestClient`](/reference/cpp/signalwire/rest/rest-client/rest-client)
- [`short_codes`](/reference/cpp/signalwire/rest/rest-client/short-codes)
- [`sip_profile`](/reference/cpp/signalwire/rest/rest-client/sip-profile)
- [`verified_callers`](/reference/cpp/signalwire/rest/rest-client/verified-callers)
- [`video`](/reference/cpp/signalwire/rest/rest-client/video)
- [`with_base_url`](/reference/cpp/signalwire/rest/rest-client/with-base-url) — Construct with an explicit pre-built base URL (http://... or https://...) instead of synthesizing one from the SignalWire space hostname. Used by audit harnesses pointing the client at loopback fixtures. The space-based constructor remains the production path.

## Classes

- [`AddressesNamespace`](/reference/cpp/signalwire/rest/rest-client/addresses-namespace)
- [`CallingNamespace`](/reference/cpp/signalwire/rest/rest-client/calling-namespace)
- [`ChatNamespace`](/reference/cpp/signalwire/rest/rest-client/chat-namespace)
- [`CompatAccounts`](/reference/cpp/signalwire/rest/rest-client/compat-accounts)
- [`CompatApplications`](/reference/cpp/signalwire/rest/rest-client/compat-applications)
- [`CompatCalls`](/reference/cpp/signalwire/rest/rest-client/compat-calls)
- [`CompatConferences`](/reference/cpp/signalwire/rest/rest-client/compat-conferences)
- [`CompatFaxes`](/reference/cpp/signalwire/rest/rest-client/compat-faxes)
- [`CompatLamlBins`](/reference/cpp/signalwire/rest/rest-client/compat-laml-bins)
- [`CompatMessages`](/reference/cpp/signalwire/rest/rest-client/compat-messages)
- [`CompatNamespace`](/reference/cpp/signalwire/rest/rest-client/compat-namespace)
- [`CompatPhoneNumbers`](/reference/cpp/signalwire/rest/rest-client/compat-phone-numbers)
- [`CompatQueues`](/reference/cpp/signalwire/rest/rest-client/compat-queues)
- [`CompatRecordings`](/reference/cpp/signalwire/rest/rest-client/compat-recordings)
- [`CompatTokens`](/reference/cpp/signalwire/rest/rest-client/compat-tokens)
- [`CompatTranscriptions`](/reference/cpp/signalwire/rest/rest-client/compat-transcriptions)
- [`DatasphereDocuments`](/reference/cpp/signalwire/rest/rest-client/datasphere-documents)
- [`DatasphereNamespace`](/reference/cpp/signalwire/rest/rest-client/datasphere-namespace)
- [`FabricAddresses`](/reference/cpp/signalwire/rest/rest-client/fabric-addresses)
- [`FabricCallFlows`](/reference/cpp/signalwire/rest/rest-client/fabric-call-flows)
- [`FabricConferenceRooms`](/reference/cpp/signalwire/rest/rest-client/fabric-conference-rooms)
- [`FabricCxmlApplications`](/reference/cpp/signalwire/rest/rest-client/fabric-cxml-applications)
- [`FabricGenericResources`](/reference/cpp/signalwire/rest/rest-client/fabric-generic-resources)
- [`FabricNamespace`](/reference/cpp/signalwire/rest/rest-client/fabric-namespace)
- [`FabricResource`](/reference/cpp/signalwire/rest/rest-client/fabric-resource)
- [`FabricResourcePUT`](/reference/cpp/signalwire/rest/rest-client/fabric-resource-put)
- [`FabricSubscribers`](/reference/cpp/signalwire/rest/rest-client/fabric-subscribers)
- [`FabricTokens`](/reference/cpp/signalwire/rest/rest-client/fabric-tokens)
- [`ImportedNumbersNamespace`](/reference/cpp/signalwire/rest/rest-client/imported-numbers-namespace)
- [`LogsConferences`](/reference/cpp/signalwire/rest/rest-client/logs-conferences)
- [`LogsFax`](/reference/cpp/signalwire/rest/rest-client/logs-fax)
- [`LogsMessages`](/reference/cpp/signalwire/rest/rest-client/logs-messages)
- [`LogsNamespace`](/reference/cpp/signalwire/rest/rest-client/logs-namespace)
- [`LogsVoice`](/reference/cpp/signalwire/rest/rest-client/logs-voice)
- [`LookupNamespace`](/reference/cpp/signalwire/rest/rest-client/lookup-namespace)
- [`MFANamespace`](/reference/cpp/signalwire/rest/rest-client/mfa-namespace)
- [`NumberGroupsNamespace`](/reference/cpp/signalwire/rest/rest-client/number-groups-namespace)
- [`PhoneNumbersNamespace`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace)
- [`ProjectNamespace`](/reference/cpp/signalwire/rest/rest-client/project-namespace)
- [`ProjectTokens`](/reference/cpp/signalwire/rest/rest-client/project-tokens)
- [`PubSubNamespace`](/reference/cpp/signalwire/rest/rest-client/pub-sub-namespace)
- [`QueuesNamespace`](/reference/cpp/signalwire/rest/rest-client/queues-namespace)
- [`RecordingsNamespace`](/reference/cpp/signalwire/rest/rest-client/recordings-namespace)
- [`RegistryBrands`](/reference/cpp/signalwire/rest/rest-client/registry-brands)
- [`RegistryCampaigns`](/reference/cpp/signalwire/rest/rest-client/registry-campaigns)
- [`RegistryNamespace`](/reference/cpp/signalwire/rest/rest-client/registry-namespace)
- [`RegistryNumbers`](/reference/cpp/signalwire/rest/rest-client/registry-numbers)
- [`RegistryOrders`](/reference/cpp/signalwire/rest/rest-client/registry-orders)
- [`ShortCodesNamespace`](/reference/cpp/signalwire/rest/rest-client/short-codes-namespace)
- [`SipProfileNamespace`](/reference/cpp/signalwire/rest/rest-client/sip-profile-namespace)
- [`VerifiedCallersNamespace`](/reference/cpp/signalwire/rest/rest-client/verified-callers-namespace)
- [`VideoConferences`](/reference/cpp/signalwire/rest/rest-client/video-conferences)
- [`VideoConferenceTokens`](/reference/cpp/signalwire/rest/rest-client/video-conference-tokens)
- [`VideoNamespace`](/reference/cpp/signalwire/rest/rest-client/video-namespace)
- [`VideoRoomRecordings`](/reference/cpp/signalwire/rest/rest-client/video-room-recordings)
- [`VideoRooms`](/reference/cpp/signalwire/rest/rest-client/video-rooms)
- [`VideoRoomSessions`](/reference/cpp/signalwire/rest/rest-client/video-room-sessions)
- [`VideoRoomTokens`](/reference/cpp/signalwire/rest/rest-client/video-room-tokens)
- [`VideoStreams`](/reference/cpp/signalwire/rest/rest-client/video-streams)

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 18.
