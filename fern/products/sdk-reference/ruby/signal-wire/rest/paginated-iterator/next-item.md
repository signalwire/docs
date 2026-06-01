---
slug: "/reference/ruby/signal-wire/rest/paginated-iterator/next-item"
title: "next_item"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::REST::PaginatedIterator#next_item"
  parent: "SignalWire::REST::PaginatedIterator"
  module: "SignalWire.REST.PaginatedIterator"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/pagination.rb"
  visibility: "public"
---
# `next_item`

Equivalent of Python's **next**. Returns the sentinel +:**stop**+
when exhausted (Ruby has no StopIteration error idiom for plain
Enumerable), but the public surface is +#each+.

## Signature

```ruby
def next_item
```

## Source

[`lib/signalwire/rest/pagination.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/pagination.rb)

Line 48.
