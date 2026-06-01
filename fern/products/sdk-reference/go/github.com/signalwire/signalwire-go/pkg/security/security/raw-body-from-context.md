---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/security/security/raw-body-from-context"
title: "RawBodyFromContext"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/security.RawBodyFromContext"
  parent: "github.com/signalwire/signalwire-go/pkg/security"
  module: "github.com.signalwire.signalwire-go.pkg.security"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/security/webhook_middleware.go"
---
# `RawBodyFromContext`

RawBodyFromContext returns the raw request body bytes that the webhook middleware captured before signature validation. Returns nil and false when called from a handler that wasn't wrapped by WebhookMiddleware (or when the request had no body).

## Signature

```go
func RawBodyFromContext(ctx context.Context) ([]byte, bool)
```

## Parameters

| Name  | Type              | Required | Default | Description |
| ----- | ----------------- | -------- | ------- | ----------- |
| `ctx` | `context.Context` | yes      | —       | —           |

## Returns

`([]byte, bool)`

## Source

[`pkg/security/webhook_middleware.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/security/webhook_middleware.go)

Line 42.
