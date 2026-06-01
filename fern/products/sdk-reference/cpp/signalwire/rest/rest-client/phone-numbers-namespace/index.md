---
slug: "/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace"
title: "PhoneNumbersNamespace"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::PhoneNumbersNamespace"
  parent: "signalwire::rest::RestClient"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `PhoneNumbersNamespace`

## Signature

```cpp
struct signalwire::rest::RestClient::PhoneNumbersNamespace : signalwire::rest::CrudResource
```

## Inheritance

**Extends:** [signalwire::rest::CrudResource](/reference/cpp/signalwire/rest/crud-resource)

## Methods

- [`buy`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/buy)
- [`make_ai_agent_body`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/make-ai-agent-body)
- [`make_call_flow_body`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/make-call-flow-body)
- [`make_cxml_application_body`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/make-cxml-application-body)
- [`make_cxml_webhook_body`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/make-cxml-webhook-body)
- [`make_relay_application_body`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/make-relay-application-body)
- [`make_relay_topic_body`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/make-relay-topic-body)
- [`make_swml_webhook_body`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/make-swml-webhook-body)
- [`PhoneNumbersNamespace`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/phone-numbers-namespace)
- [`release`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/release)
- [`search`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/search)
- [`set_ai_agent`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/set-ai-agent) — Route inbound calls to an AI Agent Fabric resource by ID.
- [`set_call_flow`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/set-call-flow) — Route inbound calls to a Call Flow by ID. opts.version accepts "working\_copy" or "current\_deployed".
- [`set_cxml_application`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/set-cxml-application) — Route inbound calls to an existing cXML application by ID.
- [`set_cxml_webhook`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/set-cxml-webhook) — Route inbound calls to a cXML (Twilio-compat / LAML) webhook. Despite the wire value laml\_webhooks being plural, this creates a single cxml\_webhook Fabric resource. Extra options populate fallback and status-callback fields.
- [`set_relay_application`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/set-relay-application) — Route inbound calls to a named RELAY application.
- [`set_relay_topic`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/set-relay-topic) — Route inbound calls to a RELAY topic (client subscription).
- [`set_swml_webhook`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/set-swml-webhook) — Route inbound calls to an SWML webhook URL. Server auto-creates a swml\_webhook Fabric resource keyed off this URL.

## Classes

- [`CallFlowOptions`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/call-flow-options) — Options for binding a phone number to a call flow.
- [`CxmlWebhookOptions`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/cxml-webhook-options) — Options for binding a phone number to a cXML (Twilio-compat) webhook.
- [`RelayTopicOptions`](/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/relay-topic-options) — Options for binding a phone number to a RELAY topic.

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 452.
