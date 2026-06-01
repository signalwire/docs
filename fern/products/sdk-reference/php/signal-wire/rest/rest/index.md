---
slug: "/reference/php/signal-wire/rest/rest"
title: "REST"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "module"
  language: "php"
  qualified_name: "SignalWire\\REST"
  module: "SignalWire.REST"
---
# `REST`

## Signature

```php
namespace SignalWire\REST
```

## Classes

- [`BaseResource`](/reference/php/signal-wire/rest/rest/base-resource) — Common base class for namespace and resource classes.
- [`CrudResource`](/reference/php/signal-wire/rest/rest/crud-resource) — Generic CRUD wrapper around an HttpClient and a base API path.
- [`CrudWithAddresses`](/reference/php/signal-wire/rest/rest/crud-with-addresses) — CRUD resource that also supports listing addresses for an item.
- [`HttpClient`](/reference/php/signal-wire/rest/rest/http-client) — Low-level HTTP client for SignalWire REST APIs.
- [`PaginatedIterator`](/reference/php/signal-wire/rest/rest/paginated-iterator) — Iterates items across paginated API responses.
- [`RestClient`](/reference/php/signal-wire/rest/rest/rest-client) — Top-level SignalWire REST client.
- [`SignalWireRestError`](/reference/php/signal-wire/rest/rest/signal-wire-rest-error) — Exception thrown when a SignalWire REST API request fails with a non-2xx status.
