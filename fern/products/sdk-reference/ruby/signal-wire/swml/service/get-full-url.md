---
slug: "/reference/ruby/signal-wire/swml/service/get-full-url"
title: "get_full_url"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::SWML::Service#get_full_url"
  parent: "SignalWire::SWML::Service"
  module: "SignalWire.SWML.Service"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb"
  visibility: "public"
---
# `get_full_url`

Build the full URL for this service.

get\_full\_url                       # => "http://0.0.0.0:3000/"
get\_full\_url(include\_auth: true)   # => "http://user:pass@0.0.0.0:3000/"

## Signature

```ruby
def get_full_url(include_auth: false)
```

## Parameters

| Name            | Type | Required | Default | Description |
| --------------- | ---- | -------- | ------- | ----------- |
| `include_auth:` | —    | no       | `false` | —           |

## Source

[`lib/signalwire/swml/service.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb)

Line 292.
