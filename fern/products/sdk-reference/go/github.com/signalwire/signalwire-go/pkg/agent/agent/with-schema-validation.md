---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-schema-validation"
title: "WithSchemaValidation"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.WithSchemaValidation"
  parent: "github.com/signalwire/signalwire-go/pkg/agent"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `WithSchemaValidation`

WithSchemaValidation controls whether the rendered SWML document is validated against the SWML schema before serving. Defaults to true. Can also be disabled via the SWML\_SKIP\_SCHEMA\_VALIDATION=1 environment variable.

Python equivalent: schema\_validation parameter in AgentBase.**init**

## Signature

```go
func WithSchemaValidation(validate bool) AgentOption
```

## Parameters

| Name       | Type   | Required | Default | Description |
| ---------- | ------ | -------- | ------- | ----------- |
| `validate` | `bool` | yes      | —       | —           |

## Returns

`AgentOption`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 281.
