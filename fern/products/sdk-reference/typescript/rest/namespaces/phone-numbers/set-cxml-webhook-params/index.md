---
slug: "/reference/typescript/rest/namespaces/phone-numbers/set-cxml-webhook-params"
title: "SetCxmlWebhookParams"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "rest.namespaces.phone-numbers.SetCxmlWebhookParams"
  parent: "rest.namespaces.phone-numbers"
  module: "rest.namespaces.phone-numbers"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts"
---
# `SetCxmlWebhookParams`

Parameters for [PhoneNumbersResource.setCxmlWebhook](/reference/typescript/rest/namespaces/phone-numbers/phone-numbers-resource/set-cxml-webhook).

## Signature

```typescript
interface SetCxmlWebhookParams
```

## Properties

| Name                | Type     | Required | Default | Description                                                                            |
| ------------------- | -------- | -------- | ------- | -------------------------------------------------------------------------------------- |
| `fallbackUrl`       | `string` | no       | —       | Fallback URL if the primary request fails. Serialized as `call_fallback_url`.          |
| `statusCallbackUrl` | `string` | no       | —       | Status callback URL for call status updates. Serialized as `call_status_callback_url`. |
| `url`               | `string` | yes      | —       | Primary cXML document URL. Serialized as `call_request_url`.                           |

## Source

[`src/rest/namespaces/phone-numbers.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts)

Line 18.
