---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/with-log-level"
title: "WithLogLevel"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/server.WithLogLevel"
  parent: "github.com/signalwire/signalwire-go/pkg/server"
  module: "github.com.signalwire.signalwire-go.pkg.server"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go"
---
# `WithLogLevel`

WithLogLevel sets the global log level for the server. Accepted values (case-insensitive): "debug", "info", "warn", "warning", "error", "off". Mirrors Python AgentServer(log\_level=...) behavior: the level is applied globally via logging.SetGlobalLevel so all loggers in the process are affected. The default level is "info".

## Signature

```go
func WithLogLevel(level string) ServerOption
```

## Parameters

| Name    | Type     | Required | Default | Description |
| ------- | -------- | -------- | ------- | ----------- |
| `level` | `string` | yes      | —       | —           |

## Returns

`ServerOption`

## Source

[`pkg/server/server.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go)

Line 65.
