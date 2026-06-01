---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-schema-path"
title: "WithSchemaPath"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.WithSchemaPath"
  parent: "github.com/signalwire/signalwire-go/pkg/agent"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `WithSchemaPath`

WithSchemaPath sets the path to an optional SWML schema file used for validation. If empty, no schema validation is performed.

Python equivalent: schema\_path parameter in AgentBase.**init**

## Signature

```go
func WithSchemaPath(path string) AgentOption
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `path` | `string` | yes      | —       | —           |

## Returns

`AgentOption`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 237.
