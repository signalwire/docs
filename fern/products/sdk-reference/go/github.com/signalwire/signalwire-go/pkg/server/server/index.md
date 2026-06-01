---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/server/server"
title: "server"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/server"
  module: "github.com.signalwire.signalwire-go.pkg.server"
---
# `server`

Package server provides AgentServer for hosting multiple AI agents on a single HTTP server with route-based dispatch.

## Signature

```go
package server
```

## Functions

- [`NewAgentServer`](/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/new-agent-server) — NewAgentServer creates a new AgentServer with the given options. Default host is "0.0.0.0" and default port is 3000.
- [`WithLogLevel`](/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/with-log-level) — WithLogLevel sets the global log level for the server. Accepted values (case-insensitive): "debug", "info", "warn", "warning", "error", "off". Mirrors Python AgentServer(log\_level=...) behavior: the level is applied globally via logging.SetGlobalLevel so all loggers in the process are affected. The default level is "info".
- [`WithRunHost`](/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/with-run-host) — WithRunHost overrides the listen address when calling Run.
- [`WithRunPort`](/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/with-run-port) — WithRunPort overrides the listen port when calling Run.
- [`WithServerHost`](/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/with-server-host) — WithServerHost sets the listen address for the server.
- [`WithServerPort`](/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/with-server-port) — WithServerPort sets the listen port for the server.

## Type Aliases

- [`RunOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/run-option) — RunOption overrides server settings at run time.
- [`ServerOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/server-option) — ServerOption configures an AgentServer during construction.

## Classes

- [`AgentEntry`](/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/agent-entry) — AgentEntry pairs a route with its agent for listing purposes.
- [`AgentServer`](/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/agent-server) — AgentServer hosts multiple agents on a single HTTP server with route-based dispatch. Each registered agent is mounted at its own route prefix and exposed via the agent's AsRouter() handler.
