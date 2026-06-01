---
slug: "/reference/go/github.com/signalwire/signalwire-go/cmd/swaig-test/main/simulate-lambda-invocation"
title: "SimulateLambdaInvocation"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/cmd/swaig-test.SimulateLambdaInvocation"
  parent: "github.com/signalwire/signalwire-go/cmd/swaig-test"
  module: "github.com.signalwire.signalwire-go.cmd.swaig-test"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/cmd/swaig-test/simulate.go"
---
# `SimulateLambdaInvocation`

SimulateLambdaInvocation runs a single synthetic Lambda Function URL event against the given handler with the Lambda environment active. It does NOT touch env vars itself — call activateLambdaEnv first and defer restore() so the env change has the right scope.

The split exists so one activation can host multiple invocations (dump-SWML then exec-tool, say) without paying the env save/restore cost per call.

## Signature

```go
func SimulateLambdaInvocation(
	handler http.Handler,
	method string,
	path string,
	headers map[string]string,
	body io.Reader
) (LambdaSimResult, error)
```

## Parameters

| Name      | Type                | Required | Default | Description |
| --------- | ------------------- | -------- | ------- | ----------- |
| `handler` | `http.Handler`      | yes      | —       | —           |
| `method`  | `string`            | yes      | —       | —           |
| `path`    | `string`            | yes      | —       | —           |
| `headers` | `map[string]string` | yes      | —       | —           |
| `body`    | `io.Reader`         | yes      | —       | —           |

## Returns

`(LambdaSimResult, error)`

## Source

[`cmd/swaig-test/simulate.go`](https://github.com/signalwire/signalwire-go/blob/main/cmd/swaig-test/simulate.go)

Line 287.
