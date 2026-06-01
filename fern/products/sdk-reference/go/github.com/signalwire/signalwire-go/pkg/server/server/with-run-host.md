---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/with-run-host"
title: "WithRunHost"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/server.WithRunHost"
  parent: "github.com/signalwire/signalwire-go/pkg/server"
  module: "github.com.signalwire.signalwire-go.pkg.server"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go"
---
# `WithRunHost`

WithRunHost overrides the listen address when calling Run.

## Signature

```go
func WithRunHost(host string) RunOption
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `host` | `string` | yes      | —       | —           |

## Returns

`RunOption`

## Source

[`pkg/server/server.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go)

Line 79.
