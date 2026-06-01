---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/add-bullets"
title: "AddBullets"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.Step.AddBullets"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts.Step"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `AddBullets`

AddBullets adds a POM section with bullet points.

## Signature

```go
func (*Step) AddBullets(title string, bullets []string) *Step
```

## Parameters

| Name      | Type       | Required | Default | Description |
| --------- | ---------- | -------- | ------- | ----------- |
| `title`   | `string`   | yes      | —       | —           |
| `bullets` | `[]string` | yes      | —       | —           |

## Returns

`*Step`

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 200.
