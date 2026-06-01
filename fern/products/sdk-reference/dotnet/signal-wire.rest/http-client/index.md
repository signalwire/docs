---
slug: "/reference/dotnet/signal-wire.rest/http-client"
title: "HttpClient"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.HttpClient"
  parent: "SignalWire.REST"
  module: "SignalWire.REST"
  visibility: "public"
---
# `HttpClient`

Low-level HTTP client for SignalWire REST APIs.

Uses <xref href="System.Net.Http.HttpClient" data-throw-if-not-resolved="false"></xref> with Basic Auth,
and returns parsed JSON responses as dictionaries.

## Signature

```dotnet
public class HttpClient
```

## Properties

| Name         | Type                                | Required | Default | Description |
| ------------ | ----------------------------------- | -------- | ------- | ----------- |
| `AuthHeader` | `public string AuthHeader { get; }` | yes      | —       | —           |
| `BaseUrl`    | `public string BaseUrl { get; }`    | yes      | —       | —           |
| `ProjectId`  | `public string ProjectId { get; }`  | yes      | —       | —           |
| `Token`      | `public string Token { get; }`      | yes      | —       | —           |

## Methods

- [`DeleteAsync(string)`](/reference/dotnet/signal-wire.rest/http-client/delete-async-string) — DELETE.
- [`GetAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest/http-client/get-async-string-dictionary-string-string) — GET with optional query-string parameters.
- [`HttpClient`](/reference/dotnet/signal-wire.rest/http-client/http-client)
- [`ListAllAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest/http-client/list-all-async-string-dictionary-string-string) — Return pages by following "next" links automatically. Expects { "data": \[...], "links": { "next": "..." } }.
- [`PatchAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest/http-client/patch-async-string-dictionary-string-object) — PATCH with JSON body.
- [`PostAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest/http-client/post-async-string-dictionary-string-object) — POST with JSON body.
- [`PutAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest/http-client/put-async-string-dictionary-string-object) — PUT with JSON body.
