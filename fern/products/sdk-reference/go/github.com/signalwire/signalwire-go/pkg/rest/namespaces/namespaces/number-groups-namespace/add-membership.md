---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/number-groups-namespace/add-membership"
title: "AddMembership"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.NumberGroupsNamespace.AddMembership"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.NumberGroupsNamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/number_groups.go"
---
# `AddMembership`

AddMembership adds a number to a group.

## Signature

```go
func (*NumberGroupsNamespace) AddMembership(groupID string, data map[string]any) (map[string]any, error)
```

## Parameters

| Name      | Type             | Required | Default | Description |
| --------- | ---------------- | -------- | ------- | ----------- |
| `groupID` | `string`         | yes      | —       | —           |
| `data`    | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/number_groups.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/number_groups.go)

Line 28.
