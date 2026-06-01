---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-phone-numbers/search-toll-free"
title: "SearchTollFree"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatPhoneNumbers.SearchTollFree"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatPhoneNumbers"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `SearchTollFree`

SearchTollFree searches for available toll-free numbers in a country.

## Signature

```go
func (*CompatPhoneNumbers) SearchTollFree(country string, params map[string]string) (map[string]any, error)
```

## Parameters

| Name      | Type                | Required | Default | Description |
| --------- | ------------------- | -------- | ------- | ----------- |
| `country` | `string`            | yes      | —       | —           |
| `params`  | `map[string]string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/compat.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go)

Line 254.
