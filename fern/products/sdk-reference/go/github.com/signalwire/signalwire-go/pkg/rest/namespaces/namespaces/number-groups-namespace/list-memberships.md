---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/number-groups-namespace/list-memberships"
title: "ListMemberships"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.NumberGroupsNamespace.ListMemberships"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.NumberGroupsNamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/number_groups.go"
---
# `ListMemberships`

ListMemberships lists number group memberships for a group.

## Signature

```go
func (*NumberGroupsNamespace) ListMemberships(groupID string, params map[string]string) (map[string]any, error)
```

## Parameters

| Name      | Type                | Required | Default | Description |
| --------- | ------------------- | -------- | ------- | ----------- |
| `groupID` | `string`            | yes      | —       | —           |
| `params`  | `map[string]string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/number_groups.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/number_groups.go)

Line 23.
