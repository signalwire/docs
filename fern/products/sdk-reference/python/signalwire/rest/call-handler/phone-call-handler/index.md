---
slug: "/reference/python/signalwire/rest/call-handler/phone-call-handler"
title: "PhoneCallHandler"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.rest.call_handler.PhoneCallHandler"
  parent: "signalwire.rest.call_handler"
  module: "signalwire.rest.call_handler"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/rest/call_handler.py"
---
# `PhoneCallHandler`

`call_handler` values for `phone_numbers.update`.

Each value is a `str` subclass, so passing the enum member directly into
`phone_numbers.update(..., call_handler=PhoneCallHandler.RELAY_SCRIPT)`
serializes to the wire value without `.value` indirection.

\================= ============================= =======================
Enum member       Companion field (required)    Auto-creates resource
\================= ============================= =======================
RELAY\_SCRIPT      call\_relay\_script\_url         swml\_webhook
LAML\_WEBHOOKS     call\_request\_url              cxml\_webhook
LAML\_APPLICATION  call\_laml\_application\_id      cxml\_application
AI\_AGENT          call\_ai\_agent\_id              ai\_agent
CALL\_FLOW         call\_flow\_id                  call\_flow
RELAY\_APPLICATION call\_relay\_application        relay\_application
RELAY\_TOPIC       call\_relay\_topic              (routes via RELAY)
RELAY\_CONTEXT     call\_relay\_context            (legacy, prefer topic)
RELAY\_CONNECTOR   (connector config)            (internal)
VIDEO\_ROOM        call\_video\_room\_id            (routes to Video API)
DIALOGFLOW        call\_dialogflow\_agent\_id      (none)
\================= ============================= =======================

Note: `LAML_WEBHOOKS` (wire value `laml_webhooks`) produces a **cXML**
handler, not a generic webhook. For SWML, use `RELAY_SCRIPT`.

## Signature

```python
class PhoneCallHandler(str, Enum)
```

## Inheritance

**Extends:** `str`, `Enum`

## Properties

| Name                | Type                | Required | Default | Description |
| ------------------- | ------------------- | -------- | ------- | ----------- |
| `AI_AGENT`          | `AI_AGENT`          | yes      | —       | —           |
| `CALL_FLOW`         | `CALL_FLOW`         | yes      | —       | —           |
| `DIALOGFLOW`        | `DIALOGFLOW`        | yes      | —       | —           |
| `LAML_APPLICATION`  | `LAML_APPLICATION`  | yes      | —       | —           |
| `LAML_WEBHOOKS`     | `LAML_WEBHOOKS`     | yes      | —       | —           |
| `RELAY_APPLICATION` | `RELAY_APPLICATION` | yes      | —       | —           |
| `RELAY_CONNECTOR`   | `RELAY_CONNECTOR`   | yes      | —       | —           |
| `RELAY_CONTEXT`     | `RELAY_CONTEXT`     | yes      | —       | —           |
| `RELAY_SCRIPT`      | `RELAY_SCRIPT`      | yes      | —       | —           |
| `RELAY_TOPIC`       | `RELAY_TOPIC`       | yes      | —       | —           |
| `VIDEO_ROOM`        | `VIDEO_ROOM`        | yes      | —       | —           |

## Source

[`/src/signalwire/signalwire/rest/call_handler.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/rest/call_handler.py)

Line 25.
