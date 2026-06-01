---
slug: "/reference/typescript/rest/namespaces/compat/compat-conferences/update-participant"
title: "updateParticipant"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatConferences.updateParticipant"
  parent: "rest.namespaces.compat.CompatConferences"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `updateParticipant`

Update a participant (mute, hold, announce, etc.). LAML uses `POST`.

## Signature

```typescript
updateParticipant(
  conferenceSid: string,
  callSid: string,
  body: any = {}
): Promise<any>
```

## Parameters

| Name            | Type     | Required | Default | Description                                                            |
| --------------- | -------- | -------- | ------- | ---------------------------------------------------------------------- |
| `conferenceSid` | `string` | yes      | —       | Conference SID.                                                        |
| `callSid`       | `string` | yes      | —       | Participant's call SID.                                                |
| `body`          | `any`    | yes      | `{}`    | LAML-form update payload (e.g. `{ Muted: 'true' }`). Defaults to `{}`. |

## Returns

`Promise<any>` — The updated participant record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 323.
