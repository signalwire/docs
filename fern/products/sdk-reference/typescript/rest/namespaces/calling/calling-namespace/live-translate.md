---
slug: "/reference/typescript/rest/namespaces/calling/calling-namespace/live-translate"
title: "liveTranslate"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.calling.CallingNamespace.liveTranslate"
  parent: "rest.namespaces.calling.CallingNamespace"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts"
---
# `liveTranslate`

Start live translation between two languages.

## Signature

```typescript
liveTranslate(callId: string, params: any = {}): Promise<any>
```

## Parameters

| Name     | Type     | Required | Default | Description                                                           |
| -------- | -------- | -------- | ------- | --------------------------------------------------------------------- |
| `callId` | `string` | yes      | —       | Target call's ID.                                                     |
| `params` | `any`    | yes      | `{}`    | Configuration (`source_lang`, `target_lang`, etc.). Defaults to `{}`. |

## Returns

`Promise<any>` — The platform's response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/calling.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts)

Line 476.
