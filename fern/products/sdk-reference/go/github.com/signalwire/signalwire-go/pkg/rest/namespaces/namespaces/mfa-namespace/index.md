---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/mfa-namespace"
title: "MFANamespace"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.MFANamespace"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/mfa.go"
---
# `MFANamespace`

MFANamespace provides multi-factor authentication via SMS or phone call.

## Signature

```go
type MFANamespace struct
```

## Properties

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `Resource` | `Resource` | yes      | —       | —           |

## Methods

- [`Call`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/mfa-namespace/call) — Call initiates MFA verification via phone call.
- [`SMS`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/mfa-namespace/sms) — SMS initiates MFA verification via SMS.
- [`Verify`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/mfa-namespace/verify) — Verify verifies an MFA token for a given request ID.

## Source

[`pkg/rest/namespaces/mfa.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/mfa.go)

Line 11.
