---
slug: "/reference/typescript/rest/namespaces/compat/compat-messages/delete-media"
title: "deleteMedia"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatMessages.deleteMedia"
  parent: "rest.namespaces.compat.CompatMessages"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `deleteMedia`

Delete a media attachment from a message.

## Signature

```typescript
deleteMedia(messageSid: string, mediaSid: string): Promise<any>
```

## Parameters

| Name         | Type     | Required | Default | Description  |
| ------------ | -------- | -------- | ------- | ------------ |
| `messageSid` | `string` | yes      | —       | Message SID. |
| `mediaSid`   | `string` | yes      | —       | Media SID.   |

## Returns

`Promise<any>` — The platform's delete response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 186.
