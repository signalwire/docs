---
slug: "/reference/typescript/rest/namespaces/compat/compat-phone-numbers/search-local"
title: "searchLocal"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatPhoneNumbers.searchLocal"
  parent: "rest.namespaces.compat.CompatPhoneNumbers"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `searchLocal`

Search for available local phone numbers in a country.

## Signature

```typescript
searchLocal(country: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name      | Type          | Required | Default | Description                                                  |
| --------- | ------------- | -------- | ------- | ------------------------------------------------------------ |
| `country` | `string`      | yes      | —       | ISO-3166 country code (e.g. `"US"`, `"CA"`).                 |
| `params`  | `QueryParams` | no       | —       | Search filters (`AreaCode`, `Contains`, `NearNumber`, etc.). |

## Returns

`Promise<any>` — A paginated list of available local numbers.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 517.
