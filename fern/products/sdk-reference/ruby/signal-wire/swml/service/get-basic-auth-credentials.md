---
slug: "/reference/ruby/signal-wire/swml/service/get-basic-auth-credentials"
title: "get_basic_auth_credentials"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::SWML::Service#get_basic_auth_credentials"
  parent: "SignalWire::SWML::Service"
  module: "SignalWire.SWML.Service"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb"
  visibility: "public"
---
# `get_basic_auth_credentials`

Get the configured basic-auth credentials.

Python parity: `get_basic_auth_credentials(include_source=False)`.
When `include_source` is true, returns a 3-tuple `[user,
pass, source]` where `source` is one of `"environment"`,
`"auto-generated"`, or `"provided"`. Otherwise returns the
2-tuple `[user, pass]`.

## Signature

```ruby
def get_basic_auth_credentials(include_source: false)
```

## Parameters

| Name              | Type | Required | Default | Description |
| ----------------- | ---- | -------- | ------- | ----------- |
| `include_source:` | —    | no       | `false` | —           |

## Returns

`Array(String, String)` — or \[Array(String, String, String)]

## Source

[`lib/signalwire/swml/service.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb)

Line 251.
