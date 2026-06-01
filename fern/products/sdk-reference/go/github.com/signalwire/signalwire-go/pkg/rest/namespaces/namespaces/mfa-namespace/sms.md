---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/mfa-namespace/sms"
title: "SMS"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.MFANamespace.SMS"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.MFANamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/mfa.go"
---
# `SMS`

SMS initiates MFA verification via SMS.

## Signature

```go
func (*MFANamespace) SMS(data map[string]any) (map[string]any, error)
```

## Parameters

| Name   | Type             | Required | Default | Description |
| ------ | ---------------- | -------- | ------- | ----------- |
| `data` | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/mfa.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/mfa.go)

Line 23.
