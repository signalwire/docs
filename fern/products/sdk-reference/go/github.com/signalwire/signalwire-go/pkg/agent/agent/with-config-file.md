---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-config-file"
title: "WithConfigFile"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.WithConfigFile"
  parent: "github.com/signalwire/signalwire-go/pkg/agent"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `WithConfigFile`

WithConfigFile sets the path to an optional YAML/JSON service configuration file. When provided, the file is loaded at startup and its values are merged with (but do not override) explicit constructor parameters.

Python equivalent: config\_file parameter in AgentBase.**init**

## Signature

```go
func WithConfigFile(path string) AgentOption
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `path` | `string` | yes      | —       | —           |

## Returns

`AgentOption`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 271.
