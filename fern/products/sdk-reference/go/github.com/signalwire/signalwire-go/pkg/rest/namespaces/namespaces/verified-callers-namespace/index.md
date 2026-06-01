---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/verified-callers-namespace"
title: "VerifiedCallersNamespace"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.VerifiedCallersNamespace"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/verified_callers.go"
---
# `VerifiedCallersNamespace`

VerifiedCallersNamespace provides verified caller ID management with verification flow.

## Signature

```go
type VerifiedCallersNamespace struct
```

## Properties

| Name           | Type            | Required | Default | Description |
| -------------- | --------------- | -------- | ------- | ----------- |
| `CrudResource` | `*CrudResource` | yes      | —       | —           |

## Methods

- [`RedialVerification`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/verified-callers-namespace/redial-verification) — RedialVerification redials the verification call for a caller ID.
- [`SubmitVerification`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/verified-callers-namespace/submit-verification) — SubmitVerification submits a verification code for a caller ID.

## Source

[`pkg/rest/namespaces/verified_callers.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/verified_callers.go)

Line 12.
