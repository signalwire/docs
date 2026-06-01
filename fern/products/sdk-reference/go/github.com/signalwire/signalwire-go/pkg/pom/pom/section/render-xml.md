---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/section/render-xml"
title: "RenderXML"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/pom.Section.RenderXML"
  parent: "github.com/signalwire/signalwire-go/pkg/pom.Section"
  module: "github.com.signalwire.signalwire-go.pkg.pom"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go"
---
# `RenderXML`

RenderXML returns this section (and its subsections) as a chunk of XML. indent is the starting indent level (each level == 2 spaces).

Python equivalent: Section.render\_xml

## Signature

```go
func (*Section) RenderXML(indent int, sectionNumber []int) string
```

## Parameters

| Name            | Type    | Required | Default | Description |
| --------------- | ------- | -------- | ------- | ----------- |
| `indent`        | `int`   | yes      | —       | —           |
| `sectionNumber` | `[]int` | yes      | —       | —           |

## Returns

`string`

## Source

[`pkg/pom/pom.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go)

Line 261.
