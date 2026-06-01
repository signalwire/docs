---
slug: "/reference/typescript/rest/namespaces/compat/compat-faxes/delete-media"
title: "deleteMedia"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatFaxes.deleteMedia"
  parent: "rest.namespaces.compat.CompatFaxes"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `deleteMedia`

Delete a media attachment from a fax.

## Signature

```typescript
deleteMedia(faxSid: string, mediaSid: string): Promise<any>
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `faxSid`   | `string` | yes      | —       | Fax SID.    |
| `mediaSid` | `string` | yes      | —       | Media SID.  |

## Returns

`Promise<any>` — The platform's delete response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 241.
