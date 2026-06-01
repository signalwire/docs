---
slug: "/reference/typescript/agent-server/agent-server"
title: "AgentServer"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "AgentServer.AgentServer"
  parent: "AgentServer"
  module: "AgentServer"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts"
---
# `AgentServer`

Multi-agent HTTP server that hosts multiple AgentBase instances on distinct route prefixes.

Use `AgentServer` when one process should serve more than one agent — each with its own
prompt, tools, and route. Internally, each agent's Hono router is mounted under its own
path. Static assets can also be served from a configured directory.

## Signature

```typescript
class AgentServer
```

## Examples

```typescript
import { AgentServer, AgentBase } from '@signalwire/sdk';

const salesAgent = new AgentBase({ name: 'sales', route: '/sales' });
const supportAgent = new AgentBase({ name: 'support', route: '/support' });

const server = new AgentServer({ host: '0.0.0.0', port: 3000 });
server.register(salesAgent);
server.register(supportAgent);

await server.run();
```

## See Also

- \[[AgentBase](/reference/typescript/agent-base)]\(xref://[AgentBase](/reference/typescript/agent-base))

## Properties

| Name       | Type     | Required | Default | Description                               |
| ---------- | -------- | -------- | ------- | ----------------------------------------- |
| `host`     | `string` | yes      | —       | Hostname the server binds to.             |
| `log`      | `Logger` | yes      | —       | Public logger for this server instance.   |
| `logLevel` | `string` | yes      | —       | Logging level (debug, info, warn, error). |
| `port`     | `number` | yes      | —       | Port the server listens on.               |

## Methods

- [`constructor`](/reference/typescript/agent-server/agent-server/constructor) — Create an AgentServer.
- [`getAgent`](/reference/typescript/agent-server/agent-server/get-agent) — Look up a registered agent by its route prefix.
- [`getAgents`](/reference/typescript/agent-server/agent-server/get-agents) — Get all registered agents keyed by their route prefix.
- [`getApp`](/reference/typescript/agent-server/agent-server/get-app) — Build and return the Hono application with all registered agents and a root listing endpoint.
- [`register`](/reference/typescript/agent-server/agent-server/register) — Register an agent at the given route prefix.
- [`registerGlobalRoutingCallback`](/reference/typescript/agent-server/agent-server/register-global-routing-callback) — Register a routing callback across all agents at the given path.
- [`registerSipUsername`](/reference/typescript/agent-server/agent-server/register-sip-username) — Register a mapping from a SIP username to an agent route at the server level.
- [`run`](/reference/typescript/agent-server/agent-server/run) — Start the HTTP server and begin listening for requests.
- [`serveStaticFiles`](/reference/typescript/agent-server/agent-server/serve-static-files) — Serve static files from a local directory under a given route prefix. Includes path traversal protection (rejects `..`), MIME type detection, and security headers (Cache-Control, X-Content-Type-Options).
- [`setupSipRouting`](/reference/typescript/agent-server/agent-server/setup-sip-routing) — Set up central SIP-based routing for the server.
- [`unregister`](/reference/typescript/agent-server/agent-server/unregister) — Remove an agent registration by route.

## Source

[`src/AgentServer.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts)

Line 70.
