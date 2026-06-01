---
slug: "/reference/typescript/agent-server/agent-server/serve-static-files"
title: "serveStaticFiles"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AgentServer.AgentServer.serveStaticFiles"
  parent: "AgentServer.AgentServer"
  module: "AgentServer"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts"
---
# `serveStaticFiles`

Serve static files from a local directory under a given route prefix.
Includes path traversal protection (rejects `..`), MIME type detection,
and security headers (Cache-Control, X-Content-Type-Options).

## Signature

```typescript
serveStaticFiles(directory: string, route: string = '/'): void
```

## Parameters

| Name        | Type     | Required | Default | Description                                          |
| ----------- | -------- | -------- | ------- | ---------------------------------------------------- |
| `directory` | `string` | yes      | —       | Absolute or relative path to the directory to serve. |
| `route`     | `string` | yes      | `'/'`   | Route prefix for static files (defaults to '/').     |

## Returns

`void`

## Source

[`src/AgentServer.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts)

Line 202.
