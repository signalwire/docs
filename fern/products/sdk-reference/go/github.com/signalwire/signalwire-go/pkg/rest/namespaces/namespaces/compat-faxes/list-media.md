---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-faxes/list-media"
title: "ListMedia"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatFaxes.ListMedia"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatFaxes"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `ListMedia`

ListMedia lists media for a fax.

## Signature

```go
func (*CompatFaxes) ListMedia(faxSID string, params map[string]string) (map[string]any, error)
```

## Parameters

| Name     | Type                | Required | Default | Description |
| -------- | ------------------- | -------- | ------- | ----------- |
| `faxSID` | `string`            | yes      | —       | —           |
| `params` | `map[string]string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/compat.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go)

Line 111.
