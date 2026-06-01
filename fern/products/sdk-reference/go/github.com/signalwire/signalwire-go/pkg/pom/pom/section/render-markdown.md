---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/section/render-markdown"
title: "RenderMarkdown"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/pom.Section.RenderMarkdown"
  parent: "github.com/signalwire/signalwire-go/pkg/pom.Section"
  module: "github.com.signalwire.signalwire-go.pkg.pom"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go"
---
# `RenderMarkdown`

RenderMarkdown returns this section (and its subsections) as a Markdown string. level controls the starting heading level (default 2 == "##"); sectionNumber is the optional dotted prefix the section inherits when its parent is numbered.

Python equivalent: Section.render\_markdown

## Signature

```go
func (*Section) RenderMarkdown(level int, sectionNumber []int) string
```

## Parameters

| Name            | Type    | Required | Default | Description |
| --------------- | ------- | -------- | ------- | ----------- |
| `level`         | `int`   | yes      | —       | —           |
| `sectionNumber` | `[]int` | yes      | —       | —           |

## Returns

`string`

## Source

[`pkg/pom/pom.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go)

Line 196.
