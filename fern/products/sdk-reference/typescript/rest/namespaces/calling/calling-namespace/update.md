---
slug: "/reference/typescript/rest/namespaces/calling/calling-namespace/update"
title: "update"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.calling.CallingNamespace.update"
  parent: "rest.namespaces.calling.CallingNamespace"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts"
---
# `update`

Update properties on an in-progress call.

## Signature

```typescript
update(params: any = {}): Promise<any>
```

## Parameters

| Name     | Type  | Required | Default | Description                                          |
| -------- | ----- | -------- | ------- | ---------------------------------------------------- |
| `params` | `any` | yes      | `{}`    | Platform-shaped update parameters. Defaults to `{}`. |

## Returns

`Promise<any>` — The platform's response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/calling.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts)

Line 75.
