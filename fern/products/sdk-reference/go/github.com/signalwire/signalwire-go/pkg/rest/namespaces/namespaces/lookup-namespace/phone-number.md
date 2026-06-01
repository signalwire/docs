---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/lookup-namespace/phone-number"
title: "PhoneNumber"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.LookupNamespace.PhoneNumber"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.LookupNamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/lookup.go"
---
# `PhoneNumber`

PhoneNumber looks up information about a phone number. The e164 parameter should be the number in E.164 format. Optional params can include "include" for additional data (e.g., "carrier").

## Signature

```go
func (*LookupNamespace) PhoneNumber(e164 string, params map[string]string) (map[string]any, error)
```

## Parameters

| Name     | Type                | Required | Default | Description |
| -------- | ------------------- | -------- | ------- | ----------- |
| `e164`   | `string`            | yes      | —       | —           |
| `params` | `map[string]string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/lookup.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/lookup.go)

Line 25.
