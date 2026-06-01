---
slug: "/reference/dotnet/signal-wire.rest"
title: "SignalWire.REST"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "module"
  language: "dotnet"
  qualified_name: "SignalWire.REST"
---
# `SignalWire.REST`

## Classes

- [`CrudResource`](/reference/dotnet/signal-wire.rest/crud-resource) — Generic CRUD wrapper around an <xref href="SignalWire.REST.HttpClient" data-throw-if-not-resolved="false"></xref> and a base API path. Provides List / Create / Get / Update / Delete for any REST resource that follows the standard SignalWire collection+item URL pattern.
- [`CrudWithAddresses`](/reference/dotnet/signal-wire.rest/crud-with-addresses)
- [`HttpClient`](/reference/dotnet/signal-wire.rest/http-client) — Low-level HTTP client for SignalWire REST APIs. Uses <xref href="System.Net.Http.HttpClient" data-throw-if-not-resolved="false"></xref> with Basic Auth, and returns parsed JSON responses as dictionaries.
- [`PaginatedIterator`](/reference/dotnet/signal-wire.rest/paginated-iterator) — Walks paged HTTP responses by following `links.next` cursors. Mirrors Python `signalwire.rest._pagination.PaginatedIterator` — constructor records inputs without fetching; iteration triggers the first fetch and continues until a page is returned without a `links.next` cursor.
- [`RestClient`](/reference/dotnet/signal-wire.rest/rest-client) — Top-level SignalWire REST client. Provides lazy access to every API namespace (fabric, calling, phone\_numbers, datasphere, video, compat, etc.). Credentials can be supplied explicitly or pulled from environment variables.
- [`SignalWireRestError`](/reference/dotnet/signal-wire.rest/signal-wire-rest-error) — Exception thrown when a SignalWire REST API call returns a non-2xx status or encounters a transport-level error.
