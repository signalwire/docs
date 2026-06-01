---
slug: "/reference/typescript/rest/namespaces/compat/compat-faxes/get-media"
title: "getMedia"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatFaxes.getMedia"
  parent: "rest.namespaces.compat.CompatFaxes"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `getMedia`

Fetch a specific media attachment on a fax.

## Signature

```typescript
getMedia(faxSid: string, mediaSid: string): Promise<any>
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `faxSid`   | `string` | yes      | —       | Fax SID.    |
| `mediaSid` | `string` | yes      | —       | Media SID.  |

## Returns

`Promise<any>` — The media record.

## Throws

- On any non-2xx HTTP response (including `404`).

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 229.
