---
slug: "/reference/ruby/signal-wire/rest"
title: "REST"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "module"
  language: "ruby"
  qualified_name: "SignalWire::REST"
  parent: "SignalWire"
  module: "SignalWire"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/pagination.rb"
  visibility: "public"
---
# `REST`

## Signature

```ruby
module REST
```

## Classes

- [`BaseResource`](/reference/ruby/signal-wire/rest/base-resource) — Base for all namespace/resource classes.
- [`CrudResource`](/reference/ruby/signal-wire/rest/crud-resource) — Standard CRUD resource with list/create/get/update/delete.
- [`HttpClient`](/reference/ruby/signal-wire/rest/http-client) — Thin wrapper around Net::HTTP with Basic Auth and JSON handling.
- [`PaginatedIterator`](/reference/ruby/signal-wire/rest/paginated-iterator) — Iterates items across paginated API responses.
- [`RestClient`](/reference/ruby/signal-wire/rest/rest-client) — REST client for the SignalWire platform APIs.
- [`SignalWireRestError`](/reference/ruby/signal-wire/rest/signal-wire-rest-error) — Raised when the SignalWire REST API returns a non-2xx response.

## Modules

- [`Namespaces`](/reference/ruby/signal-wire/rest/namespaces)
- [`PhoneCallHandler`](/reference/ruby/signal-wire/rest/phone-call-handler) — PhoneCallHandler -- enum-like constants of the +call\_handler+ values accepted by +phone\_numbers.update+.

## Source

[`lib/signalwire/rest/pagination.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/pagination.rb)

Line 4.
