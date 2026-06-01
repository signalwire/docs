---
slug: "/reference/go/github.com/signalwire/signalwire-go/cmd/swaig-test/main/simulate-exec-tool-via-lambda"
title: "SimulateExecToolViaLambda"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/cmd/swaig-test.SimulateExecToolViaLambda"
  parent: "github.com/signalwire/signalwire-go/cmd/swaig-test"
  module: "github.com.signalwire.signalwire-go.cmd.swaig-test"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/cmd/swaig-test/simulate.go"
---
# `SimulateExecToolViaLambda`

SimulateExecToolViaLambda activates the Lambda environment, calls the factory to construct the agent (so any env-captured state reflects the simulated Lambda environment), and dispatches a SWAIG tool invocation through the Lambda adapter at `<agentRoute>/swaig`. Returns the raw response body.

## Signature

```go
func SimulateExecToolViaLambda(
	factory HandlerFactory,
	agentRoute string,
	toolName string,
	args map[string]any,
	opts SimulateLambdaOptions,
	basicAuth BasicAuth
) ([]byte, error)
```

## Parameters

| Name         | Type                    | Required | Default | Description |
| ------------ | ----------------------- | -------- | ------- | ----------- |
| `factory`    | `HandlerFactory`        | yes      | —       | —           |
| `agentRoute` | `string`                | yes      | —       | —           |
| `toolName`   | `string`                | yes      | —       | —           |
| `args`       | `map[string]any`        | yes      | —       | —           |
| `opts`       | `SimulateLambdaOptions` | yes      | —       | —           |
| `basicAuth`  | `BasicAuth`             | yes      | —       | —           |

## Returns

`([]byte, error)`

## Source

[`cmd/swaig-test/simulate.go`](https://github.com/signalwire/signalwire-go/blob/main/cmd/swaig-test/simulate.go)

Line 445.
