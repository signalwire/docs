---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/new-signal-wire-rest-error"
title: "NewSignalWireRestError"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest.NewSignalWireRestError"
  parent: "github.com/signalwire/signalwire-go/pkg/rest"
  module: "github.com.signalwire.signalwire-go.pkg.rest"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go"
---
# `NewSignalWireRestError`

NewSignalWireRestError constructs a SignalWireRestError, substituting "GET" as the method when method is empty — matches Python's default.

## Signature

```go
func NewSignalWireRestError(statusCode int, body string, url string, method string) *SignalWireRestError
```

## Parameters

| Name         | Type     | Required | Default | Description |
| ------------ | -------- | -------- | ------- | ----------- |
| `statusCode` | `int`    | yes      | —       | —           |
| `body`       | `string` | yes      | —       | —           |
| `url`        | `string` | yes      | —       | —           |
| `method`     | `string` | yes      | —       | —           |

## Returns

`*SignalWireRestError`

## Source

[`pkg/rest/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go)

Line 49.
