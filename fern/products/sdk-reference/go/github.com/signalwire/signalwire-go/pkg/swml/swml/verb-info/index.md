---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/verb-info"
title: "VerbInfo"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.VerbInfo"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema.go"
---
# `VerbInfo`

VerbInfo holds metadata about a SWML verb extracted from the schema.

## Signature

```go
type VerbInfo struct
```

## Properties

| Name         | Type                        | Required | Default | Description                                                                                   |
| ------------ | --------------------------- | -------- | ------- | --------------------------------------------------------------------------------------------- |
| `Definition` | `Definition map[string]any` | yes      | —       | Definition is the raw schema definition for this verb                                         |
| `Name`       | `Name string`               | yes      | —       | Name is the actual SWML verb name (e.g., "sip\_refer", "ai", "play")                          |
| `SchemaName` | `SchemaName string`         | yes      | —       | SchemaName is the PascalCase name from the schema definition (e.g., "SIPRefer", "AI", "Play") |

## Source

[`pkg/swml/schema.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema.go)

Line 19.
