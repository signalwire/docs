---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/new-section"
title: "NewSection"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/pom.NewSection"
  parent: "github.com/signalwire/signalwire-go/pkg/pom"
  module: "github.com.signalwire.signalwire-go.pkg.pom"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go"
---
# `NewSection`

NewSection returns a new Section with the supplied title (which may be empty to indicate untitled). Body, bullets, and subsections start empty; populate them via AddBody / AddBullets / AddSubsection.

Python equivalent: Section.**init**

## Signature

```go
func NewSection(title string) *Section
```

## Parameters

| Name    | Type     | Required | Default | Description |
| ------- | -------- | -------- | ------- | ----------- |
| `title` | `string` | yes      | —       | —           |

## Returns

`*Section`

## Source

[`pkg/pom/pom.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go)

Line 69.
