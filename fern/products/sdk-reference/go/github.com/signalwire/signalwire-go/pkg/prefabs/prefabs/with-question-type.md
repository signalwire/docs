---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/with-question-type"
title: "WithQuestionType"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs.WithQuestionType"
  parent: "github.com/signalwire/signalwire-go/pkg/prefabs"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/survey.go"
---
# `WithQuestionType`

WithQuestionType sets the question type ("rating", "multiple\_choice", "yes\_no", "open\_ended").

## Signature

```go
func WithQuestionType(t string) SurveyQuestionOption
```

## Parameters

| Name | Type     | Required | Default | Description |
| ---- | -------- | -------- | ------- | ----------- |
| `t`  | `string` | yes      | —       | —           |

## Returns

`SurveyQuestionOption`

## Source

[`pkg/prefabs/survey.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/survey.go)

Line 42.
