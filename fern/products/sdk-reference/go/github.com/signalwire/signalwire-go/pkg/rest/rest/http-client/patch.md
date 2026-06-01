---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/http-client/patch"
title: "Patch"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest.HttpClient.Patch"
  parent: "github.com/signalwire/signalwire-go/pkg/rest.HttpClient"
  module: "github.com.signalwire.signalwire-go.pkg.rest"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go"
---
# `Patch`

Patch performs an HTTP PATCH request with a JSON body.

## Signature

```go
func (*HttpClient) Patch(path string, body map[string]any) (map[string]any, error)
```

## Parameters

| Name   | Type             | Required | Default | Description |
| ------ | ---------------- | -------- | ------- | ----------- |
| `path` | `string`         | yes      | —       | —           |
| `body` | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go)

Line 120.
