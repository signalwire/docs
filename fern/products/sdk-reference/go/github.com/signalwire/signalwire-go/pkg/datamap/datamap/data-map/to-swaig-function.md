---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/datamap/datamap/data-map/to-swaig-function"
title: "ToSwaigFunction"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/datamap.DataMap.ToSwaigFunction"
  parent: "github.com/signalwire/signalwire-go/pkg/datamap.DataMap"
  module: "github.com.signalwire.signalwire-go.pkg.datamap"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go"
---
# `ToSwaigFunction`

ToSwaigFunction converts the DataMap to a complete SWAIG function definition map. The returned map contains "function", "description", "parameters", and "data\_map" keys, matching the canonical SWML/SWAIG schema consumed by the SignalWire AI platform.

## Signature

```go
func (*DataMap) ToSwaigFunction() map[string]any
```

## Returns

`map[string]any`

## Source

[`pkg/datamap/datamap.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go)

Line 303.
