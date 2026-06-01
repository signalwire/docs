---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/sip-profile-namespace/update"
title: "Update"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.SipProfileNamespace.Update"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.SipProfileNamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/sip_profile.go"
---
# `Update`

Update modifies the project SIP profile.

## Signature

```go
func (*SipProfileNamespace) Update(data map[string]any) (map[string]any, error)
```

## Parameters

| Name   | Type             | Required | Default | Description |
| ------ | ---------------- | -------- | ------- | ----------- |
| `data` | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/sip_profile.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/sip_profile.go)

Line 28.
