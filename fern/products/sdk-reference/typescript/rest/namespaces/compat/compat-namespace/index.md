---
slug: "/reference/typescript/rest/namespaces/compat/compat-namespace"
title: "CompatNamespace"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatNamespace"
  parent: "rest.namespaces.compat"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `CompatNamespace`

Twilio-compatible LAML API namespace with AccountSid scoping.

Access via `client.compat.*`. This is the legacy LAML (cXML) surface for code
migrated from Twilio — all updates use POST bodies instead of REST-idiomatic
PATCH/PUT. Prefer the native SignalWire namespaces (`client.calling`, `client.fabric`,
etc.) for greenfield projects.

## Signature

```typescript
class CompatNamespace
```

## Examples

```typescript
await client.compat.messages.create({
  From: '+15551112222',
  To: '+15553334444',
  Body: 'Hello from SignalWire!',
});
```

## Properties

| Name             | Type                   | Required | Default | Description                                                          |
| ---------------- | ---------------------- | -------- | ------- | -------------------------------------------------------------------- |
| `accounts`       | `CompatAccounts`       | yes      | —       | Main and sub-account CRUD.                                           |
| `applications`   | `CompatApplications`   | yes      | —       | LAML Application CRUD.                                               |
| `calls`          | `CompatCalls`          | yes      | —       | Call CRUD plus recording / stream sub-resource management.           |
| `conferences`    | `CompatConferences`    | yes      | —       | Conference read / update with participants, recordings, and streams. |
| `faxes`          | `CompatFaxes`          | yes      | —       | Fax CRUD plus media sub-resource management.                         |
| `lamlBins`       | `CompatLamlBins`       | yes      | —       | LaML Bin (hosted script) CRUD.                                       |
| `messages`       | `CompatMessages`       | yes      | —       | Message CRUD plus media sub-resource management.                     |
| `phoneNumbers`   | `CompatPhoneNumbers`   | yes      | —       | Phone number CRUD plus search / purchase / import helpers.           |
| `queues`         | `CompatQueues`         | yes      | —       | Queue CRUD plus member list / fetch / dequeue.                       |
| `recordings`     | `CompatRecordings`     | yes      | —       | Recording list / fetch / delete.                                     |
| `tokens`         | `CompatTokens`         | yes      | —       | Compat API token create / update / delete.                           |
| `transcriptions` | `CompatTranscriptions` | yes      | —       | Transcription list / fetch / delete.                                 |

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/compat/compat-namespace/constructor)

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 770.
