---
slug: "/reference/typescript/web-service/web-service/add-directory"
title: "addDirectory"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "WebService.WebService.addDirectory"
  parent: "WebService.WebService"
  module: "WebService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/WebService.ts"
---
# `addDirectory`

Add a new directory to serve at a URL route prefix.

## Signature

```typescript
addDirectory(route: string, directory: string): void
```

## Parameters

| Name        | Type     | Required | Default | Description                    |
| ----------- | -------- | -------- | ------- | ------------------------------ |
| `route`     | `string` | yes      | —       | URL prefix (e.g. '/docs').     |
| `directory` | `string` | yes      | —       | Local directory path to serve. |

## Returns

`void`

## Throws

- If the directory does not exist or is not a directory.

## Source

[`src/WebService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/WebService.ts)

Line 184.
