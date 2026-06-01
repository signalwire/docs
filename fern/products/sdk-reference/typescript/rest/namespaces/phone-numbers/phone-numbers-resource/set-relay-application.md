---
slug: "/reference/typescript/rest/namespaces/phone-numbers/phone-numbers-resource/set-relay-application"
title: "setRelayApplication"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.phone-numbers.PhoneNumbersResource.setRelayApplication"
  parent: "rest.namespaces.phone-numbers.PhoneNumbersResource"
  module: "rest.namespaces.phone-numbers"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts"
---
# `setRelayApplication`

Route inbound calls to a named RELAY application.

## Signature

```typescript
setRelayApplication(
  resourceId: string,
  name: string,
  extra: Record<string, unknown> = {}
): Promise<any>
```

## Parameters

| Name         | Type                      | Required | Default | Description                                        |
| ------------ | ------------------------- | -------- | ------- | -------------------------------------------------- |
| `resourceId` | `string`                  | yes      | —       | Unique phone-number resource ID.                   |
| `name`       | `string`                  | yes      | —       | RELAY application name.                            |
| `extra`      | `Record<string, unknown>` | yes      | `{}`    | Additional wire-level fields merged into the body. |

## Returns

`Promise<any>` — The updated phone-number resource.

## Source

[`src/rest/namespaces/phone-numbers.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts)

Line 267.
