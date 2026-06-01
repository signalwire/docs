---
slug: "/reference/typescript/rest/namespaces/fabric/fabric-tokens/create-embed-token"
title: "createEmbedToken"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric.FabricTokens.createEmbedToken"
  parent: "rest.namespaces.fabric.FabricTokens"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts"
---
# `createEmbedToken`

Issue a short-lived embed token for browser-side SignalWire widgets.

## Signature

```typescript
createEmbedToken(body: any = {}): Promise<any>
```

## Parameters

| Name   | Type  | Required | Default | Description                                                         |
| ------ | ----- | -------- | ------- | ------------------------------------------------------------------- |
| `body` | `any` | yes      | `{}`    | Embed-token payload (allowed origins, TTL, etc.). Defaults to `{}`. |

## Returns

`Promise<any>` — The token record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/fabric.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts)

Line 411.
