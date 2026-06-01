---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/pom/pom/prompt-object-model/add-pom-as-subsection"
title: "AddPomAsSubsection"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/pom.PromptObjectModel.AddPomAsSubsection"
  parent: "github.com/signalwire/signalwire-go/pkg/pom.PromptObjectModel"
  module: "github.com.signalwire.signalwire-go.pkg.pom"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go"
---
# `AddPomAsSubsection`

AddPomAsSubsection attaches every top-level section of pomToAdd underneath the section identified by target — either the title of an existing section in this POM, or a \*Section pointer.

Python equivalent: PromptObjectModel.add\_pom\_as\_subsection

## Signature

```go
func (*PromptObjectModel) AddPomAsSubsection(target any, pomToAdd *PromptObjectModel) error
```

## Parameters

| Name       | Type                 | Required | Default | Description |
| ---------- | -------------------- | -------- | ------- | ----------- |
| `target`   | `any`                | yes      | —       | —           |
| `pomToAdd` | `*PromptObjectModel` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/pom/pom.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/pom/pom.go)

Line 828.
