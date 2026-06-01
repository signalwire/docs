---
slug: "/reference/ruby/signal-wire/rest/http-client"
title: "HttpClient"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::REST::HttpClient"
  parent: "SignalWire::REST"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/http_client.rb"
  visibility: "public"
---
# `HttpClient`

Thin wrapper around Net::HTTP with Basic Auth and JSON handling.

## Signature

```ruby
class HttpClient < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`base_url`](/reference/ruby/signal-wire/rest/http-client/base-url) — Returns the value of attribute base\_url.
- [`delete`](/reference/ruby/signal-wire/rest/http-client/delete)
- [`get`](/reference/ruby/signal-wire/rest/http-client/get)
- [`initialize`](/reference/ruby/signal-wire/rest/http-client/initialize) — +base\_url+ overrides the derived +https://{space}+ value when set, which is how the audit fixture and tests point the client at a loopback server. Pass either +space+ ("acme") / a host ("acme.signalwire.com") OR an explicit +base\_url+ ("http://127.0.0.1:NNNN").
- [`patch`](/reference/ruby/signal-wire/rest/http-client/patch)
- [`post`](/reference/ruby/signal-wire/rest/http-client/post)
- [`project_id`](/reference/ruby/signal-wire/rest/http-client/project-id)
- [`put`](/reference/ruby/signal-wire/rest/http-client/put)

## Source

[`lib/signalwire/rest/http_client.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/http_client.rb)

Line 24.
