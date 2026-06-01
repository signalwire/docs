---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/security/security/validate-request-e"
title: "ValidateRequestE"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/security.ValidateRequestE"
  parent: "github.com/signalwire/signalwire-go/pkg/security"
  module: "github.com.signalwire.signalwire-go.pkg.security"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/security/webhook.go"
---
# `ValidateRequestE`

ValidateRequestE is the error-returning variant of ValidateRequest. Returns ErrMissingSigningKey when signingKey is empty, or a typed error when paramsOrRawBody is neither a string, nil, nor a recognized map shape.

## Signature

```go
func ValidateRequestE(
	signingKey string,
	signature string,
	urlStr string,
	paramsOrRawBody any
) (bool, error)
```

## Parameters

| Name              | Type     | Required | Default | Description |
| ----------------- | -------- | -------- | ------- | ----------- |
| `signingKey`      | `string` | yes      | —       | —           |
| `signature`       | `string` | yes      | —       | —           |
| `urlStr`          | `string` | yes      | —       | —           |
| `paramsOrRawBody` | `any`    | yes      | —       | —           |

## Returns

`(bool, error)`

## Source

[`pkg/security/webhook.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/security/webhook.go)

Line 299.
