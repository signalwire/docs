---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/datamap/datamap/data-map/fallback-output"
title: "FallbackOutput"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/datamap.DataMap.FallbackOutput"
  parent: "github.com/signalwire/signalwire-go/pkg/datamap.DataMap"
  module: "github.com.signalwire.signalwire-go.pkg.datamap"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go"
---
# `FallbackOutput`

FallbackOutput sets the fallback output result used when all webhooks fail.

## Signature

```go
func (*DataMap) FallbackOutput(result *swaig.FunctionResult) *DataMap
```

## Parameters

| Name     | Type                    | Required | Default | Description |
| -------- | ----------------------- | -------- | ------- | ----------- |
| `result` | `*swaig.FunctionResult` | yes      | —       | —           |

## Returns

`*DataMap`

## Source

[`pkg/datamap/datamap.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go)

Line 283.
