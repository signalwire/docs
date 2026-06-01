---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/security/security/validate-webhook-signature"
title: "ValidateWebhookSignature"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/security.ValidateWebhookSignature"
  parent: "github.com/signalwire/signalwire-go/pkg/security"
  module: "github.com.signalwire.signalwire-go.pkg.security"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/security/webhook.go"
---
# `ValidateWebhookSignature`

ValidateWebhookSignature validates a SignalWire webhook signature against both schemes. Returns true if the signature matches Scheme A (hex JSON) or Scheme B (base64 form, with port-normalization variants and optional bodySHA256 fallback); false otherwise.

signingKey: customer's Signing Key. Empty string panics — that's a programming error, not a validation failure (use ValidateWebhookSignatureE for the error-returning variant).

signature: X-SignalWire-Signature (or X-Twilio-Signature) header value. Empty returns false without panicking.

url: full URL SignalWire POSTed to (scheme, host, optional port, path, query). Must match what the platform saw — see the URL reconstruction section of porting-sdk/webhooks.md.

rawBody: raw request body bytes as a UTF-8 string, BEFORE any JSON / form parsing.

All comparisons use crypto/subtle.ConstantTimeCompare. The function does not log which scheme was tried, what the expected signature was, or any other branch information.

## Signature

```go
func ValidateWebhookSignature(
	signingKey string,
	signature string,
	url string,
	rawBody string
) bool
```

## Parameters

| Name         | Type     | Required | Default | Description |
| ------------ | -------- | -------- | ------- | ----------- |
| `signingKey` | `string` | yes      | —       | —           |
| `signature`  | `string` | yes      | —       | —           |
| `url`        | `string` | yes      | —       | —           |
| `rawBody`    | `string` | yes      | —       | —           |

## Returns

`bool`

## Source

[`pkg/security/webhook.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/security/webhook.go)

Line 226.
