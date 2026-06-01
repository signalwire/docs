---
slug: "/reference/cpp/signalwire/rest/phone-call-handler"
title: "PhoneCallHandler"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "enum"
  language: "cpp"
  qualified_name: "signalwire::rest::PhoneCallHandler"
  parent: "signalwire::rest"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/phone_call_handler.hpp"
  visibility: "public"
---
# `PhoneCallHandler`

Enumeration of call\_handler values accepted by phone\_numbers.update.
Setting a phone number's call\_handler + the handler-specific companion field routes inbound calls and auto-materializes the matching Fabric resource on the server. The typed set\_\* helpers on PhoneNumbersNamespace wrap the low-level update call with the right combination — prefer those over constructing the wire body by hand.
Named PhoneCallHandler (not CallHandler) to avoid colliding with signalwire::relay::InboundCallHandler — the callback type used by the RELAY client for inbound-call events.

Enum value\
Wire value\
Companion field\
Auto-materializes

RelayScript\
relay\_script\
call\_relay\_script\_url\
swml\_webhook

LamlWebhooks\
laml\_webhooks\
call\_request\_url\
cxml\_webhook

LamlApplication\
laml\_application\
call\_laml\_application\_id\
cxml\_application

AiAgent\
ai\_agent\
call\_ai\_agent\_id\
ai\_agent

CallFlow\
call\_flow\
call\_flow\_id\
call\_flow

RelayApplication\
relay\_application\
call\_relay\_application\
relay\_application

RelayTopic\
relay\_topic\
call\_relay\_topic\
(RELAY routing)

RelayContext\
relay\_context\
call\_relay\_context\
(legacy)

RelayConnector\
relay\_connector\
(connector config)\
(internal)

VideoRoom\
video\_room\
call\_video\_room\_id\
(Video API)

Dialogflow\
dialogflow\
call\_dialogflow\_agent\_id\
(none)

Note: LamlWebhooks (wire value laml\_webhooks) produces a cXML handler despite the plural name. For SWML, use RelayScript.

## Signature

```cpp
enum class PhoneCallHandler
```

## Variants

| Name               | Type               | Required | Default | Description |
| ------------------ | ------------------ | -------- | ------- | ----------- |
| `AiAgent`          | `AiAgent`          | yes      | —       | —           |
| `CallFlow`         | `CallFlow`         | yes      | —       | —           |
| `Dialogflow`       | `Dialogflow`       | yes      | —       | —           |
| `LamlApplication`  | `LamlApplication`  | yes      | —       | —           |
| `LamlWebhooks`     | `LamlWebhooks`     | yes      | —       | —           |
| `RelayApplication` | `RelayApplication` | yes      | —       | —           |
| `RelayConnector`   | `RelayConnector`   | yes      | —       | —           |
| `RelayContext`     | `RelayContext`     | yes      | —       | —           |
| `RelayScript`      | `RelayScript`      | yes      | —       | —           |
| `RelayTopic`       | `RelayTopic`       | yes      | —       | —           |
| `VideoRoom`        | `VideoRoom`        | yes      | —       | —           |

## Source

[`include/signalwire/rest/phone_call_handler.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/phone_call_handler.hpp)

Line 39.
