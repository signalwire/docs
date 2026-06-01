---
slug: "/reference/ruby/signal-wire/rest/phone-call-handler"
title: "PhoneCallHandler"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "module"
  language: "ruby"
  qualified_name: "SignalWire::REST::PhoneCallHandler"
  parent: "SignalWire::REST"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/phone_call_handler.rb"
  visibility: "public"
---
# `PhoneCallHandler`

PhoneCallHandler -- enum-like constants of the +call\_handler+ values
accepted by +phone\_numbers.update+.

Named +PhoneCallHandler+ (not +CallHandler+) to avoid colliding with
the RELAY client's inbound-call-handler callback (+Relay::Client#on\_call+).

Setting a phone number's +call\_handler+ together with the handler-specific
companion field routes inbound calls and auto-materializes the matching
Fabric resource on the server. See the high-level helpers on
+SignalWire::REST::Namespaces::PhoneNumbersResource+.

\=== Mapping

Constant          | Companion field (required)     | Auto-creates resource
\------------------+--------------------------------+----------------------
RELAY\_SCRIPT      | call\_relay\_script\_url          | swml\_webhook
LAML\_WEBHOOKS     | call\_request\_url               | cxml\_webhook
LAML\_APPLICATION  | call\_laml\_application\_id       | cxml\_application
AI\_AGENT          | call\_ai\_agent\_id               | ai\_agent
CALL\_FLOW         | call\_flow\_id                   | call\_flow
RELAY\_APPLICATION | call\_relay\_application         | relay\_application
RELAY\_TOPIC       | call\_relay\_topic               | (routes via RELAY)
RELAY\_CONTEXT     | call\_relay\_context             | (legacy, prefer topic)
RELAY\_CONNECTOR   | (connector config)             | (internal)
VIDEO\_ROOM        | call\_video\_room\_id             | (routes to Video API)
DIALOGFLOW        | call\_dialogflow\_agent\_id       | (none)

Note: +LAML\_WEBHOOKS+ (wire value +laml\_webhooks+) produces a _cXML_
handler despite the plural name, not a generic webhook. For SWML, use
+RELAY\_SCRIPT+.

## Signature

```ruby
module PhoneCallHandler
```

## Constants

| Name                | Type                                                                                     | Required | Default | Description                                                    |
| ------------------- | ---------------------------------------------------------------------------------------- | -------- | ------- | -------------------------------------------------------------- |
| `AI_AGENT`          | `AI_AGENT = 'ai_agent'`                                                                  | yes      | —       | —                                                              |
| `ALL`               | `ALL = [
  RELAY_SCRIPT, LAML_WEBHOOKS, LAML_APPLICATION, AI_AGENT, CALL_FLOW,
  RELAY_` | yes      | —       | All supported wire values, in the same order as the constants. |
| `CALL_FLOW`         | `CALL_FLOW = 'call_flow'`                                                                | yes      | —       | —                                                              |
| `DIALOGFLOW`        | `DIALOGFLOW = 'dialogflow'`                                                              | yes      | —       | —                                                              |
| `LAML_APPLICATION`  | `LAML_APPLICATION = 'laml_application'`                                                  | yes      | —       | —                                                              |
| `LAML_WEBHOOKS`     | `LAML_WEBHOOKS = 'laml_webhooks'`                                                        | yes      | —       | —                                                              |
| `RELAY_APPLICATION` | `RELAY_APPLICATION = 'relay_application'`                                                | yes      | —       | —                                                              |
| `RELAY_CONNECTOR`   | `RELAY_CONNECTOR = 'relay_connector'`                                                    | yes      | —       | —                                                              |
| `RELAY_CONTEXT`     | `RELAY_CONTEXT = 'relay_context'`                                                        | yes      | —       | —                                                              |
| `RELAY_SCRIPT`      | `RELAY_SCRIPT = 'relay_script'`                                                          | yes      | —       | —                                                              |
| `RELAY_TOPIC`       | `RELAY_TOPIC = 'relay_topic'`                                                            | yes      | —       | —                                                              |
| `VIDEO_ROOM`        | `VIDEO_ROOM = 'video_room'`                                                              | yes      | —       | —                                                              |

## Source

[`lib/signalwire/rest/phone_call_handler.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/phone_call_handler.rb)

Line 35.
