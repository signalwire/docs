---
slug: "/reference/typescript/rest/namespaces/phone-numbers/phone-numbers-resource/set-relay-topic"
title: "setRelayTopic"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.phone-numbers.PhoneNumbersResource.setRelayTopic"
  parent: "rest.namespaces.phone-numbers.PhoneNumbersResource"
  module: "rest.namespaces.phone-numbers"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts"
---
# `setRelayTopic`

Route inbound calls to a RELAY topic (client subscription).

## Signature

```typescript
setRelayTopic(resourceId: string, params: SetRelayTopicParams): Promise<any>
```

## Parameters

| Name         | Type                  | Required | Default | Description                                                                   |
| ------------ | --------------------- | -------- | ------- | ----------------------------------------------------------------------------- |
| `resourceId` | `string`              | yes      | —       | Unique phone-number resource ID.                                              |
| `params`     | `SetRelayTopicParams` | yes      | —       | Topic name and optional status-callback URL plus any extra wire-level fields. |

## Returns

`Promise<any>` — The updated phone-number resource.

## Source

[`src/rest/namespaces/phone-numbers.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts)

Line 283.
