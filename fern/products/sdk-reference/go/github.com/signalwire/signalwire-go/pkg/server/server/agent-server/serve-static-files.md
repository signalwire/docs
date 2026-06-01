---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/agent-server/serve-static-files"
title: "ServeStaticFiles"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/server.AgentServer.ServeStaticFiles"
  parent: "github.com/signalwire/signalwire-go/pkg/server.AgentServer"
  module: "github.com.signalwire.signalwire-go.pkg.server"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go"
---
# `ServeStaticFiles`

ServeStaticFiles registers a directory to be served at the given route.

## Signature

```go
func (*AgentServer) ServeStaticFiles(directory string, route string)
```

## Parameters

| Name        | Type     | Required | Default | Description |
| ----------- | -------- | -------- | ------- | ----------- |
| `directory` | `string` | yes      | —       | —           |
| `route`     | `string` | yes      | —       | —           |

## Source

[`pkg/server/server.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go)

Line 239.
