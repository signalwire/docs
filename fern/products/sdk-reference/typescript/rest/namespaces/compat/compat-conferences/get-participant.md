---
slug: "/reference/typescript/rest/namespaces/compat/compat-conferences/get-participant"
title: "getParticipant"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatConferences.getParticipant"
  parent: "rest.namespaces.compat.CompatConferences"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `getParticipant`

Fetch a specific participant (by its call SID) in a conference.

## Signature

```typescript
getParticipant(conferenceSid: string, callSid: string): Promise<any>
```

## Parameters

| Name            | Type     | Required | Default | Description             |
| --------------- | -------- | -------- | ------- | ----------------------- |
| `conferenceSid` | `string` | yes      | —       | Conference SID.         |
| `callSid`       | `string` | yes      | —       | Participant's call SID. |

## Returns

`Promise<any>` — The participant record.

## Throws

- On any non-2xx HTTP response (including `404`).

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 309.
