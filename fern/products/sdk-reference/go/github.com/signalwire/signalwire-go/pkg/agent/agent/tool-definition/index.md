---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/tool-definition"
title: "ToolDefinition"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.ToolDefinition"
  parent: "github.com/signalwire/signalwire-go/pkg/agent"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `ToolDefinition`

ToolDefinition describes a single SWAIG tool including its JSON Schema parameters and a Go handler function.

Python equivalent: signalwire.core.mixins.tool\_mixin.ToolMixin.define\_tool Added fields to match Python: WebhookURL (webhook\_url param), Required (required param for required argument names), IsTypedHandler (is\_typed\_handler).

## Signature

```go
type ToolDefinition struct
```

## Properties

| Name             | Type                          | Required | Default | Description                                                            |
| ---------------- | ----------------------------- | -------- | ------- | ---------------------------------------------------------------------- |
| `Description`    | `Description string`          | yes      | —       | —                                                                      |
| `Fillers`        | `Fillers map[string][]string` | yes      | —       | —                                                                      |
| `Handler`        | `Handler ToolHandler`         | yes      | —       | —                                                                      |
| `IsTypedHandler` | `IsTypedHandler bool`         | yes      | —       | whether handler uses typed structs (Python: is\_typed\_handler)        |
| `MetaData`       | `MetaData map[string]any`     | yes      | —       | —                                                                      |
| `Name`           | `Name string`                 | yes      | —       | —                                                                      |
| `Parameters`     | `Parameters map[string]any`   | yes      | —       | JSON Schema for arguments (properties map)                             |
| `Required`       | `Required []string`           | yes      | —       | Required parameter names included in the JSON Schema envelope          |
| `Secure`         | `Secure bool`                 | yes      | —       | —                                                                      |
| `SwaigFields`    | `SwaigFields map[string]any`  | yes      | —       | extra per-function SWAIG fields                                        |
| `WaitFile`       | `WaitFile string`             | yes      | —       | URL to audio file to play while the function executes                  |
| `WaitFileLoops`  | `WaitFileLoops int`           | yes      | —       | Number of times to loop WaitFile (0 = no loop)                         |
| `WebhookURL`     | `WebhookURL string`           | yes      | —       | Per-tool webhook URL; overrides the agent-level webhook when non-empty |

## Methods

- [`ValidateArgs`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/tool-definition/validate-args) — ValidateArgs validates the provided args map against the tool's parameter schema.

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 67.
