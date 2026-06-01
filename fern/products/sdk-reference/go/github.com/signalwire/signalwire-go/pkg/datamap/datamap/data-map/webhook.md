---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/datamap/datamap/data-map/webhook"
title: "Webhook"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/datamap.DataMap.Webhook"
  parent: "github.com/signalwire/signalwire-go/pkg/datamap.DataMap"
  module: "github.com.signalwire.signalwire-go.pkg.datamap"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go"
---
# `Webhook`

Webhook adds a webhook API call configuration. If a previous webhook was configured, it is finalized first. method is the HTTP method (GET, POST, etc.). url is the API endpoint URL (can include ${variable} substitutions). headers are optional HTTP headers (can be nil). formParam sends JSON body as a single form parameter with this name (empty string to skip). inputArgsAsParams merges function arguments into params. requireArgs lists arguments that must be present to execute (can be nil).

## Signature

```go
func (*DataMap) Webhook(
	method string,
	url string,
	headers map[string]string,
	formParam string,
	inputArgsAsParams bool,
	requireArgs []string
) *DataMap
```

## Parameters

| Name                | Type                | Required | Default | Description |
| ------------------- | ------------------- | -------- | ------- | ----------- |
| `method`            | `string`            | yes      | —       | —           |
| `url`               | `string`            | yes      | —       | —           |
| `headers`           | `map[string]string` | yes      | —       | —           |
| `formParam`         | `string`            | yes      | —       | —           |
| `inputArgsAsParams` | `bool`              | yes      | —       | —           |
| `requireArgs`       | `[]string`          | yes      | —       | —           |

## Returns

`*DataMap`

## Source

[`pkg/datamap/datamap.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go)

Line 237.
