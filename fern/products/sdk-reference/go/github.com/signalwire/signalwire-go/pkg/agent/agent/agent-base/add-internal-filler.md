---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-internal-filler"
title: "AddInternalFiller"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.AddInternalFiller"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `AddInternalFiller`

AddInternalFiller adds fillers for a specific function and language.

See SetInternalFillers for the complete list of supported funcName values (SupportedInternalFillerNames) and what fillers do. Names outside the supported set log a warning and are stored but will not play at runtime.

## Signature

```go
func (*AgentBase) AddInternalFiller(funcName string, langCode string, fillers []string) *AgentBase
```

## Parameters

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `funcName` | `string`   | yes      | —       | —           |
| `langCode` | `string`   | yes      | —       | —           |
| `fillers`  | `[]string` | yes      | —       | —           |

## Returns

`*AgentBase`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1440.
