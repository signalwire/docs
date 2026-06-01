---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/section/add-body"
title: "AddBody"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/pom.Section.AddBody"
  parent: "github.com/signalwire/signalwire-go/pkg/pom.Section"
  module: "github.com.signalwire.signalwire-go.pkg.pom"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go"
---
# `AddBody`

AddBody sets (or replaces) the section body text.

Python equivalent: Section.add\_body — the docstring says "Add OR REPLACE the body text"; this is a setter, not an appender.

## Signature

```go
func (*Section) AddBody(body string)
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `body` | `string` | yes      | —       | —           |

## Source

[`pkg/pom/pom.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go)

Line 78.
