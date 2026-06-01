---
slug: "/reference/typescript/rest/namespaces/compat/compat-conferences/list-recordings"
title: "listRecordings"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatConferences.listRecordings"
  parent: "rest.namespaces.compat.CompatConferences"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `listRecordings`

List recordings taken of a conference.

## Signature

```typescript
listRecordings(conferenceSid: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name            | Type          | Required | Default | Description                                    |
| --------------- | ------------- | -------- | ------- | ---------------------------------------------- |
| `conferenceSid` | `string`      | yes      | —       | Conference SID.                                |
| `params`        | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of recordings.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 349.
