---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/verify-bearer-token"
title: "VerifyBearerToken"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.Service.VerifyBearerToken"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.Service"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `VerifyBearerToken`

VerifyBearerToken performs a timing-safe comparison of the supplied token against the service's configured bearer token. Returns false when no bearer token is configured (i.e. WithBearerToken was not called).

Callers typically extract the token from the "Authorization: Bearer \<token>" header before calling this method. Mirrors Python AuthHandler.verify\_bearer\_token(credentials) -> bool.

## Signature

```go
func (*Service) VerifyBearerToken(token string) bool
```

## Parameters

| Name    | Type     | Required | Default | Description |
| ------- | -------- | -------- | ------- | ----------- |
| `token` | `string` | yes      | —       | —           |

## Returns

`bool`

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 478.
