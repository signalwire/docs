---
slug: "/reference/typescript/agent-base/agent-base/run-serverless"
title: "runServerless"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AgentBase.AgentBase.runServerless"
  parent: "AgentBase.AgentBase"
  module: "AgentBase"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `runServerless`

Handle a single serverless invocation (AWS Lambda, Google Cloud Functions, Azure Functions, or CGI).

Matches Python `run(event, context)` when executed in a serverless environment. Python's
`run()` auto-detects the platform via `get_execution_mode()` and dispatches accordingly;
in TypeScript the serverless path is an **explicit** method so that `run()` keeps its
HTTP-server semantics and callers opt in to serverless dispatch deliberately.

Platform detection follows the same environment-variable heuristics as Python's
`ServerlessMixin`: `AWS_LAMBDA_FUNCTION_NAME` → Lambda, `K_SERVICE` → GCF,
`FUNCTIONS_WORKER_RUNTIME` → Azure, `GATEWAY_INTERFACE` → CGI.

Usage in a Lambda handler file:

```ts
export const handler = (event: any, context: any) => agent.runServerless(event, context);
```

## Signature

```typescript
runServerless(
  event: ServerlessEvent,
  context?: unknown,
  platform?: "lambda" | "gcf" | "azure" | "cgi" | "auto"
): Promise<ServerlessResponse>
```

## Parameters

| Name       | Type                                              | Required | Default | Description                                                             |
| ---------- | ------------------------------------------------- | -------- | ------- | ----------------------------------------------------------------------- |
| `event`    | `ServerlessEvent`                                 | yes      | —       | The serverless event payload (Lambda event, GCF request body, etc.).    |
| `context`  | `unknown`                                         | no       | —       | The serverless context object (Lambda context, Azure context, etc.).    |
| `platform` | `"lambda" \| "gcf" \| "azure" \| "cgi" \| "auto"` | no       | —       | Optional platform override; defaults to 'auto' (environment detection). |

## Returns

`Promise<ServerlessResponse>` — The normalized serverless response object.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 2709.
