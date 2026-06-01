---
slug: "/reference/dotnet/signal-wire.rest.namespaces/short-codes"
title: "ShortCodes"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.ShortCodes"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `ShortCodes`

Short codes (list/get/update — no create/delete; update via PUT).

Mirrors Python `signalwire.rest.namespaces.short_codes.ShortCodesResource`.
Extends CrudResource — overrides UpdateAsync to use PUT (matching
Python's \_update\_method = "PUT" on this resource).

## Signature

```dotnet
public class ShortCodes : CrudResource
```

## Inheritance

**Extends:** [SignalWire.REST.CrudResource](/reference/dotnet/signal-wire.rest/crud-resource)

## Methods

- [`ShortCodes(HttpClient)`](/reference/dotnet/signal-wire.rest.namespaces/short-codes/short-codes-http-client)
- [`UpdateAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/short-codes/update-async-string-dictionary-string-object) — Update a resource by ID (PUT basePath/{id}).
