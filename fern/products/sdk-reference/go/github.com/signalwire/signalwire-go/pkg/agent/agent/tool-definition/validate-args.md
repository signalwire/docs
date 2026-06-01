---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/tool-definition/validate-args"
title: "ValidateArgs"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.ToolDefinition.ValidateArgs"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.ToolDefinition"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `ValidateArgs`

ValidateArgs validates the provided args map against the tool's parameter schema.

It constructs a JSON Schema envelope from Parameters and Required (matching the shape emitted by buildSwaigFunctions) and validates args against that schema using encoding/json round-trip comparison. When Parameters is nil or empty the function returns (true, nil) immediately, mirroring the Python SDK's behaviour of skipping validation when no schema is declared.

Go's standard library does not include a JSON Schema validator, so this implementation performs a best-effort structural check:

- Every key listed in Required must be present in args.
- No third-party dependency is introduced; the check is intentionally lightweight.

A full JSON Schema validator (e.g. github.com/xeipuuv/gojsonschema) can be swapped in by replacing the body of this method.

## Signature

```go
func (*ToolDefinition) ValidateArgs(args map[string]any) (bool, []string)
```

## Parameters

| Name   | Type             | Required | Default | Description |
| ------ | ---------------- | -------- | ------- | ----------- |
| `args` | `map[string]any` | yes      | —       | —           |

## Returns

`(bool, []string)`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 98.
