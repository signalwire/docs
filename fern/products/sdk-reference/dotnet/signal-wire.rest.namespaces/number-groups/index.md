---
slug: "/reference/dotnet/signal-wire.rest.namespaces/number-groups"
title: "NumberGroups"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.NumberGroups"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `NumberGroups`

Number Groups (CRUD + membership operations; update via PUT).

Mirrors Python `signalwire.rest.namespaces.number_groups.NumberGroupsResource`.
Note delete\_membership / get\_membership target the top-level
`/api/relay/rest/number_group_memberships/{id}` path, NOT the
nested per-group sub-collection.

## Signature

```dotnet
public class NumberGroups : CrudResource
```

## Inheritance

**Extends:** [SignalWire.REST.CrudResource](/reference/dotnet/signal-wire.rest/crud-resource)

## Methods

- [`AddMembershipAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/number-groups/add-membership-async-string-dictionary-string-object)
- [`DeleteMembershipAsync(string)`](/reference/dotnet/signal-wire.rest.namespaces/number-groups/delete-membership-async-string)
- [`GetMembershipAsync(string)`](/reference/dotnet/signal-wire.rest.namespaces/number-groups/get-membership-async-string)
- [`ListMembershipsAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/number-groups/list-memberships-async-string-dictionary-string-string)
- [`NumberGroups(HttpClient)`](/reference/dotnet/signal-wire.rest.namespaces/number-groups/number-groups-http-client)
- [`UpdateAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/number-groups/update-async-string-dictionary-string-object) — Update a resource by ID (PUT basePath/{id}).
