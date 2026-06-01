---
slug: "/reference/typescript/rest/namespaces/compat/compat-calls/update-recording"
title: "updateRecording"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatCalls.updateRecording"
  parent: "rest.namespaces.compat.CompatCalls"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `updateRecording`

Update an active recording (e.g. `Status=paused` / `Status=stopped`).

## Signature

```typescript
updateRecording(
  callSid: string,
  recordingSid: string,
  body: any = {}
): Promise<any>
```

## Parameters

| Name           | Type     | Required | Default | Description                                                                                                            |
| -------------- | -------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------- |
| `callSid`      | `string` | yes      | —       | Call SID.                                                                                                              |
| `recordingSid` | `string` | yes      | —       | Recording SID returned by [startRecording](/reference/typescript/rest/namespaces/compat/compat-calls/start-recording). |
| `body`         | `any`    | yes      | `{}`    | Update payload. Defaults to `{}`.                                                                                      |

## Returns

`Promise<any>` — The updated recording record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 106.
