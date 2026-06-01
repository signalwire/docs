---
slug: "/reference/dotnet/signal-wire.rest/crud-resource"
title: "CrudResource"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.CrudResource"
  parent: "SignalWire.REST"
  module: "SignalWire.REST"
  visibility: "public"
---
# `CrudResource`

Generic CRUD wrapper around an <xref href="SignalWire.REST.HttpClient" data-throw-if-not-resolved="false"></xref> and a base API path.

Provides List / Create / Get / Update / Delete for any REST resource that
follows the standard SignalWire collection+item URL pattern.

## Signature

```dotnet
public class CrudResource
```

## Properties

| Name       | Type                                   | Required | Default | Description |
| ---------- | -------------------------------------- | -------- | ------- | ----------- |
| `BasePath` | `public string BasePath { get; }`      | yes      | —       | —           |
| `Client`   | `protected HttpClient Client { get; }` | yes      | —       | —           |

## Methods

- [`CreateAsync(Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest/crud-resource/create-async-dictionary-string-object) — Create a new resource (POST basePath).
- [`CrudResource(HttpClient, string)`](/reference/dotnet/signal-wire.rest/crud-resource/crud-resource-http-client-string)
- [`DeleteAsync(string)`](/reference/dotnet/signal-wire.rest/crud-resource/delete-async-string) — Delete a resource by ID (DELETE basePath/{id}).
- [`GetAsync(string)`](/reference/dotnet/signal-wire.rest/crud-resource/get-async-string) — Retrieve a single resource by ID (GET basePath/{id}).
- [`ListAsync(Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest/crud-resource/list-async-dictionary-string-string) — List resources (GET basePath).
- [`Path(params string[])`](/reference/dotnet/signal-wire.rest/crud-resource/path-params-string) — Build a full path by appending segments to the base path.
- [`UpdateAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest/crud-resource/update-async-string-dictionary-string-object) — Update a resource by ID (PUT basePath/{id}).
