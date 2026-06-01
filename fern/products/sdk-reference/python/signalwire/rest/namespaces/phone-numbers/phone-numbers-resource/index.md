---
slug: "/reference/python/signalwire/rest/namespaces/phone-numbers/phone-numbers-resource"
title: "PhoneNumbersResource"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.rest.namespaces.phone_numbers.PhoneNumbersResource"
  parent: "signalwire.rest.namespaces.phone_numbers"
  module: "signalwire.rest.namespaces.phone_numbers"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/rest/namespaces/phone_numbers.py"
---
# `PhoneNumbersResource`

Phone number management.

Supports the standard CRUD surface plus typed helpers for binding an
inbound call to a handler (SWML webhook, cXML webhook, AI agent, call
flow, RELAY application/topic). The binding model is: set
`call_handler` + the handler-specific companion field on the phone
number; the server auto-materializes the matching Fabric resource.
See :mod:`signalwire.rest.call_handler` for the enum, and the
porting-sdk's `phone-binding.md` for the full model.

## Signature

```python
class PhoneNumbersResource(CrudResource)
```

## Inheritance

**Extends:** `CrudResource`

## Methods

- [`__init__`](/reference/python/signalwire/rest/namespaces/phone-numbers/phone-numbers-resource/init)
- [`search`](/reference/python/signalwire/rest/namespaces/phone-numbers/phone-numbers-resource/search)
- [`set_ai_agent`](/reference/python/signalwire/rest/namespaces/phone-numbers/phone-numbers-resource/set-ai-agent) — Route inbound calls to an AI Agent Fabric resource by ID.
- [`set_call_flow`](/reference/python/signalwire/rest/namespaces/phone-numbers/phone-numbers-resource/set-call-flow) — Route inbound calls to a Call Flow by ID.
- [`set_cxml_application`](/reference/python/signalwire/rest/namespaces/phone-numbers/phone-numbers-resource/set-cxml-application) — Route inbound calls to an existing cXML application by ID.
- [`set_cxml_webhook`](/reference/python/signalwire/rest/namespaces/phone-numbers/phone-numbers-resource/set-cxml-webhook) — Route inbound calls to a cXML (Twilio-compat / LAML) webhook.
- [`set_relay_application`](/reference/python/signalwire/rest/namespaces/phone-numbers/phone-numbers-resource/set-relay-application) — Route inbound calls to a named RELAY application.
- [`set_relay_topic`](/reference/python/signalwire/rest/namespaces/phone-numbers/phone-numbers-resource/set-relay-topic) — Route inbound calls to a RELAY topic (client subscription).
- [`set_swml_webhook`](/reference/python/signalwire/rest/namespaces/phone-numbers/phone-numbers-resource/set-swml-webhook) — Route inbound calls to an SWML webhook URL.

## Source

[`/src/signalwire/signalwire/rest/namespaces/phone_numbers.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/rest/namespaces/phone_numbers.py)

Line 20.
