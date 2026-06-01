---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/mfa-namespace/verify"
title: "Verify"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.MFANamespace.Verify"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.MFANamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/mfa.go"
---
# `Verify`

Verify verifies an MFA token for a given request ID.

## Signature

```go
func (*MFANamespace) Verify(requestID string, data map[string]any) (map[string]any, error)
```

## Parameters

| Name        | Type             | Required | Default | Description |
| ----------- | ---------------- | -------- | ------- | ----------- |
| `requestID` | `string`         | yes      | —       | —           |
| `data`      | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/mfa.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/mfa.go)

Line 33.
