---
slug: "/reference/java/com/signalwire/sdk/rest/rest/phone-call-handler"
title: "PhoneCallHandler"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "enum"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.PhoneCallHandler"
  parent: "com.signalwire.sdk.rest"
  module: "com.signalwire.sdk.rest"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/PhoneCallHandler.java"
  visibility: "public"
---
# `PhoneCallHandler`

Values accepted for `call_handler` on
java.util.Map) phoneNumbers().update.

<p>
 Named `PhoneCallHandler` (not `CallHandler`) to avoid colliding
 with the RELAY client's inbound-call-handler callback type.
 <p>
 Setting a phone number's `call_handler` + the handler-specific
 companion field routes inbound calls and auto-materializes the matching
 Fabric resource on the server. See the typed helpers on
 `com.signalwire.sdk.rest.namespaces.PhoneNumbersNamespace`
 (`setSwmlWebhook`, `setCxmlWebhook`, ...).

 <p>Binding table:
 <pre>
 Enum member        Companion field (required)        Auto-creates resource
 -----------------  --------------------------------  ---------------------
 RELAY_SCRIPT       call_relay_script_url             swml_webhook
 LAML_WEBHOOKS      call_request_url                  cxml_webhook
 LAML_APPLICATION   call_laml_application_id          cxml_application
 AI_AGENT           call_ai_agent_id                  ai_agent
 CALL_FLOW          call_flow_id                      call_flow
 RELAY_APPLICATION  call_relay_application            relay_application
 RELAY_TOPIC        call_relay_topic                  (routes via RELAY)
 RELAY_CONTEXT      call_relay_context                (legacy, prefer topic)
 RELAY_CONNECTOR    (connector config)                (internal)
 VIDEO_ROOM         call_video_room_id                (routes to Video API)
 DIALOGFLOW         call_dialogflow_agent_id          (none)
 </pre>

 <p>Note: `#LAML_WEBHOOKS` (wire value `laml_webhooks`) produces
 a <b>cXML</b> handler, not a generic webhook. For SWML, use
 `#RELAY_SCRIPT`.

**Modifiers:** `final`

## Signature

```java
public final enum PhoneCallHandler
```

## Inheritance

**Extends:** `java.lang.Enum<com.signalwire.sdk.rest.PhoneCallHandler>`

## Variants

| Name                | Type                                                         | Required | Default | Description |
| ------------------- | ------------------------------------------------------------ | -------- | ------- | ----------- |
| `AI_AGENT`          | `com.signalwire.sdk.rest.PhoneCallHandler AI_AGENT`          | yes      | —       | —           |
| `CALL_FLOW`         | `com.signalwire.sdk.rest.PhoneCallHandler CALL_FLOW`         | yes      | —       | —           |
| `DIALOGFLOW`        | `com.signalwire.sdk.rest.PhoneCallHandler DIALOGFLOW`        | yes      | —       | —           |
| `LAML_APPLICATION`  | `com.signalwire.sdk.rest.PhoneCallHandler LAML_APPLICATION`  | yes      | —       | —           |
| `LAML_WEBHOOKS`     | `com.signalwire.sdk.rest.PhoneCallHandler LAML_WEBHOOKS`     | yes      | —       | —           |
| `RELAY_APPLICATION` | `com.signalwire.sdk.rest.PhoneCallHandler RELAY_APPLICATION` | yes      | —       | —           |
| `RELAY_CONNECTOR`   | `com.signalwire.sdk.rest.PhoneCallHandler RELAY_CONNECTOR`   | yes      | —       | —           |
| `RELAY_CONTEXT`     | `com.signalwire.sdk.rest.PhoneCallHandler RELAY_CONTEXT`     | yes      | —       | —           |
| `RELAY_SCRIPT`      | `com.signalwire.sdk.rest.PhoneCallHandler RELAY_SCRIPT`      | yes      | —       | —           |
| `RELAY_TOPIC`       | `com.signalwire.sdk.rest.PhoneCallHandler RELAY_TOPIC`       | yes      | —       | —           |
| `VIDEO_ROOM`        | `com.signalwire.sdk.rest.PhoneCallHandler VIDEO_ROOM`        | yes      | —       | —           |

## Methods

- [`toString`](/reference/java/com/signalwire/sdk/rest/rest/phone-call-handler/to-string) — Returns the wire value so this enum serializes transparently into request bodies without an explicit `.wireValue()` indirection.
- [`valueOf`](/reference/java/com/signalwire/sdk/rest/rest/phone-call-handler/value-of)
- [`values`](/reference/java/com/signalwire/sdk/rest/rest/phone-call-handler/values)
- [`wireValue`](/reference/java/com/signalwire/sdk/rest/rest/phone-call-handler/wire-value) — The wire value sent on the `call_handler` field.

## Source

[`src/main/java/com/signalwire/sdk/rest/PhoneCallHandler.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/PhoneCallHandler.java)

Line 43.
