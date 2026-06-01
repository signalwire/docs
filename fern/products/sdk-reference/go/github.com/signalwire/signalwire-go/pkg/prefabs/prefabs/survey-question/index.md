---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/survey-question"
title: "SurveyQuestion"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs.SurveyQuestion"
  parent: "github.com/signalwire/signalwire-go/pkg/prefabs"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/survey.go"
---
# `SurveyQuestion`

SurveyQuestion describes a single question in a survey.

Prefer NewSurveyQuestion for construction — it defaults Required:true to match Python SurveyAgent behavior (signalwire/prefabs/survey.py \_validate\_questions sets required=True when unspecified). Struct literals are still supported, but the Go zero value for Required is false, which diverges from Python.

## Signature

```go
type SurveyQuestion struct
```

## Properties

| Name       | Type               | Required | Default | Description                                                  |
| ---------- | ------------------ | -------- | ------- | ------------------------------------------------------------ |
| `Choices`  | `Choices []string` | yes      | —       | options for multiple\_choice questions                       |
| `ID`       | `ID string`        | yes      | —       | unique question identifier                                   |
| `Required` | `Required bool`    | yes      | —       | whether a non-empty answer is required — Python default true |
| `Scale`    | `Scale int`        | yes      | —       | 1..Scale for rating questions (default 5)                    |
| `Text`     | `Text string`      | yes      | —       | the question to ask                                          |
| `Type`     | `Type string`      | yes      | —       | "rating", "multiple\_choice", "yes\_no", "open\_ended"       |

## Source

[`pkg/prefabs/survey.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/survey.go)

Line 23.
