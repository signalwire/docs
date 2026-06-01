---
slug: "/reference/ruby/signal-wire/rest/paginated-iterator"
title: "PaginatedIterator"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::REST::PaginatedIterator"
  parent: "SignalWire::REST"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/pagination.rb"
  visibility: "public"
---
# `PaginatedIterator`

Iterates items across paginated API responses.

Mirrors the Python PaginatedIterator (signalwire.rest.\_pagination):
the constructor records http/path/params/data\_key without fetching;
iteration walks pages by following the +links.next+ cursor.

Usage:
iter = SignalWire::REST::PaginatedIterator.new(http, '/api/path',
params: {}, data\_key: 'data')
iter.each { |item| ... }

The iterator is single-pass (matching Python's **next** semantics);
use #to\_a to collect every item across all pages.

## Signature

```ruby
class PaginatedIterator < Object
```

## Inheritance

**Extends:** `Object`

**Mixins:** `Enumerable`

## Methods

- [`data_key`](/reference/ruby/signal-wire/rest/paginated-iterator/data-key) — Returns the value of attribute data\_key.
- [`done`](/reference/ruby/signal-wire/rest/paginated-iterator/done) — Returns the value of attribute done.
- [`each`](/reference/ruby/signal-wire/rest/paginated-iterator/each)
- [`http`](/reference/ruby/signal-wire/rest/paginated-iterator/http) — Returns the value of attribute http.
- [`index`](/reference/ruby/signal-wire/rest/paginated-iterator/index__2) — Returns the value of attribute index.
- [`initialize`](/reference/ruby/signal-wire/rest/paginated-iterator/initialize)
- [`items`](/reference/ruby/signal-wire/rest/paginated-iterator/items) — Returns the value of attribute items.
- [`next_item`](/reference/ruby/signal-wire/rest/paginated-iterator/next-item) — Equivalent of Python's **next**. Returns the sentinel +:**stop**+ when exhausted (Ruby has no StopIteration error idiom for plain Enumerable), but the public surface is +#each+.
- [`params`](/reference/ruby/signal-wire/rest/paginated-iterator/params) — Returns the value of attribute params.
- [`path`](/reference/ruby/signal-wire/rest/paginated-iterator/path) — Returns the value of attribute path.

## Source

[`lib/signalwire/rest/pagination.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/pagination.rb)

Line 18.
