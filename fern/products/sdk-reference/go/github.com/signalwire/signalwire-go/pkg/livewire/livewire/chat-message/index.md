---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/chat-message"
title: "ChatMessage"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.ChatMessage"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `ChatMessage`

ChatMessage holds a single role/content pair in a conversation history. The JSON tags match the dict keys produced by the Python ChatContext.append() implementation: {"role": ..., "content": ...}.

## Signature

```go
type ChatMessage struct
```

## Properties

| Name      | Type             | Required | Default | Description |
| --------- | ---------------- | -------- | ------- | ----------- |
| `Content` | `Content string` | yes      | —       | —           |
| `Role`    | `Role string`    | yes      | —       | —           |

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 910.
