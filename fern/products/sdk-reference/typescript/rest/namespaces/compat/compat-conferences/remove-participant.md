---
slug: "/reference/typescript/rest/namespaces/compat/compat-conferences/remove-participant"
title: "removeParticipant"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatConferences.removeParticipant"
  parent: "rest.namespaces.compat.CompatConferences"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `removeParticipant`

Remove a participant from a conference (kick).

## Signature

```typescript
removeParticipant(conferenceSid: string, callSid: string): Promise<any>
```

## Parameters

| Name            | Type     | Required | Default | Description             |
| --------------- | -------- | -------- | ------- | ----------------------- |
| `conferenceSid` | `string` | yes      | —       | Conference SID.         |
| `callSid`       | `string` | yes      | —       | Participant's call SID. |

## Returns

`Promise<any>` — The platform's delete response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 335.
