---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent/function-tool"
title: "FunctionTool"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.Agent.FunctionTool"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire.Agent"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `FunctionTool`

FunctionTool registers a named tool on the agent. The handler must be

```
func(args map[string]any, rawData map[string]any) *swaig.FunctionResult
```

or a LiveKit-style handler that will be wrapped:

```
func(ctx *RunContext, location string) string
```

In the LiveKit-style case the function's string parameters are inferred and the return string is wrapped into a FunctionResult automatically.

## Signature

```go
func (*Agent) FunctionTool(name string, handler any, opts ...ToolOption) *Agent
```

## Parameters

| Name      | Type         | Required | Default | Description |
| --------- | ------------ | -------- | ------- | ----------- |
| `name`    | `string`     | yes      | —       | —           |
| `handler` | `any`        | yes      | —       | —           |
| `...opts` | `ToolOption` | no       | —       | —           |

## Returns

`*Agent`

## Examples

**Example 1**

```go
func(args map[string]any, rawData map[string]any) *swaig.FunctionResult
```

**Example 2**

```go
func(ctx *RunContext, location string) string
```

**Example 3**

```go
func(args map[string]any, rawData map[string]any) *swaig.FunctionResult
```

**Example 4**

```go
func(ctx *RunContext, location string) string
```

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 196.
