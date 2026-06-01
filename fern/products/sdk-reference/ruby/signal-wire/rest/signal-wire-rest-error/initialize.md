---
slug: "/reference/ruby/signal-wire/rest/signal-wire-rest-error/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::REST::SignalWireRestError#initialize"
  parent: "SignalWire::REST::SignalWireRestError"
  module: "SignalWire.REST.SignalWireRestError"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/http_client.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(status_code, body, url, method_name = 'GET')
```

## Parameters

| Name          | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `status_code` | —    | yes      | —       | —           |
| `body`        | —    | yes      | —       | —           |
| `url`         | —    | yes      | —       | —           |
| `method_name` | —    | no       | `'GET'` | —           |

## Returns

`SignalWireRestError` — a new instance of SignalWireRestError

## Source

[`lib/signalwire/rest/http_client.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/http_client.rb)

Line 14.
