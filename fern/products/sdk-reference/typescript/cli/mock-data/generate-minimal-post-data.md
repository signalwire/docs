---
slug: "/reference/typescript/cli/mock-data/generate-minimal-post-data"
title: "generateMinimalPostData"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "cli.mock-data.generateMinimalPostData"
  parent: "cli.mock-data"
  module: "cli.mock-data"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/cli/mock-data.ts"
---
# `generateMinimalPostData`

Generate a minimal mock POST body for executing a single SWAIG function.

## Signature

```typescript
generateMinimalPostData(
  fnName: string,
  args?: Record<string, unknown>,
  opts?: { ...2 fields }
): Record<string, unknown>
```

## Parameters

| Name             | Type                                                       | Required | Default | Description                           |
| ---------------- | ---------------------------------------------------------- | -------- | ------- | ------------------------------------- |
| `fnName`         | `string`                                                   | yes      | —       | Name of the SWAIG function to invoke. |
| `args`           | `Record<string, unknown>`                                  | no       | —       | Arguments to pass to the function.    |
| `opts`           | `{ callId?: string; overrides?: Record<string, unknown> }` | no       | —       | Optional call ID and field overrides. |
| `opts.callId`    | `string`                                                   | no       | —       | —                                     |
| `opts.overrides` | `Record<string, unknown>`                                  | no       | —       | —                                     |

## Returns

`Record<string, unknown>` — A record representing the minimal POST data for function execution.

## Source

[`src/cli/mock-data.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/cli/mock-data.ts)

Line 89.
