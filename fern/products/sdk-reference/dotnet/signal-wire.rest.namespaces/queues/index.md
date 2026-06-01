---
slug: "/reference/dotnet/signal-wire.rest.namespaces/queues"
title: "Queues"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.Queues"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `Queues`

Queues namespace (Relay queues with member operations).

Mirrors Python `signalwire.rest.namespaces.queues.QueuesResource`.
Note: per-port adapter mismatches with the legacy CrudResource at
/api/fabric/resources/queues — this lives at /api/relay/rest/queues.

## Signature

```dotnet
public class Queues : CrudResource
```

## Inheritance

**Extends:** [SignalWire.REST.CrudResource](/reference/dotnet/signal-wire.rest/crud-resource)

## Methods

- [`GetMemberAsync(string, string)`](/reference/dotnet/signal-wire.rest.namespaces/queues/get-member-async-string-string)
- [`GetNextMemberAsync(string)`](/reference/dotnet/signal-wire.rest.namespaces/queues/get-next-member-async-string)
- [`ListMembersAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/queues/list-members-async-string-dictionary-string-string)
- [`Queues(HttpClient)`](/reference/dotnet/signal-wire.rest.namespaces/queues/queues-http-client)
- [`UpdateAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/queues/update-async-string-dictionary-string-object) — Update a resource by ID (PUT basePath/{id}).
