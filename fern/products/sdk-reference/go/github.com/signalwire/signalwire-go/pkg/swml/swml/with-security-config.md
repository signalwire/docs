---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-security-config"
title: "WithSecurityConfig"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.WithSecurityConfig"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `WithSecurityConfig`

WithSecurityConfig applies a SecurityConfig bundle, setting Basic Auth, Bearer token, and API key configuration in one call. This is the Go equivalent of Python's AuthHandler(security\_config=...) pattern: it maps each SecurityConfig field to the corresponding WithXxx option.

## Signature

```go
func WithSecurityConfig(cfg SecurityConfig) ServiceOption
```

## Parameters

| Name  | Type             | Required | Default | Description |
| ----- | ---------------- | -------- | ------- | ----------- |
| `cfg` | `SecurityConfig` | yes      | —       | —           |

## Returns

`ServiceOption`

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 198.
