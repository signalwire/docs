---
slug: "/reference/go/github.com/signalwire/signalwire-go/cmd/swaig-test/main/simulate-lambda-options"
title: "SimulateLambdaOptions"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/cmd/swaig-test.SimulateLambdaOptions"
  parent: "github.com/signalwire/signalwire-go/cmd/swaig-test"
  module: "github.com.signalwire.signalwire-go.cmd.swaig-test"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/cmd/swaig-test/simulate.go"
---
# `SimulateLambdaOptions`

SimulateLambdaOptions tunes an in-process Lambda simulation.

## Signature

```go
type SimulateLambdaOptions struct
```

## Properties

| Name                  | Type                                      | Required | Default | Description                                                                                                                                                                                                                                                                             |
| --------------------- | ----------------------------------------- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `FunctionName`        | `FunctionName string`                     | yes      | —       | FunctionName overrides AWS\_LAMBDA\_FUNCTION\_NAME. Empty means use the preset default ("test-agent-function").                                                                                                                                                                         |
| `FunctionURLOverride` | `FunctionURLOverride string`              | yes      | —       | FunctionURLOverride, if non-empty, is assigned to AWS\_LAMBDA\_FUNCTION\_URL during the simulation. The default (empty) lets GetFullURL fall back to constructing the URL from AWS\_LAMBDA\_FUNCTION\_NAME + AWS\_REGION, which is the more interesting code path to exercise in tests. |
| `Logger`              | `Logger func(format string, args ...any)` | yes      | —       | Logger receives warnings about env state — notably if SWML\_PROXY\_URL\_BASE is still set after the clear attempt. A nil Logger sends warnings to os.Stderr.                                                                                                                            |
| `Region`              | `Region string`                           | yes      | —       | Region overrides AWS\_REGION. Empty means use the preset default ("us-east-1").                                                                                                                                                                                                         |

## Source

[`cmd/swaig-test/simulate.go`](https://github.com/signalwire/signalwire-go/blob/main/cmd/swaig-test/simulate.go)

Line 195.
