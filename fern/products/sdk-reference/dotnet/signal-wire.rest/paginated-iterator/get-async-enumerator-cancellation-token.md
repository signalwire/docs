---
slug: "/reference/dotnet/signal-wire.rest/paginated-iterator/get-async-enumerator-cancellation-token"
title: "GetAsyncEnumerator(CancellationToken)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.REST.PaginatedIterator.GetAsyncEnumerator(System.Threading.CancellationToken)"
  parent: "SignalWire.REST.PaginatedIterator"
  module: "SignalWire.REST"
  visibility: "public"
---
# `GetAsyncEnumerator(CancellationToken)`

Async-enumerable adapter so callers can write
`await foreach (var item in iterator)`.

## Signature

```dotnet
public IAsyncEnumerator<Dictionary<string, object?>> GetAsyncEnumerator(CancellationToken cancellationToken = default)
```

## Parameters

| Name                | Type                                 | Required | Default   | Description |
| ------------------- | ------------------------------------ | -------- | --------- | ----------- |
| `cancellationToken` | `System.Threading.CancellationToken` | no       | `default` | —           |

## Returns

`IAsyncEnumerator<Dictionary<string,object>>`
