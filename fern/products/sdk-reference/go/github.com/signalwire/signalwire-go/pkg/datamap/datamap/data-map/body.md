---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/datamap/datamap/data-map/body"
title: "Body"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/datamap.DataMap.Body"
  parent: "github.com/signalwire/signalwire-go/pkg/datamap.DataMap"
  module: "github.com.signalwire.signalwire-go.pkg.datamap"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go"
---
# `Body`

Body sets the request body for the current webhook (for POST/PUT requests).

## Signature

```go
func (*DataMap) Body(data map[string]any) *DataMap
```

## Parameters

| Name   | Type             | Required | Default | Description |
| ------ | ---------------- | -------- | ------- | ----------- |
| `data` | `map[string]any` | yes      | —       | —           |

## Returns

`*DataMap`

## Source

[`pkg/datamap/datamap.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go)

Line 259.
