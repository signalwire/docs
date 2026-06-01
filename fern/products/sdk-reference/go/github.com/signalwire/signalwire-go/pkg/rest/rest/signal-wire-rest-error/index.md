---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/signal-wire-rest-error"
title: "SignalWireRestError"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest.SignalWireRestError"
  parent: "github.com/signalwire/signalwire-go/pkg/rest"
  module: "github.com.signalwire.signalwire-go.pkg.rest"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go"
---
# `SignalWireRestError`

SignalWireRestError is returned when the SignalWire REST API responds with a non-2xx status code.

## Signature

```go
type SignalWireRestError struct
```

## Properties

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `Body`       | `Body string`    | yes      | —       | —           |
| `Method`     | `Method string`  | yes      | —       | —           |
| `StatusCode` | `StatusCode int` | yes      | —       | —           |
| `URL`        | `URL string`     | yes      | —       | —           |

## Methods

- [`Error`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/signal-wire-rest-error/error) — Error implements the error interface.

## Source

[`pkg/rest/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go)

Line 35.
