---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/get"
title: "Get"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatConferences.Get"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatConferences"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `Get`

Get retrieves a conference by SID.

## Signature

```go
func (*CompatConferences) Get(sid string) (map[string]any, error)
```

## Parameters

| Name  | Type     | Required | Default | Description |
| ----- | -------- | -------- | ------- | ----------- |
| `sid` | `string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/compat.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go)

Line 139.
