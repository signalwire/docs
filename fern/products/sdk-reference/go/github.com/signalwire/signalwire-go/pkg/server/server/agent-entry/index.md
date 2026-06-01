---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/agent-entry"
title: "AgentEntry"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/server.AgentEntry"
  parent: "github.com/signalwire/signalwire-go/pkg/server"
  module: "github.com.signalwire.signalwire-go.pkg.server"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go"
---
# `AgentEntry`

AgentEntry pairs a route with its agent for listing purposes.

## Signature

```go
type AgentEntry struct
```

## Properties

| Name    | Type                     | Required | Default | Description |
| ------- | ------------------------ | -------- | ------- | ----------- |
| `Agent` | `Agent *agent.AgentBase` | yes      | —       | —           |
| `Route` | `Route string`           | yes      | —       | —           |

## Source

[`pkg/server/server.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go)

Line 168.
