---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-bearer-token"
title: "WithBearerToken"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.WithBearerToken"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `WithBearerToken`

WithBearerToken configures Bearer token authentication. When set, the withSecurity middleware accepts requests carrying an "Authorization: Bearer \<token>" header that matches token in addition to (or instead of) Basic Auth. Mirrors Python's SecurityConfig.bearer\_token field and the AuthHandler verify\_bearer\_token / flask\_decorator behaviour.

## Signature

```go
func WithBearerToken(token string) ServiceOption
```

## Parameters

| Name    | Type     | Required | Default | Description |
| ------- | -------- | -------- | ------- | ----------- |
| `token` | `string` | yes      | —       | —           |

## Returns

`ServiceOption`

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 174.
