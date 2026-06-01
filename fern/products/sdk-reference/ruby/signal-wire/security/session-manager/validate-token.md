---
slug: "/reference/ruby/signal-wire/security/session-manager/validate-token"
title: "validate_token"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Security::SessionManager#validate_token"
  parent: "SignalWire::Security::SessionManager"
  module: "SignalWire.Security.SessionManager"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/security/session_manager.rb"
  visibility: "public"
---
# `validate_token`

Validate a function-call token.

Checks:

1. Correct Base64 / structure (5 dot-separated parts)
2. HMAC signature (timing-safe comparison)
3. Function name matches
4. Call ID matches
5. Token not expired

## Signature

```ruby
def validate_token(function_name, token, call_id)
```

## Parameters

| Name            | Type     | Required | Default | Description           |
| --------------- | -------- | -------- | ------- | --------------------- |
| `function_name` | `String` | yes      | —       | —                     |
| `token`         | `String` | yes      | —       | the token to validate |
| `call_id`       | `String` | yes      | —       | —                     |

## Returns

`Boolean`

## Source

[`lib/signalwire/security/session_manager.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/security/session_manager.rb)

Line 63.
