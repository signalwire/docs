---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/get-verb-handler"
title: "GetVerbHandler"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.Service.GetVerbHandler"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.Service"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/verb_handler.go"
---
# `GetVerbHandler`

GetVerbHandler returns the registered handler for verbName, or nil if no handler has been registered for that verb. This is the Go equivalent of Python's VerbHandlerRegistry.get\_handler.

## Signature

```go
func (*Service) GetVerbHandler(verbName string) VerbHandler
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `verbName` | `string` | yes      | —       | —           |

## Returns

`VerbHandler`

## Source

[`pkg/swml/verb_handler.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/verb_handler.go)

Line 57.
