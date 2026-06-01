---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/from-json"
title: "FromJSON"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/pom.FromJSON"
  parent: "github.com/signalwire/signalwire-go/pkg/pom"
  module: "github.com.signalwire.signalwire-go.pkg.pom"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go"
---
# `FromJSON`

FromJSON parses a JSON string (an array of section maps) and returns a populated \*PromptObjectModel. Subsections are validated to require a title; any section without body/bullets/subsections is rejected.

Python equivalent: PromptObjectModel.from\_json

## Signature

```go
func FromJSON(jsonStr string) (*PromptObjectModel, error)
```

## Parameters

| Name      | Type     | Required | Default | Description |
| --------- | -------- | -------- | ------- | ----------- |
| `jsonStr` | `string` | yes      | —       | —           |

## Returns

`(*PromptObjectModel, error)`

## Source

[`pkg/pom/pom.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go)

Line 577.
