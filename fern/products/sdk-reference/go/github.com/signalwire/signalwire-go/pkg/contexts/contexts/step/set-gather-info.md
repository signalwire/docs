---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/set-gather-info"
title: "SetGatherInfo"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.Step.SetGatherInfo"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts.Step"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `SetGatherInfo`

SetGatherInfo enables info gathering for this step and returns the Step for fluent chaining. This matches the Python SDK's set\_gather\_info, which returns self so that step-level setters (SetFunctions, SetValidSteps, etc.) can be chained after configuring gather info.

To add questions to the gather info, use AddGatherQuestion on the same \*Step receiver.

## Signature

```go
func (*Step) SetGatherInfo(outputKey string, completionAction string, prompt string) *Step
```

## Parameters

| Name               | Type     | Required | Default | Description |
| ------------------ | -------- | -------- | ------- | ----------- |
| `outputKey`        | `string` | yes      | —       | —           |
| `completionAction` | `string` | yes      | —       | —           |
| `prompt`           | `string` | yes      | —       | —           |

## Returns

`*Step`

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 290.
