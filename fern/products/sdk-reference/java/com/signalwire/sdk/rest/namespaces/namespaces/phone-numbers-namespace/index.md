---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace"
title: "PhoneNumbersNamespace"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace"
  parent: "com.signalwire.sdk.rest.namespaces"
  module: "com.signalwire.sdk.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java"
  visibility: "public"
---
# `PhoneNumbersNamespace`

REST namespace for phone number management.

<p>
 Supports the standard CRUD surface plus typed helpers for binding an
 inbound call to a handler (SWML webhook, cXML webhook, AI agent, call
 flow, RELAY application/topic). The binding model is: set
 `call_handler` + the handler-specific companion field on the phone
 number; the server auto-materializes the matching Fabric resource.
 See `PhoneCallHandler` for the enum and `rest/docs/phone-binding.md`
 for the full model.

## Signature

```java
public class PhoneNumbersNamespace
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/init)
- [`create`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/create) — Purchase a phone number.
- [`delete`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/delete) — Release a phone number.
- [`get`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/get) — Get a single phone number.
- [`getResource`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/get-resource) — Get the underlying CRUD resource.
- [`list`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/list) — List all phone numbers.
- [`search`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/search) — Search available phone numbers.
- [`setAiAgent`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/set-ai-agent) — Route inbound calls to an AI Agent Fabric resource by ID.
- [`setCallFlow`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/set-call-flow) — Route inbound calls to a Call Flow by ID (server default version).
- [`setCxmlApplication`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/set-cxml-application) — Route inbound calls to an existing cXML application by ID.
- [`setCxmlWebhook`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/set-cxml-webhook) — Route inbound calls to a cXML (Twilio-compat / LAML) webhook.
- [`setRelayApplication`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/set-relay-application) — Route inbound calls to a named RELAY application.
- [`setRelayTopic`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/set-relay-topic) — Route inbound calls to a RELAY topic (client subscription).
- [`setSwmlWebhook`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/set-swml-webhook) — Route inbound calls on this phone number to an SWML webhook URL.
- [`update`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/phone-numbers-namespace/update) — Update a phone number.

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/PhoneNumbersNamespace.java)

Line 27.
