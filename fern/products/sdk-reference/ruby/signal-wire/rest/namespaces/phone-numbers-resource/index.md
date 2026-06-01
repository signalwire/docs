---
slug: "/reference/ruby/signal-wire/rest/namespaces/phone-numbers-resource"
title: "PhoneNumbersResource"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::REST::Namespaces::PhoneNumbersResource"
  parent: "SignalWire::REST::Namespaces"
  module: "SignalWire.REST.Namespaces"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/phone_numbers.rb"
  visibility: "public"
---
# `PhoneNumbersResource`

Phone number management.

Supports the standard CRUD surface plus typed helpers for binding an
inbound call to a handler (SWML webhook, cXML webhook, AI agent, call
flow, RELAY application/topic). The binding model is: set
+call\_handler+ and the handler-specific companion field on the phone
number; the server auto-materializes the matching Fabric resource.
See +SignalWire::REST::PhoneCallHandler+ for the enum, and the
porting-sdk's +phone-binding.md+ for the full model.

## Signature

```ruby
class PhoneNumbersResource < SignalWire::REST::CrudResource
```

## Inheritance

**Extends:** [SignalWire::REST::CrudResource](/reference/ruby/signal-wire/rest/crud-resource)

## Methods

- [`initialize`](/reference/ruby/signal-wire/rest/namespaces/phone-numbers-resource/initialize)
- [`search`](/reference/ruby/signal-wire/rest/namespaces/phone-numbers-resource/search)
- [`set_ai_agent`](/reference/ruby/signal-wire/rest/namespaces/phone-numbers-resource/set-ai-agent) — Route inbound calls to an AI Agent Fabric resource by ID.
- [`set_call_flow`](/reference/ruby/signal-wire/rest/namespaces/phone-numbers-resource/set-call-flow) — Route inbound calls to a Call Flow by ID.
- [`set_cxml_application`](/reference/ruby/signal-wire/rest/namespaces/phone-numbers-resource/set-cxml-application) — Route inbound calls to an existing cXML application by ID.
- [`set_cxml_webhook`](/reference/ruby/signal-wire/rest/namespaces/phone-numbers-resource/set-cxml-webhook) — Route inbound calls to a cXML (Twilio-compat / LAML) webhook.
- [`set_relay_application`](/reference/ruby/signal-wire/rest/namespaces/phone-numbers-resource/set-relay-application) — Route inbound calls to a named RELAY application.
- [`set_relay_topic`](/reference/ruby/signal-wire/rest/namespaces/phone-numbers-resource/set-relay-topic) — Route inbound calls to a RELAY topic (client subscription).
- [`set_swml_webhook`](/reference/ruby/signal-wire/rest/namespaces/phone-numbers-resource/set-swml-webhook) — Route inbound calls to an SWML webhook URL.

## Source

[`lib/signalwire/rest/namespaces/phone_numbers.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/phone_numbers.rb)

Line 17.
