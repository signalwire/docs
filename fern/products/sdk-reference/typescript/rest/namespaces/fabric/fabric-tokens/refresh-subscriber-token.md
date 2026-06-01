---
slug: "/reference/typescript/rest/namespaces/fabric/fabric-tokens/refresh-subscriber-token"
title: "refreshSubscriberToken"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric.FabricTokens.refreshSubscriberToken"
  parent: "rest.namespaces.fabric.FabricTokens"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts"
---
# `refreshSubscriberToken`

Refresh an existing subscriber JWT, extending its lifetime.

## Signature

```typescript
refreshSubscriberToken(body: any = {}): Promise<any>
```

## Parameters

| Name   | Type  | Required | Default | Description                                                               |
| ------ | ----- | -------- | ------- | ------------------------------------------------------------------------- |
| `body` | `any` | yes      | `{}`    | Refresh payload (usually containing the current token). Defaults to `{}`. |

## Returns

`Promise<any>` — The refreshed token record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/fabric.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts)

Line 378.
