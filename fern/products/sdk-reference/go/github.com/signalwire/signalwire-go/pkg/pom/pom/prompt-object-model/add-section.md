---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/prompt-object-model/add-section"
title: "AddSection"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/pom.PromptObjectModel.AddSection"
  parent: "github.com/signalwire/signalwire-go/pkg/pom.PromptObjectModel"
  module: "github.com.signalwire.signalwire-go.pkg.pom"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go"
---
# `AddSection`

AddSection appends a top-level section. title may be empty only for the first section (Python contract: "Only the first section can have no title"). The returned \*Section can be configured further (for example, by calling AddSubsection on it).

Python equivalent: PromptObjectModel.add\_section

## Signature

```go
func (*PromptObjectModel) AddSection(title string, opts ...SectionOption) (*Section, error)
```

## Parameters

| Name      | Type            | Required | Default | Description |
| --------- | --------------- | -------- | ------- | ----------- |
| `title`   | `string`        | yes      | —       | —           |
| `...opts` | `SectionOption` | no       | —       | —           |

## Returns

`(*Section, error)`

## Source

[`pkg/pom/pom.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go)

Line 351.
