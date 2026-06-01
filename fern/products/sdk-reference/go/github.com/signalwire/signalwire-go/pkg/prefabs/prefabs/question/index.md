---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/question"
title: "Question"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs.Question"
  parent: "github.com/signalwire/signalwire-go/pkg/prefabs"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/info_gatherer.go"
---
# `Question`

Question describes a single question in an InfoGatherer sequence.

## Signature

```go
type Question struct
```

## Properties

| Name           | Type                  | Required | Default | Description                                     |
| -------------- | --------------------- | -------- | ------- | ----------------------------------------------- |
| `Confirm`      | `Confirm bool`        | yes      | —       | if true the agent will confirm before accepting |
| `KeyName`      | `KeyName string`      | yes      | —       | identifier used to store the answer             |
| `QuestionText` | `QuestionText string` | yes      | —       | the question to ask the user                    |

## Source

[`pkg/prefabs/info_gatherer.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/info_gatherer.go)

Line 19.
