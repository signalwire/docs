---
slug: "/reference/cpp/signalwire/rest/paginated-iterator"
title: "PaginatedIterator"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::rest::PaginatedIterator"
  parent: "signalwire::rest"
  module: "signalwire.rest"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/http_client.hpp"
  visibility: "public"
---
# `PaginatedIterator`

Iterates items across paginated API responses.
Mirrors signalwire-python's signalwire.rest.\_pagination.PaginatedIterator: fetches the configured path with the configured params, walks the data\_key array, then follows links.next (parsing its query string for the next page's params) until the response carries no links.next.
Iteration is lazy  the constructor records inputs but performs no HTTP. The first has\_next() / next() call performs the first fetch. Cursor query params are extracted by parsing links.next like Python's urllib.parse.urlparse + parse\_qs.

## Signature

```cpp
class signalwire::rest::PaginatedIterator
```

## Methods

- [`data_key`](/reference/cpp/signalwire/rest/paginated-iterator/data-key)
- [`done`](/reference/cpp/signalwire/rest/paginated-iterator/done)
- [`has_next`](/reference/cpp/signalwire/rest/paginated-iterator/has-next) — Returns true if another item can be fetched. Performs HTTP if the in-memory buffer is exhausted but more pages remain.
- [`http`](/reference/cpp/signalwire/rest/paginated-iterator/http)
- [`index`](/reference/cpp/signalwire/rest/paginated-iterator/index__2)
- [`items`](/reference/cpp/signalwire/rest/paginated-iterator/items)
- [`next`](/reference/cpp/signalwire/rest/paginated-iterator/next) — Returns the next item; throws std::out\_of\_range when the iterator is exhausted (mirrors Python's StopIteration).
- [`PaginatedIterator`](/reference/cpp/signalwire/rest/paginated-iterator/paginated-iterator)
- [`params`](/reference/cpp/signalwire/rest/paginated-iterator/params)
- [`path`](/reference/cpp/signalwire/rest/paginated-iterator/path)

## Source

[`include/signalwire/rest/http_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/http_client.hpp)

Line 99.
