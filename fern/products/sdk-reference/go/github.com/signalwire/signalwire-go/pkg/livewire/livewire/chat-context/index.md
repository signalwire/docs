---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/chat-context"
title: "ChatContext"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.ChatContext"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `ChatContext`

ChatContext buffers a conversation as an ordered list of role/content messages. It mirrors the Python livewire.ChatContext stub which is API-compatible with the livekit-agents ChatContext shape.

## Signature

```go
type ChatContext struct
```

## Properties

| Name       | Type                     | Required | Default | Description |
| ---------- | ------------------------ | -------- | ------- | ----------- |
| `Messages` | `Messages []ChatMessage` | yes      | —       | —           |

## Methods

- [`Append`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/chat-context/append) — Append adds a role/content message to the context and returns the receiver for method chaining. If role is empty it defaults to "user"; if content is empty it defaults to "" (empty string), matching the Python defaults role="user", text="".

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 918.
