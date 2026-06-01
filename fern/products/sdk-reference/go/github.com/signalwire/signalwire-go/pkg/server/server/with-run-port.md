---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/with-run-port"
title: "WithRunPort"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/server.WithRunPort"
  parent: "github.com/signalwire/signalwire-go/pkg/server"
  module: "github.com.signalwire.signalwire-go.pkg.server"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go"
---
# `WithRunPort`

WithRunPort overrides the listen port when calling Run.

## Signature

```go
func WithRunPort(port int) RunOption
```

## Parameters

| Name   | Type  | Required | Default | Description |
| ------ | ----- | -------- | ------- | ----------- |
| `port` | `int` | yes      | —       | —           |

## Returns

`RunOption`

## Source

[`pkg/server/server.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go)

Line 84.
