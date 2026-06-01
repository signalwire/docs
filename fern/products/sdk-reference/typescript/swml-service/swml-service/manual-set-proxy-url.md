---
slug: "/reference/typescript/swml-service/swml-service/manual-set-proxy-url"
title: "manualSetProxyUrl"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLService.SWMLService.manualSetProxyUrl"
  parent: "SWMLService.SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `manualSetProxyUrl`

Manually set the proxy base URL used for webhook URL generation.
Mirrors Python's `manual_set_proxy_url()`.

## Signature

```typescript
manualSetProxyUrl(url: string): this
```

## Parameters

| Name  | Type     | Required | Default | Description                                                   |
| ----- | -------- | -------- | ------- | ------------------------------------------------------------- |
| `url` | `string` | yes      | —       | The external-facing base URL (trailing slashes are stripped). |

## Returns

`this` — This service for chaining.

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 879.
