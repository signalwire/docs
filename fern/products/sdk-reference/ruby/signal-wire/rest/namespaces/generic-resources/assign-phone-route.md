---
slug: "/reference/ruby/signal-wire/rest/namespaces/generic-resources/assign-phone-route"
title: "assign_phone_route"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::REST::Namespaces::GenericResources#assign_phone_route"
  parent: "SignalWire::REST::Namespaces::GenericResources"
  module: "SignalWire.REST.Namespaces.GenericResources"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/fabric.rb"
  visibility: "public"
  deprecated: true
---
# `assign_phone_route`

> **Warning:**
>
> **Deprecated.** For the common binding cases use +phone\_numbers.set\_\*+ helpers.

This endpoint (+POST /api/fabric/resources/{id}/phone\_routes+) accepts
only a narrow set of legacy resource types as the attach target. It
_does not work_ for +swml\_webhook+ / +cxml\_webhook+ / +ai\_agent+
bindings -- those are configured on the phone number and the Fabric
resource is auto-materialized (see +phone\_numbers.set\_swml\_webhook+
etc.). The authoritative list of accepting resource types lives in
the OpenAPI spec; routing here for those types returns 404 or 422.

## Signature

```ruby
def assign_phone_route(resource_id, **kwargs)
```

## Parameters

| Name          | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `resource_id` | —    | yes      | —       | —           |
| `...kwargs`   | —    | no       | —       | —           |

## Source

[`lib/signalwire/rest/namespaces/fabric.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/fabric.rb)

Line 141.
