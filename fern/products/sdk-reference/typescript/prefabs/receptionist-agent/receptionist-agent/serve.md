---
slug: "/reference/typescript/prefabs/receptionist-agent/receptionist-agent/serve"
title: "serve"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ReceptionistAgent.ReceptionistAgent.serve"
  parent: "prefabs.ReceptionistAgent.ReceptionistAgent"
  module: "prefabs.ReceptionistAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `serve`

Start the HTTP server and begin listening for requests.

Uses `@hono/node-server` under the hood. When run in CLI mode
(`SWAIG_CLI_MODE=true`, set automatically by `npx swaig-test`), this is a
no-op so agent config can be inspected without starting a server.

## Signature

```typescript
serve(opts?: { ...2 fields }): Promise<void>
```

## Parameters

| Name        | Type                               | Required | Default | Description                                                                                                                  |
| ----------- | ---------------------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `opts`      | `{ host?: string; port?: number }` | no       | —       | Optional host/port overrides. Defaults to the values provided in the constructor options or the `PORT` environment variable. |
| `opts.host` | `string`                           | no       | —       | —                                                                                                                            |
| `opts.port` | `number`                           | no       | —       | —                                                                                                                            |

## Returns

`Promise<void>` — A promise that resolves once the server has begun listening.

## Examples

```typescript
const agent = new AgentBase({ name: 'demo', port: 3000 });
await agent.serve();
// Or override at runtime:
await agent.serve({ port: 8080, host: '127.0.0.1' });
```

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 2660.
