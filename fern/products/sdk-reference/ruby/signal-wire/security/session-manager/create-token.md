---
slug: "/reference/ruby/signal-wire/security/session-manager/create-token"
title: "create_token"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Security::SessionManager#create_token"
  parent: "SignalWire::Security::SessionManager"
  module: "SignalWire.Security.SessionManager"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/security/session_manager.rb"
  visibility: "public"
---
# `create_token`

Create a secure, self-contained token for a function call.

Token format (before Base64):
call\_id.function\_name.expiry\_timestamp.nonce.hmac\_hex

## Signature

```ruby
def create_token(function_name, call_id)
```

## Parameters

| Name            | Type     | Required | Default | Description |
| --------------- | -------- | -------- | ------- | ----------- |
| `function_name` | `String` | yes      | —       | —           |
| `call_id`       | `String` | yes      | —       | —           |

## Returns

`String` — URL-safe Base64-encoded token

## Source

[`lib/signalwire/security/session_manager.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/security/session_manager.rb)

Line 39.
