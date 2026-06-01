---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/gather-info/add-question"
title: "AddQuestion"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.GatherInfo.AddQuestion"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts.GatherInfo"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `AddQuestion`

AddQuestion appends a question and returns the GatherInfo for chaining.

## Signature

```go
func (*GatherInfo) AddQuestion(key string, question string, opts ...GatherQuestionOption) *GatherInfo
```

## Parameters

| Name       | Type                   | Required | Default | Description |
| ---------- | ---------------------- | -------- | ------- | ----------- |
| `key`      | `string`               | yes      | —       | —           |
| `question` | `string`               | yes      | —       | —           |
| `...opts`  | `GatherQuestionOption` | no       | —       | —           |

## Returns

`*GatherInfo`

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 112.
