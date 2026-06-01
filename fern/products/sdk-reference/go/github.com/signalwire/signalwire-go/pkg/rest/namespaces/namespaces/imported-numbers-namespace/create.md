---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/imported-numbers-namespace/create"
title: "Create"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.ImportedNumbersNamespace.Create"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.ImportedNumbersNamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/imported_numbers.go"
---
# `Create`

Create imports an externally-hosted phone number.

## Signature

```go
func (*ImportedNumbersNamespace) Create(data map[string]any) (map[string]any, error)
```

## Parameters

| Name   | Type             | Required | Default | Description |
| ------ | ---------------- | -------- | ------- | ----------- |
| `data` | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/imported_numbers.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/imported_numbers.go)

Line 23.
