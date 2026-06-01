---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/add-bullets"
title: "AddBullets"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.Context.AddBullets"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts.Context"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `AddBullets`

AddBullets adds a POM section with bullet points to the context prompt.

## Signature

```go
func (*Context) AddBullets(title string, bullets []string) *Context
```

## Parameters

| Name      | Type       | Required | Default | Description |
| --------- | ---------- | -------- | ------- | ----------- |
| `title`   | `string`   | yes      | —       | —           |
| `bullets` | `[]string` | yes      | —       | —           |

## Returns

`*Context`

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 622.
