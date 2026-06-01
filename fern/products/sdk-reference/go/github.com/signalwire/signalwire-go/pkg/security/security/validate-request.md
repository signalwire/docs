---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/security/security/validate-request"
title: "ValidateRequest"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/security.ValidateRequest"
  parent: "github.com/signalwire/signalwire-go/pkg/security"
  module: "github.com.signalwire.signalwire-go.pkg.security"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/security/webhook.go"
---
# `ValidateRequest`

ValidateRequest is the legacy @signalwire/compatibility-api drop-in entry point. The fourth argument is dynamically dispatched:

- string: delegate to ValidateWebhookSignature (Scheme A then Scheme B with parsed form);
- map\[string]\[]string / url.Values / map\[string]string: pre-parsed form params, run Scheme B directly with URL port normalization;
- nil: pre-parsed empty params, run Scheme B with empty concat string;
- anything else: panic with a clear message (programmer error).

## Signature

```go
func ValidateRequest(
	signingKey string,
	signature string,
	urlStr string,
	paramsOrRawBody any
) bool
```

## Parameters

| Name              | Type     | Required | Default | Description |
| ----------------- | -------- | -------- | ------- | ----------- |
| `signingKey`      | `string` | yes      | —       | —           |
| `signature`       | `string` | yes      | —       | —           |
| `urlStr`          | `string` | yes      | —       | —           |
| `paramsOrRawBody` | `any`    | yes      | —       | —           |

## Returns

`bool`

## Source

[`pkg/security/webhook.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/security/webhook.go)

Line 243.
