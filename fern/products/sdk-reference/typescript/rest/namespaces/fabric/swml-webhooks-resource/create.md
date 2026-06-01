---
slug: "/reference/typescript/rest/namespaces/fabric/swml-webhooks-resource/create"
title: "create"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric.SwmlWebhooksResource.create"
  parent: "rest.namespaces.fabric.SwmlWebhooksResource"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts"
  deprecated: true
---
# `create`

> **Warning:**
>
> **Deprecated.** Creating a webhook Fabric resource directly produces an orphan that is not bound to any phone number. Use the `phoneNumbers.setSwmlWebhook` / `setCxmlWebhook` helper instead — it updates the phone number and the server auto-materializes the resource. Kept for backwards compatibility.

## Signature

```typescript
create(body: any = {}): Promise<any>
```

## Parameters

| Name   | Type  | Required | Default | Description |
| ------ | ----- | -------- | ------- | ----------- |
| `body` | `any` | yes      | `{}`    | —           |

## Returns

`Promise<any>`

## Source

[`src/rest/namespaces/fabric.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts)

Line 201.
