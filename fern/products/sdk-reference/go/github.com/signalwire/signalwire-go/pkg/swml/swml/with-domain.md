---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-domain"
title: "WithDomain"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.WithDomain"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `WithDomain`

WithDomain sets the domain name used in URL generation when TLS is enabled. Mirrors Python's SecurityConfig.domain / SWML\_DOMAIN env var.

## Signature

```go
func WithDomain(domain string) ServiceOption
```

## Parameters

| Name     | Type     | Required | Default | Description |
| -------- | -------- | -------- | ------- | ----------- |
| `domain` | `string` | yes      | —       | —           |

## Returns

`ServiceOption`

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 232.
