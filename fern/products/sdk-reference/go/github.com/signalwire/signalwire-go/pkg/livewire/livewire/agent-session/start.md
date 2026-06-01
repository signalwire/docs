---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent-session/start"
title: "Start"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.AgentSession.Start"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire.AgentSession"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `Start`

Start binds the session to an agent and prepares the underlying SignalWire AgentBase for serving.

Mirrors Python AgentSession.start(agent, \*, room=None, record=False) (line 504). The room and record parameters are accepted via StartOption functional options (WithRoom and WithRecord) following Go idioms.

## Signature

```go
func (*AgentSession) Start(ctx *JobContext, ag *Agent, opts ...StartOption) error
```

## Parameters

| Name      | Type          | Required | Default | Description |
| --------- | ------------- | -------- | ------- | ----------- |
| `ctx`     | `*JobContext` | yes      | —       | —           |
| `ag`      | `*Agent`      | yes      | —       | —           |
| `...opts` | `StartOption` | no       | —       | —           |

## Returns

`error`

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 571.
