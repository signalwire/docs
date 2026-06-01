---
slug: "/reference/ruby/signal-wire/security/session-manager"
title: "SessionManager"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Security::SessionManager"
  parent: "SignalWire::Security"
  module: "SignalWire.Security"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/security/session_manager.rb"
  visibility: "public"
---
# `SessionManager`

Stateless HMAC-SHA256 session manager for secure SWAIG tool tokens.

Tokens are self-contained: all information needed for validation is
encoded inside the token itself. No server-side session state is stored.

mgr = SessionManager.new(token\_expiry\_secs: 900)
token = mgr.create\_token("lookup\_order", "call-abc-123")
mgr.validate\_token("lookup\_order", token, "call-abc-123") # => true

## Signature

```ruby
class SessionManager < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`create_token`](/reference/ruby/signal-wire/security/session-manager/create-token) — Create a secure, self-contained token for a function call.
- [`initialize`](/reference/ruby/signal-wire/security/session-manager/initialize)
- [`validate_token`](/reference/ruby/signal-wire/security/session-manager/validate-token) — Validate a function-call token.

## Source

[`lib/signalwire/security/session_manager.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/security/session_manager.rb)

Line 23.
