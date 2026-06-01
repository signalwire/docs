---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/phone-numbers-namespace/search"
title: "Search"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.PhoneNumbersNamespace.Search"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.PhoneNumbersNamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/phone_numbers.go"
---
# `Search`

Search searches for available phone numbers with optional filter parameters such as area\_code, contains, starts\_with, etc.

params may contain values of any type (string, int, bool, etc.); they are converted to strings internally before the HTTP request is made, matching Python's \*\*params behaviour which accepts numeric and boolean query values.

## Signature

```go
func (*PhoneNumbersNamespace) Search(params map[string]any) (map[string]any, error)
```

## Parameters

| Name     | Type             | Required | Default | Description |
| -------- | ---------------- | -------- | ------- | ----------- |
| `params` | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/phone_numbers.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/phone_numbers.go)

Line 38.
