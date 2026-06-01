---
slug: "/reference/dotnet/signal-wire.rest/rest-client"
title: "RestClient"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.RestClient"
  parent: "SignalWire.REST"
  module: "SignalWire.REST"
  visibility: "public"
---
# `RestClient`

Top-level SignalWire REST client.

Provides lazy access to every API namespace (fabric, calling,
phone\_numbers, datasphere, video, compat, etc.). Credentials can be
supplied explicitly or pulled from environment variables.

## Signature

```dotnet
public class RestClient
```

## Properties

| Name              | Type                                              | Required | Default | Description                                                                                                                                          |
| ----------------- | ------------------------------------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Addresses`       | `public Addresses Addresses { get; }`             | yes      | —       | Addresses.                                                                                                                                           |
| `BaseUrl`         | `public string BaseUrl { get; }`                  | yes      | —       | —                                                                                                                                                    |
| `Calling`         | `public Calling Calling { get; }`                 | yes      | —       | Calling API (37 call-control commands).                                                                                                              |
| `Chat`            | `public CrudResource Chat { get; }`               | yes      | —       | Chat tokens.                                                                                                                                         |
| `Compat`          | `public Compat Compat { get; }`                   | yes      | —       | Compatibility (Twilio-compatible LaML) API.                                                                                                          |
| `Datasphere`      | `public DatasphereNs Datasphere { get; }`         | yes      | —       | Datasphere documents.                                                                                                                                |
| `Fabric`          | `public Fabric Fabric { get; }`                   | yes      | —       | Fabric API (sub-resources: subscribers, sip\_endpoints, call\_flows, ...).                                                                           |
| `Http`            | `public HttpClient Http { get; }`                 | yes      | —       | —                                                                                                                                                    |
| `ImportedNumbers` | `public ImportedNumbers ImportedNumbers { get; }` | yes      | —       | Imported phone numbers (create only).                                                                                                                |
| `Logs`            | `public Logs Logs { get; }`                       | yes      | —       | Logs (messages, voice, fax, conferences).                                                                                                            |
| `Lookup`          | `public CrudResource Lookup { get; }`             | yes      | —       | Phone number lookup.                                                                                                                                 |
| `Mfa`             | `public Mfa Mfa { get; }`                         | yes      | —       | Multi-factor authentication (sms/call/verify dispatch).                                                                                              |
| `NumberGroups`    | `public NumberGroups NumberGroups { get; }`       | yes      | —       | Number groups (with membership operations).                                                                                                          |
| `PhoneNumbers`    | `public CrudResource PhoneNumbers { get; }`       | yes      | —       | Phone numbers.                                                                                                                                       |
| `Project`         | `public Project Project { get; }`                 | yes      | —       | Project management.                                                                                                                                  |
| `ProjectId`       | `public string ProjectId { get; }`                | yes      | —       | —                                                                                                                                                    |
| `Pubsub`          | `public CrudResource Pubsub { get; }`             | yes      | —       | PubSub tokens.                                                                                                                                       |
| `Queues`          | `public Queues Queues { get; }`                   | yes      | —       | Queues (Relay queues at /api/relay/rest/queues with member ops).                                                                                     |
| `Recordings`      | `public Recordings Recordings { get; }`           | yes      | —       | Recordings (Relay recordings at /api/relay/rest/recordings).                                                                                         |
| `Registry`        | `public Registry Registry { get; }`               | yes      | —       | Registry (10DLC brands, campaigns, orders, numbers).                                                                                                 |
| `ShortCodes`      | `public ShortCodes ShortCodes { get; }`           | yes      | —       | Short codes (PUT for update).                                                                                                                        |
| `SipProfile`      | `public SipProfile SipProfile { get; }`           | yes      | —       | SIP profile (singleton at /api/relay/rest/sip\_profile; legacy plural-path /api/relay/rest/sip\_profiles preserved for existing tests via BasePath). |
| `Space`           | `public string Space { get; }`                    | yes      | —       | —                                                                                                                                                    |
| `Token`           | `public string Token { get; }`                    | yes      | —       | —                                                                                                                                                    |
| `VerifiedCallers` | `public CrudResource VerifiedCallers { get; }`    | yes      | —       | Verified callers.                                                                                                                                    |
| `Video`           | `public Video Video { get; }`                     | yes      | —       | Video rooms (Python-parity entry-point with sub-namespaces).                                                                                         |

## Methods

- [`RestClient(string, string, string)`](/reference/dotnet/signal-wire.rest/rest-client/rest-client-string-string-string)
