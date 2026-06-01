---
slug: "/reference/typescript/rest/namespaces/phone-numbers/phone-numbers-resource/set-cxml-webhook"
title: "setCxmlWebhook"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.phone-numbers.PhoneNumbersResource.setCxmlWebhook"
  parent: "rest.namespaces.phone-numbers.PhoneNumbersResource"
  module: "rest.namespaces.phone-numbers"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts"
---
# `setCxmlWebhook`

Route inbound calls to a cXML (Twilio-compat / LAML) webhook.

Despite the wire value `laml_webhooks` being plural, this creates a
single `cxml_webhook` Fabric resource.  `fallbackUrl` is used when the
primary URL fails; `statusCallbackUrl` receives call status updates.

## Signature

```typescript
setCxmlWebhook(resourceId: string, params: SetCxmlWebhookParams): Promise<any>
```

## Parameters

| Name         | Type                   | Required | Default | Description                                                             |
| ------------ | ---------------------- | -------- | ------- | ----------------------------------------------------------------------- |
| `resourceId` | `string`               | yes      | —       | Unique phone-number resource ID.                                        |
| `params`     | `SetCxmlWebhookParams` | yes      | —       | URL and optional fallback/status URLs plus any extra wire-level fields. |

## Returns

`Promise<any>` — The updated phone-number resource.

## Examples

```typescript
await client.phoneNumbers.setCxmlWebhook('pn-1', {
  url: 'https://example.com/voice.xml',
  fallbackUrl: 'https://example.com/fallback.xml',
});
```

## Source

[`src/rest/namespaces/phone-numbers.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts)

Line 187.
