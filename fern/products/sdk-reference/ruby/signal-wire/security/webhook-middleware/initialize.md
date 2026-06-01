---
slug: "/reference/ruby/signal-wire/security/webhook-middleware/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Security::WebhookMiddleware#initialize"
  parent: "SignalWire::Security::WebhookMiddleware"
  module: "SignalWire.Security.WebhookMiddleware"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/security/webhook_middleware.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(app, signing_key:, trust_proxy: false, paths: nil, methods: ['POST'])
```

## Parameters

| Name           | Type    | Required | Default    | Description           |
| -------------- | ------- | -------- | ---------- | --------------------- |
| `app`          | `#call` | yes      | —          | the wrapped Rack app. |
| `signing_key:` | —       | yes      | —          | —                     |
| `trust_proxy:` | —       | no       | `false`    | —                     |
| `paths:`       | —       | no       | `nil`      | —                     |
| `methods:`     | —       | no       | `['POST']` | —                     |

## Returns

`WebhookMiddleware` — a new instance of WebhookMiddleware

## Throws

- `ArgumentError` — when `signing_key` is missing.

## Source

[`lib/signalwire/security/webhook_middleware.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/security/webhook_middleware.rb)

Line 66.
