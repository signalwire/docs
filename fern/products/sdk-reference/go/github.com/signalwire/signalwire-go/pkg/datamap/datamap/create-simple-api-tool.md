---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/datamap/datamap/create-simple-api-tool"
title: "CreateSimpleApiTool"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/datamap.CreateSimpleApiTool"
  parent: "github.com/signalwire/signalwire-go/pkg/datamap"
  module: "github.com.signalwire.signalwire-go.pkg.datamap"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go"
---
# `CreateSimpleApiTool`

CreateSimpleApiTool creates a DataMap configured for a simple API call. name is the function name. url is the API endpoint URL. responseTemplate is the template for formatting the response. parameters maps parameter names to their definitions (each with "type", "description", "required" keys). method is the HTTP method (e.g., "GET", "POST"). headers are optional HTTP headers (can be nil). body is an optional request body for POST/PUT (can be nil). errorKeys are optional error indicator keys (can be nil).

## Signature

```go
func CreateSimpleApiTool(
	name string,
	url string,
	responseTemplate string,
	parameters map[string]map[string]any,
	method string,
	headers map[string]string,
	body map[string]any,
	errorKeys []string
) *DataMap
```

## Parameters

| Name               | Type                        | Required | Default | Description |
| ------------------ | --------------------------- | -------- | ------- | ----------- |
| `name`             | `string`                    | yes      | —       | —           |
| `url`              | `string`                    | yes      | —       | —           |
| `responseTemplate` | `string`                    | yes      | —       | —           |
| `parameters`       | `map[string]map[string]any` | yes      | —       | —           |
| `method`           | `string`                    | yes      | —       | —           |
| `headers`          | `map[string]string`         | yes      | —       | —           |
| `body`             | `map[string]any`            | yes      | —       | —           |
| `errorKeys`        | `[]string`                  | yes      | —       | —           |

## Returns

`*DataMap`

## Source

[`pkg/datamap/datamap.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/datamap/datamap.go)

Line 391.
