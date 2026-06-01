---
slug: "/reference/dotnet/signal-wire.rest/paginated-iterator"
title: "PaginatedIterator"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.PaginatedIterator"
  parent: "SignalWire.REST"
  module: "SignalWire.REST"
  visibility: "public"
---
# `PaginatedIterator`

Walks paged HTTP responses by following `links.next` cursors.

Mirrors Python `signalwire.rest._pagination.PaginatedIterator` —
constructor records inputs without fetching; iteration triggers
the first fetch and continues until a page is returned without a
`links.next` cursor.

## Signature

```dotnet
public class PaginatedIterator : IAsyncEnumerable<Dictionary<string, object?>>
```

## Inheritance

**Implements:** `IAsyncEnumerable<Dictionary<string,object>>`

## Properties

| Name      | Type                                                      | Required | Default | Description |
| --------- | --------------------------------------------------------- | -------- | ------- | ----------- |
| `DataKey` | `public string DataKey { get; }`                          | yes      | —       | —           |
| `Done`    | `public bool Done { get; }`                               | yes      | —       | —           |
| `Http`    | `public HttpClient Http { get; }`                         | yes      | —       | —           |
| `Index`   | `public int Index { get; }`                               | yes      | —       | —           |
| `Items`   | `public List<Dictionary<string, object?>> Items { get; }` | yes      | —       | —           |
| `Params`  | `public Dictionary<string, string>? Params { get; }`      | yes      | —       | —           |
| `Path`    | `public string Path { get; }`                             | yes      | —       | —           |

## Methods

- [`GetAsyncEnumerator(CancellationToken)`](/reference/dotnet/signal-wire.rest/paginated-iterator/get-async-enumerator-cancellation-token) — Async-enumerable adapter so callers can write `await foreach (var item in iterator)`.
- [`NextAsync()`](/reference/dotnet/signal-wire.rest/paginated-iterator/next-async) — Returns the next item, or throws InvalidOperationException when exhausted (mirroring Python's StopIteration).
- [`PaginatedIterator(HttpClient, string, Dictionary<string, string>?, string)`](/reference/dotnet/signal-wire.rest/paginated-iterator/paginated-iterator-http-client-string-dictionary-string-string-string)
