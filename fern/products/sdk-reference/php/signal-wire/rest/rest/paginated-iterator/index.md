---
slug: "/reference/php/signal-wire/rest/rest/paginated-iterator"
title: "PaginatedIterator"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\REST\\PaginatedIterator"
  parent: "SignalWire\\REST"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/PaginatedIterator.php"
---
# `PaginatedIterator`

Iterates items across paginated API responses.

Mirrors Python `signalwire.rest._pagination.PaginatedIterator`: walks
pages by following the `links.next` cursor and extracting query params
from the URL.

Usage:
foreach (new PaginatedIterator($http, '/api/path', \['k' => 'v']) as $item) {
// ...
}

## Signature

```php
class PaginatedIterator implements Iterator, Traversable
```

## Inheritance

**Implements:** `Iterator`, `Traversable`

## Methods

- [`__construct`](/reference/php/signal-wire/rest/rest/paginated-iterator/construct)
- [`current`](/reference/php/signal-wire/rest/rest/paginated-iterator/current)
- [`getDataKey`](/reference/php/signal-wire/rest/rest/paginated-iterator/get-data-key)
- [`getHttp`](/reference/php/signal-wire/rest/rest/paginated-iterator/get-http)
- [`getIndex`](/reference/php/signal-wire/rest/rest/paginated-iterator/get-index)
- [`getItems`](/reference/php/signal-wire/rest/rest/paginated-iterator/get-items)
- [`getParams`](/reference/php/signal-wire/rest/rest/paginated-iterator/get-params)
- [`getPath`](/reference/php/signal-wire/rest/rest/paginated-iterator/get-path)
- [`isDone`](/reference/php/signal-wire/rest/rest/paginated-iterator/is-done)
- [`key`](/reference/php/signal-wire/rest/rest/paginated-iterator/key)
- [`next`](/reference/php/signal-wire/rest/rest/paginated-iterator/next)
- [`rewind`](/reference/php/signal-wire/rest/rest/paginated-iterator/rewind)
- [`valid`](/reference/php/signal-wire/rest/rest/paginated-iterator/valid)

## Source

[`/src/src/SignalWire/REST/PaginatedIterator.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/PaginatedIterator.php)

Line 19.
