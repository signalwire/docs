---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-messages/update"
title: "Update"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatMessages.Update"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatMessages"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `Update`

Update updates a message (uses POST per Twilio compat).

## Signature

```go
func (*CompatMessages) Update(sid string, data map[string]any) (map[string]any, error)
```

## Parameters

| Name   | Type             | Required | Default | Description |
| ------ | ---------------- | -------- | ------- | ----------- |
| `sid`  | `string`         | yes      | —       | —           |
| `data` | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/compat.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go)

Line 79.
