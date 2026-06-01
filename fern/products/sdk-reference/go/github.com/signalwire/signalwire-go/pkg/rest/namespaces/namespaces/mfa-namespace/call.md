---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/mfa-namespace/call"
title: "Call"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.MFANamespace.Call"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.MFANamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/mfa.go"
---
# `Call`

Call initiates MFA verification via phone call.

## Signature

```go
func (*MFANamespace) Call(data map[string]any) (map[string]any, error)
```

## Parameters

| Name   | Type             | Required | Default | Description |
| ------ | ---------------- | -------- | ------- | ----------- |
| `data` | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/mfa.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/mfa.go)

Line 28.
