---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/tool-error"
title: "ToolError"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.ToolError"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `ToolError`

ToolError signals a tool execution error. Return a \*ToolError from a tool handler to tell the framework the tool failed; the error message is forwarded to the LLM as a tool-failure notification rather than triggering a normal LLM reply. Parallel to StopResponse in this file.

## Signature

```go
type ToolError struct
```

## Properties

| Name      | Type             | Required | Default | Description |
| --------- | ---------------- | -------- | ------- | ----------- |
| `Message` | `Message string` | yes      | —       | —           |

## Methods

- [`Error`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/tool-error/error) — Error implements the built-in error interface.

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 893.
