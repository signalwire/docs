---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/section/add-bullets"
title: "AddBullets"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/pom.Section.AddBullets"
  parent: "github.com/signalwire/signalwire-go/pkg/pom.Section"
  module: "github.com.signalwire.signalwire-go.pkg.pom"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go"
---
# `AddBullets`

AddBullets appends bullet points to the section.

Python equivalent: Section.add\_bullets — the Python contract is to extend (not replace) the existing bullet list.

## Signature

```go
func (*Section) AddBullets(bullets []string)
```

## Parameters

| Name      | Type       | Required | Default | Description |
| --------- | ---------- | -------- | ------- | ----------- |
| `bullets` | `[]string` | yes      | —       | —           |

## Source

[`pkg/pom/pom.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go)

Line 86.
