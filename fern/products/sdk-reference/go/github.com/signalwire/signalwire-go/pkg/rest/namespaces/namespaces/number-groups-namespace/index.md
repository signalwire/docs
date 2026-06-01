---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/number-groups-namespace"
title: "NumberGroupsNamespace"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.NumberGroupsNamespace"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/number_groups.go"
---
# `NumberGroupsNamespace`

NumberGroupsNamespace provides number group management with membership operations.

## Signature

```go
type NumberGroupsNamespace struct
```

## Properties

| Name           | Type            | Required | Default | Description |
| -------------- | --------------- | -------- | ------- | ----------- |
| `CrudResource` | `*CrudResource` | yes      | —       | —           |

## Methods

- [`AddMembership`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/number-groups-namespace/add-membership) — AddMembership adds a number to a group.
- [`DeleteMembership`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/number-groups-namespace/delete-membership) — DeleteMembership removes a membership by ID.
- [`GetMembership`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/number-groups-namespace/get-membership) — GetMembership retrieves a specific membership by ID.
- [`ListMemberships`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/number-groups-namespace/list-memberships) — ListMemberships lists number group memberships for a group.

## Source

[`pkg/rest/namespaces/number_groups.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/number_groups.go)

Line 11.
