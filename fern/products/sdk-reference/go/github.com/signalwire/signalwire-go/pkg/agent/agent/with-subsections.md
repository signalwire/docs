---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-subsections"
title: "WithSubsections"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.WithSubsections"
  parent: "github.com/signalwire/signalwire-go/pkg/agent"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `WithSubsections`

WithSubsections attaches child sections to the parent section. Python equivalent: subsections=\[...] in prompt\_add\_section

## Signature

```go
func WithSubsections(subs []map[string]any) PromptSectionOption
```

## Parameters

| Name   | Type               | Required | Default | Description |
| ------ | ------------------ | -------- | ------- | ----------- |
| `subs` | `[]map[string]any` | yes      | —       | —           |

## Returns

`PromptSectionOption`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 665.
