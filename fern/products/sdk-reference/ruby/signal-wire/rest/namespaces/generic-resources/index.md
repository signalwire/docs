---
slug: "/reference/ruby/signal-wire/rest/namespaces/generic-resources"
title: "GenericResources"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::REST::Namespaces::GenericResources"
  parent: "SignalWire::REST::Namespaces"
  module: "SignalWire.REST.Namespaces"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/fabric.rb"
  visibility: "public"
---
# `GenericResources`

Generic resource operations across all fabric resource types.

## Signature

```ruby
class GenericResources < SignalWire::REST::BaseResource
```

## Inheritance

**Extends:** [SignalWire::REST::BaseResource](/reference/ruby/signal-wire/rest/base-resource)

## Methods

- [`assign_domain_application`](/reference/ruby/signal-wire/rest/namespaces/generic-resources/assign-domain-application)
- [`assign_phone_route`](/reference/ruby/signal-wire/rest/namespaces/generic-resources/assign-phone-route) — This endpoint (+POST /api/fabric/resources/{id}/phone\_routes+) accepts only a narrow set of legacy resource types as the attach target. It _does not work_ for +swml\_webhook+ / +cxml\_webhook+ / +ai\_agent+ bindings -- those are configured on the phone number and the Fabric resource is auto-materialized (see +phone\_numbers.set\_swml\_webhook+ etc.). The authoritative list of accepting resource types lives in the OpenAPI spec; routing here for those types returns 404 or 422.
- [`delete`](/reference/ruby/signal-wire/rest/namespaces/generic-resources/delete)
- [`get`](/reference/ruby/signal-wire/rest/namespaces/generic-resources/get)
- [`list`](/reference/ruby/signal-wire/rest/namespaces/generic-resources/list)
- [`list_addresses`](/reference/ruby/signal-wire/rest/namespaces/generic-resources/list-addresses)

## Source

[`lib/signalwire/rest/namespaces/fabric.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/fabric.rb)

Line 115.
