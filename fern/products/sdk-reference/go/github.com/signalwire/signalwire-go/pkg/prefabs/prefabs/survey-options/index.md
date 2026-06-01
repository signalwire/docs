---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/survey-options"
title: "SurveyOptions"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs.SurveyOptions"
  parent: "github.com/signalwire/signalwire-go/pkg/prefabs"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/survey.go"
---
# `SurveyOptions`

SurveyOptions configures a new SurveyAgent.

## Signature

```go
type SurveyOptions struct
```

## Properties

| Name         | Type                         | Required | Default | Description |
| ------------ | ---------------------------- | -------- | ------- | ----------- |
| `BrandName`  | `BrandName string`           | yes      | —       | —           |
| `Conclusion` | `Conclusion string`          | yes      | —       | —           |
| `Intro`      | `Intro string`               | yes      | —       | —           |
| `MaxRetries` | `MaxRetries int`             | yes      | —       | —           |
| `Name`       | `Name string`                | yes      | —       | —           |
| `Questions`  | `Questions []SurveyQuestion` | yes      | —       | —           |
| `Route`      | `Route string`               | yes      | —       | —           |
| `SurveyName` | `SurveyName string`          | yes      | —       | —           |

## Source

[`pkg/prefabs/survey.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/survey.go)

Line 77.
