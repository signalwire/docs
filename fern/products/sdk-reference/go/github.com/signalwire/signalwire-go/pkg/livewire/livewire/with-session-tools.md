---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-session-tools"
title: "WithSessionTools"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.WithSessionTools"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `WithSessionTools`

WithSessionTools appends session-level tools to the AgentSession. These are merged with the bound Agent's tools in Start(). Mirrors Python AgentSession(tools=...) which stores list(tools or \[]) on self.\_tools (line 459) and merges them in \_build\_sw\_agent() (line 591).

## Signature

```go
func WithSessionTools(tools ...any) SessionOption
```

## Parameters

| Name       | Type  | Required | Default | Description |
| ---------- | ----- | -------- | ------- | ----------- |
| `...tools` | `any` | no       | —       | —           |

## Returns

`SessionOption`

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 450.
