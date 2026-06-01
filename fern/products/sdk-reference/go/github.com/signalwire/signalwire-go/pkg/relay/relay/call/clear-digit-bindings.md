---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/clear-digit-bindings"
title: "ClearDigitBindings"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.ClearDigitBindings"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `ClearDigitBindings`

ClearDigitBindings clears all DTMF digit bindings, optionally filtered by realm. Pass an empty string to clear all realms (matches Python's clear\_digit\_bindings(\*, realm)).

## Signature

```go
func (*Call) ClearDigitBindings(realm string) error
```

## Parameters

| Name    | Type     | Required | Default | Description |
| ------- | -------- | -------- | ------- | ----------- |
| `realm` | `string` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 1143.
