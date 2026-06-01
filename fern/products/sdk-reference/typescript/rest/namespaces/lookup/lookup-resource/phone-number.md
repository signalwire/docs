---
slug: "/reference/typescript/rest/namespaces/lookup/lookup-resource/phone-number"
title: "phoneNumber"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.lookup.LookupResource.phoneNumber"
  parent: "rest.namespaces.lookup.LookupResource"
  module: "rest.namespaces.lookup"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/lookup.ts"
---
# `phoneNumber`

Look up carrier and CNAM information for a phone number.

## Signature

```typescript
phoneNumber(e164: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name     | Type          | Required | Default | Description                                                                                                   |
| -------- | ------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------- |
| `e164`   | `string`      | yes      | —       | The phone number in E.164 format (e.g. `"+15551234567"`).                                                     |
| `params` | `QueryParams` | no       | —       | Optional query parameters, most commonly `include: "carrier,caller-name"` to enable carrier and CNAM lookups. |

## Returns

`Promise<any>` — The lookup record containing any requested datasets.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/lookup.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/lookup.ts)

Line 35.
