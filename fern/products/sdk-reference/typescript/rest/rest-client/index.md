---
slug: "/reference/typescript/rest/rest-client"
title: "RestClient"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.RestClient"
  parent: "rest"
  module: "rest"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/index.ts"
---
# `RestClient`

REST client for the SignalWire platform APIs.

## Signature

```typescript
class RestClient
```

## Examples

```typescript
const client = new RestClient({
  project: 'your-project-id',
  token: 'your-api-token',
  host: 'your-space.signalwire.com',
});

// Or use env vars: SIGNALWIRE_PROJECT_ID, SIGNALWIRE_API_TOKEN, SIGNALWIRE_SPACE
const client = new RestClient();

// Use namespaced resources
await client.fabric.aiAgents.list();
await client.calling.play(callId, { play: [...] });
await client.phoneNumbers.search({ areaCode: '512' });
await client.video.rooms.create({ name: 'standup' });
await client.compat.calls.list();
```

## Properties

| Name              | Type                      | Required | Default | Description                                                                     |
| ----------------- | ------------------------- | -------- | ------- | ------------------------------------------------------------------------------- |
| `addresses`       | `AddressesResource`       | yes      | —       | Relay Address CRUD.                                                             |
| `calling`         | `CallingNamespace`        | yes      | —       | REST-based call control surface (all 37 commands as methods).                   |
| `chat`            | `ChatResource`            | yes      | —       | Chat token issuance.                                                            |
| `compat`          | `CompatNamespace`         | yes      | —       | Twilio-compatible LAML surface (legacy; prefer native namespaces for new work). |
| `datasphere`      | `DatasphereNamespace`     | yes      | —       | Datasphere RAG — document indexing and semantic search.                         |
| `fabric`          | `FabricNamespace`         | yes      | —       | Fabric composition — AI Agents, SWML scripts, call flows, tokens, etc.          |
| `importedNumbers` | `ImportedNumbersResource` | yes      | —       | Import externally-hosted phone numbers.                                         |
| `logs`            | `LogsNamespace`           | yes      | —       | Read-only message / voice / fax / conference logs.                              |
| `lookup`          | `LookupResource`          | yes      | —       | Carrier + CNAM phone-number lookups.                                            |
| `mfa`             | `MfaResource`             | yes      | —       | Multi-factor authentication (SMS / voice code send + verify).                   |
| `numberGroups`    | `NumberGroupsResource`    | yes      | —       | Number-group CRUD plus membership operations.                                   |
| `phoneNumbers`    | `PhoneNumbersResource`    | yes      | —       | Phone-number CRUD plus availability search.                                     |
| `project`         | `ProjectNamespace`        | yes      | —       | Project-scoped API token management.                                            |
| `pubsub`          | `PubSubResource`          | yes      | —       | PubSub token issuance.                                                          |
| `queues`          | `QueuesResource`          | yes      | —       | Call-queue CRUD plus member operations.                                         |
| `recordings`      | `RecordingsResource`      | yes      | —       | Recording read / delete.                                                        |
| `registry`        | `RegistryNamespace`       | yes      | —       | US 10DLC Campaign Registry — brands, campaigns, orders, numbers.                |
| `shortCodes`      | `ShortCodesResource`      | yes      | —       | Short-code read / update.                                                       |
| `sipProfile`      | `SipProfileResource`      | yes      | —       | Project-level SIP profile read / update (singleton).                            |
| `verifiedCallers` | `VerifiedCallersResource` | yes      | —       | Verified Caller ID CRUD plus verification flow.                                 |
| `video`           | `VideoNamespace`          | yes      | —       | Video rooms, sessions, recordings, conferences, tokens, streams.                |

## Methods

- [`constructor`](/reference/typescript/rest/rest-client/constructor) — Create a new REST client.

## Source

[`src/rest/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/index.ts)

Line 58.
