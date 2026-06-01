---
slug: "/reference/typescript/rest/namespaces/compat/compat-faxes/list-media"
title: "listMedia"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatFaxes.listMedia"
  parent: "rest.namespaces.compat.CompatFaxes"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `listMedia`

List media attachments for a fax.

## Signature

```typescript
listMedia(faxSid: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name     | Type          | Required | Default | Description                                    |
| -------- | ------------- | -------- | ------- | ---------------------------------------------- |
| `faxSid` | `string`      | yes      | —       | Fax SID.                                       |
| `params` | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of media records.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 217.
