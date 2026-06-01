---
slug: "/reference/ruby/signal-wire/rest/paginated-iterator/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::REST::PaginatedIterator#initialize"
  parent: "SignalWire::REST::PaginatedIterator"
  module: "SignalWire.REST.PaginatedIterator"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/pagination.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(http, path, params = nil, data_key = 'data')
```

## Parameters

| Name       | Type | Required | Default  | Description |
| ---------- | ---- | -------- | -------- | ----------- |
| `http`     | —    | yes      | —        | —           |
| `path`     | —    | yes      | —        | —           |
| `params`   | —    | no       | `nil`    | —           |
| `data_key` | —    | no       | `'data'` | —           |

## Returns

`PaginatedIterator` — a new instance of PaginatedIterator

## Source

[`lib/signalwire/rest/pagination.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/pagination.rb)

Line 23.
