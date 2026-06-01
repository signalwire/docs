---
slug: "/reference/typescript/livewire/agent-server/rtc-session"
title: "rtcSession"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "livewire.AgentServer.rtcSession"
  parent: "livewire.AgentServer"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `rtcSession`

Decorator that registers the session entrypoint.

Supports both bare and parameterized usage:
server.rtcSession(fn)                       // bare
server.rtcSession(fn, { agentName: 'x' })   // with opts, explicit fn
server.rtcSession({ agentName: 'x' })(fn)   // parameterized decorator
@server.rtcSession                           // decorator (bare)
@server.rtcSession({ agentName: 'x' })       // decorator (parameterized)

## Signature

```typescript
rtcSession(
  fnOrOpts?: (ctx: JobContext) => Promise<void> | { agentName?: string; onRequest?: (args: any[]) => any | null; onSessionEnd?: (args: any[]) => any | null; type?: string },
  opts?: { ...4 fields }
): void | (fn: (ctx: JobContext) => Promise<void>) => (ctx: JobContext) => Promise<void>
```

## Parameters

| Name                | Type                                                                                                                                                                 | Required | Default | Description |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `fnOrOpts`          | `(ctx: JobContext) => Promise<void> \| { agentName?: string; onRequest?: (args: any[]) => any \| null; onSessionEnd?: (args: any[]) => any \| null; type?: string }` | no       | —       | —           |
| `opts`              | `{ agentName?: string; onRequest?: (args: any[]) => any \| null; onSessionEnd?: (args: any[]) => any \| null; type?: string }`                                       | no       | —       | —           |
| `opts.agentName`    | `string`                                                                                                                                                             | no       | —       | —           |
| `opts.onRequest`    | `(args: any[]) => any \| null`                                                                                                                                       | no       | —       | —           |
| `opts.onSessionEnd` | `(args: any[]) => any \| null`                                                                                                                                       | no       | —       | —           |
| `opts.type`         | `string`                                                                                                                                                             | no       | —       | —           |

## Returns

`void | (fn: (ctx: JobContext) => Promise<void>) => (ctx: JobContext) => Promise<void>`

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 1000.
