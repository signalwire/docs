---
slug: "/reference/typescript/rest/namespaces/phone-numbers/phone-numbers-resource/set-swml-webhook"
title: "setSwmlWebhook"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.phone-numbers.PhoneNumbersResource.setSwmlWebhook"
  parent: "rest.namespaces.phone-numbers.PhoneNumbersResource"
  module: "rest.namespaces.phone-numbers"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts"
---
# `setSwmlWebhook`

Route inbound calls to an SWML webhook URL.

Your backend returns an SWML document per call. The server
auto-creates a `swml_webhook` Fabric resource keyed off this URL —
you do **not** need to call `fabric.swmlWebhooks.create` or
`fabric.resources.assignPhoneRoute`.

## Signature

```typescript
setSwmlWebhook(
  resourceId: string,
  url: string,
  extra: SetSwmlWebhookExtra = {}
): Promise<any>
```

## Parameters

| Name         | Type                  | Required | Default | Description                                                          |
| ------------ | --------------------- | -------- | ------- | -------------------------------------------------------------------- |
| `resourceId` | `string`              | yes      | —       | Unique phone-number resource ID.                                     |
| `url`        | `string`              | yes      | —       | Your backend's SWML endpoint.                                        |
| `extra`      | `SetSwmlWebhookExtra` | yes      | `{}`    | Additional wire-level fields (e.g. `name`) merged into the PUT body. |

## Returns

`Promise<any>` — The updated phone-number resource.

## Examples

```typescript
await client.phoneNumbers.setSwmlWebhook('pn-1', 'https://example.com/swml');
```

## Source

[`src/rest/namespaces/phone-numbers.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts)

Line 159.
