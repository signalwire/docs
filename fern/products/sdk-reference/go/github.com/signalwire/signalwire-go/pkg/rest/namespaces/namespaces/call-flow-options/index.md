---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/call-flow-options"
title: "CallFlowOptions"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CallFlowOptions"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/phone_numbers.go"
---
# `CallFlowOptions`

CallFlowOptions holds optional fields for SetCallFlow.

## Signature

```go
type CallFlowOptions struct
```

## Properties

| Name      | Type                   | Required | Default | Description                                                                           |
| --------- | ---------------------- | -------- | ------- | ------------------------------------------------------------------------------------- |
| `Extra`   | `Extra map[string]any` | yes      | —       | Extra passes through additional wire-level fields.                                    |
| `Version` | `Version string`       | yes      | —       | Version accepts "working\_copy" or "current\_deployed" (server default when omitted). |

## Source

[`pkg/rest/namespaces/phone_numbers.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/phone_numbers.go)

Line 125.
