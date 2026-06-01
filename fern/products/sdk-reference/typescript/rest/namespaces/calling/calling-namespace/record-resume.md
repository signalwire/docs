---
slug: "/reference/typescript/rest/namespaces/calling/calling-namespace/record-resume"
title: "recordResume"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.calling.CallingNamespace.recordResume"
  parent: "rest.namespaces.calling.CallingNamespace"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts"
---
# `recordResume`

Resume a paused recording.

## Signature

```typescript
recordResume(callId: string, params: any = {}): Promise<any>
```

## Parameters

| Name     | Type     | Required | Default | Description                                  |
| -------- | -------- | -------- | ------- | -------------------------------------------- |
| `callId` | `string` | yes      | —       | Target call's ID.                            |
| `params` | `any`    | yes      | `{}`    | Must include `control_id`. Defaults to `{}`. |

## Returns

`Promise<any>` — The platform's response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/calling.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts)

Line 215.
