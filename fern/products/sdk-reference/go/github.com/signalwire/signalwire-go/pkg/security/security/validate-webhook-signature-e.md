---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/security/security/validate-webhook-signature-e"
title: "ValidateWebhookSignatureE"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/security.ValidateWebhookSignatureE"
  parent: "github.com/signalwire/signalwire-go/pkg/security"
  module: "github.com.signalwire.signalwire-go.pkg.security"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/security/webhook.go"
---
# `ValidateWebhookSignatureE`

ValidateWebhookSignatureE is the error-returning variant of ValidateWebhookSignature. Returns ErrMissingSigningKey when signingKey is empty; otherwise (matched, nil).

## Signature

```go
func ValidateWebhookSignatureE(
	signingKey string,
	signature string,
	urlStr string,
	rawBody string
) (bool, error)
```

## Parameters

| Name         | Type     | Required | Default | Description |
| ------------ | -------- | -------- | ------- | ----------- |
| `signingKey` | `string` | yes      | —       | —           |
| `signature`  | `string` | yes      | —       | —           |
| `urlStr`     | `string` | yes      | —       | —           |
| `rawBody`    | `string` | yes      | —       | —           |

## Returns

`(bool, error)`

## Source

[`pkg/security/webhook.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/security/webhook.go)

Line 258.
