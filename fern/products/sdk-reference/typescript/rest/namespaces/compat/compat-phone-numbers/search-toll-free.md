---
slug: "/reference/typescript/rest/namespaces/compat/compat-phone-numbers/search-toll-free"
title: "searchTollFree"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatPhoneNumbers.searchTollFree"
  parent: "rest.namespaces.compat.CompatPhoneNumbers"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `searchTollFree`

Search for available toll-free phone numbers in a country.

## Signature

```typescript
searchTollFree(country: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name      | Type          | Required | Default | Description                                      |
| --------- | ------------- | -------- | ------- | ------------------------------------------------ |
| `country` | `string`      | yes      | —       | ISO-3166 country code.                           |
| `params`  | `QueryParams` | no       | —       | Search filters (`Contains`, `NearNumber`, etc.). |

## Returns

`Promise<any>` — A paginated list of available toll-free numbers.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 529.
