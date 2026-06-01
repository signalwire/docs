---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/http-client/post"
title: "Post"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest.HttpClient.Post"
  parent: "github.com/signalwire/signalwire-go/pkg/rest.HttpClient"
  module: "github.com.signalwire.signalwire-go.pkg.rest"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go"
---
# `Post`

Post performs an HTTP POST request with a JSON body. Optional params are appended to the URL as query-string parameters.

## Signature

```go
func (*HttpClient) Post(path string, body map[string]any, params map[string]string) (map[string]any, error)
```

## Parameters

| Name     | Type                | Required | Default | Description |
| -------- | ------------------- | -------- | ------- | ----------- |
| `path`   | `string`            | yes      | —       | —           |
| `body`   | `map[string]any`    | yes      | —       | —           |
| `params` | `map[string]string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go)

Line 110.
