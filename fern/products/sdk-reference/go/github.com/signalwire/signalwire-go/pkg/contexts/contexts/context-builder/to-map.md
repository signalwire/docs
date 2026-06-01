---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context-builder/to-map"
title: "ToMap"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.ContextBuilder.ToMap"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts.ContextBuilder"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `ToMap`

ToMap serialises all contexts to the SWML map format. It calls Validate first and returns an error if validation fails.

## Signature

```go
func (*ContextBuilder) ToMap() (map[string]any, error)
```

## Returns

`(map[string]any, error)`

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 1057.
