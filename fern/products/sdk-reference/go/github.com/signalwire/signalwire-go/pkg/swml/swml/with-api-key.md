---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-api-key"
title: "WithAPIKey"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.WithAPIKey"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `WithAPIKey`

WithAPIKey configures API key authentication. When set, the withSecurity middleware accepts requests where the header named by header equals key. header is the HTTP header name (e.g. "X-API-Key"); pass an empty string to use the default "X-API-Key". Mirrors Python's SecurityConfig.api\_key / api\_key\_header fields and the AuthHandler verify\_api\_key / flask\_decorator behaviour.

## Signature

```go
func WithAPIKey(key string, header string) ServiceOption
```

## Parameters

| Name     | Type     | Required | Default | Description |
| -------- | -------- | -------- | ------- | ----------- |
| `key`    | `string` | yes      | —       | —           |
| `header` | `string` | yes      | —       | —           |

## Returns

`ServiceOption`

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 184.
