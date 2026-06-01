---
slug: "/reference/typescript/rest/namespaces/compat/compat-messages/list-media"
title: "listMedia"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatMessages.listMedia"
  parent: "rest.namespaces.compat.CompatMessages"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `listMedia`

List media attachments for a message (MMS).

## Signature

```typescript
listMedia(messageSid: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name         | Type          | Required | Default | Description                                    |
| ------------ | ------------- | -------- | ------- | ---------------------------------------------- |
| `messageSid` | `string`      | yes      | —       | Message SID.                                   |
| `params`     | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of media records.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 162.
