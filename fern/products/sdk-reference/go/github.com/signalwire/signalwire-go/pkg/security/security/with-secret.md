---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/security/security/with-secret"
title: "WithSecret"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/security.WithSecret"
  parent: "github.com/signalwire/signalwire-go/pkg/security"
  module: "github.com.signalwire.signalwire-go.pkg.security"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/security/session_manager.go"
---
# `WithSecret`

WithSecret injects a fixed secret key into the SessionManager. Use this when you need multiple processes or instances to validate each other's tokens. Pass nil to keep the default behaviour (auto-generate a random 32-byte secret).

## Signature

```go
func WithSecret(key []byte) Option
```

## Parameters

| Name  | Type     | Required | Default | Description |
| ----- | -------- | -------- | ------- | ----------- |
| `key` | `[]byte` | yes      | —       | —           |

## Returns

`Option`

## Source

[`pkg/security/session_manager.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/security/session_manager.go)

Line 36.
