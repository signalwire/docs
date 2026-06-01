---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/gather-question"
title: "GatherQuestion"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.GatherQuestion"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `GatherQuestion`

GatherQuestion represents a single question in a gather\_info configuration.

## Signature

```go
type GatherQuestion struct
```

## Properties

| Name        | Type                 | Required | Default | Description      |
| ----------- | -------------------- | -------- | ------- | ---------------- |
| `Confirm`   | `Confirm bool`       | yes      | —       | —                |
| `Functions` | `Functions []string` | yes      | —       | optional         |
| `Key`       | `Key string`         | yes      | —       | —                |
| `Prompt`    | `Prompt string`      | yes      | —       | optional         |
| `Question`  | `Question string`    | yes      | —       | —                |
| `Type`      | `Type string`        | yes      | —       | default "string" |

## Methods

- [`ToMap`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/gather-question/to-map) — ToMap serialises the question to the SWML map format.

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 69.
