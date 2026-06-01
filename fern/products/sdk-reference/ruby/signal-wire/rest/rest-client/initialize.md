---
slug: "/reference/ruby/signal-wire/rest/rest-client/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::REST::RestClient#initialize"
  parent: "SignalWire::REST::RestClient"
  module: "SignalWire.REST.RestClient"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/rest_client.rb"
  visibility: "public"
---
# `initialize`

+base\_url+ overrides the derived +https://{space}+ default. The
audit harness uses this to point at the local fixture server.

## Signature

```ruby
def initialize(project: nil, token: nil, host: nil, base_url: nil)
```

## Parameters

| Name        | Type | Required | Default | Description |
| ----------- | ---- | -------- | ------- | ----------- |
| `project:`  | —    | no       | `nil`   | —           |
| `token:`    | —    | no       | `nil`   | —           |
| `host:`     | —    | no       | `nil`   | —           |
| `base_url:` | —    | no       | `nil`   | —           |

## Returns

`RestClient` — a new instance of RestClient

## Source

[`lib/signalwire/rest/rest_client.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/rest_client.rb)

Line 58.
