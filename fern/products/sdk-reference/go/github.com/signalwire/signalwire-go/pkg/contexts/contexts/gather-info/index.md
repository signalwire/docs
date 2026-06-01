---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/gather-info"
title: "GatherInfo"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.GatherInfo"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `GatherInfo`

GatherInfo configures information gathering for a step.

## Signature

```go
type GatherInfo struct
```

## Properties

| Name               | Type                         | Required | Default | Description |
| ------------------ | ---------------------------- | -------- | ------- | ----------- |
| `CompletionAction` | `CompletionAction string`    | yes      | —       | —           |
| `OutputKey`        | `OutputKey string`           | yes      | —       | —           |
| `Prompt`           | `Prompt string`              | yes      | —       | —           |
| `Questions`        | `Questions []GatherQuestion` | yes      | —       | —           |

## Methods

- [`AddQuestion`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/gather-info/add-question) — AddQuestion appends a question and returns the GatherInfo for chaining.
- [`ToMap`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/gather-info/to-map) — ToMap serialises to the SWML map format. Callers that construct GatherInfo directly should call Validate() first to ensure the result is valid SWML. Step.ToMap() enforces this automatically by only calling ToMap() when len(Questions) > 0.
- [`Validate`](/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/gather-info/validate) — Validate returns an error if the GatherInfo is not ready for serialisation. Specifically, it rejects a GatherInfo with no questions, which would produce invalid SWML. This matches the Python SDK's ValueError raised by to\_dict() when \_questions is empty.

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 104.
