---
slug: "/reference/typescript/rest/namespaces/imported-numbers/imported-numbers-resource/create"
title: "create"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.imported-numbers.ImportedNumbersResource.create"
  parent: "rest.namespaces.imported-numbers.ImportedNumbersResource"
  module: "rest.namespaces.imported-numbers"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/imported-numbers.ts"
---
# `create`

Import an externally-hosted phone number into this project.

## Signature

```typescript
create(body: any): Promise<any>
```

## Parameters

| Name   | Type  | Required | Default | Description                                                                                                    |
| ------ | ----- | -------- | ------- | -------------------------------------------------------------------------------------------------------------- |
| `body` | `any` | yes      | —       | Import payload specifying the number, carrier details, and any routing configuration required by the platform. |

## Returns

`Promise<any>` — The newly-imported phone-number record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/imported-numbers.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/imported-numbers.ts)

Line 28.
