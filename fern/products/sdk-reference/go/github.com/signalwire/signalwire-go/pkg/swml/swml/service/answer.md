---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/answer"
title: "Answer"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.Service.Answer"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.Service"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `Answer`

Answer adds the answer verb to the document. maxDuration sets the maximum call duration in seconds (optional). codecs sets a comma-separated list of allowed codecs (optional). Mirrors Python SWMLBuilder.answer(max\_duration, codecs).

## Signature

```go
func (*Service) Answer(maxDuration *int, codecs *string) error
```

## Parameters

| Name          | Type      | Required | Default | Description |
| ------------- | --------- | -------- | ------- | ----------- |
| `maxDuration` | `*int`    | yes      | —       | —           |
| `codecs`      | `*string` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 637.
