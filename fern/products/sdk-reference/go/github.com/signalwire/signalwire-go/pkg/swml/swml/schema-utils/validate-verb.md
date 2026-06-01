---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils/validate-verb"
title: "ValidateVerb"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.SchemaUtils.ValidateVerb"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.SchemaUtils"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema_utils.go"
---
# `ValidateVerb`

ValidateVerb validates a verb config against the schema. Mirrors Python's “validate\_verb(verb\_name, verb\_config)“.

When validation is disabled returns Valid=true. When the verb name is unknown returns Valid=false with a single "Unknown verb" error. Otherwise runs the full validator if available, falling back to the lightweight required-property check.

## Signature

```go
func (*SchemaUtils) ValidateVerb(verbName string, verbConfig map[string]any) ValidationResult
```

## Parameters

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `verbName`   | `string`         | yes      | —       | —           |
| `verbConfig` | `map[string]any` | yes      | —       | —           |

## Returns

`ValidationResult`

## Source

[`pkg/swml/schema_utils.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/schema_utils.go)

Line 269.
