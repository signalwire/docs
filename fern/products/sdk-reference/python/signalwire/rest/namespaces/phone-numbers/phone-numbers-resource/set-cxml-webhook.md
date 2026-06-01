---
slug: "/reference/python/signalwire/rest/namespaces/phone-numbers/phone-numbers-resource/set-cxml-webhook"
title: "set_cxml_webhook"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.rest.namespaces.phone_numbers.PhoneNumbersResource.set_cxml_webhook"
  parent: "signalwire.rest.namespaces.phone_numbers.PhoneNumbersResource"
  module: "signalwire.rest.namespaces.phone_numbers"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/rest/namespaces/phone_numbers.py"
---
# `set_cxml_webhook`

Route inbound calls to a cXML (Twilio-compat / LAML) webhook.

Despite the wire value `laml_webhooks` being plural, this creates
a single `cxml_webhook` Fabric resource. `fallback_url` is used
when the primary URL fails; `status_callback_url` receives call
status updates.

## Signature

```python
set_cxml_webhook(
    resource_id: str,
    url: str,
    fallback_url: Optional[str] = None,
    status_callback_url: Optional[str] = None,
    **extra = {}
) -> dict
```

## Parameters

| Name                  | Type            | Required | Default | Description |
| --------------------- | --------------- | -------- | ------- | ----------- |
| `resource_id`         | `str`           | yes      | —       | —           |
| `url`                 | `str`           | yes      | —       | —           |
| `fallback_url`        | `Optional[str]` | no       | `None`  | —           |
| `status_callback_url` | `Optional[str]` | no       | `None`  | —           |
| `...extra`            | —               | no       | `{}`    | —           |

## Returns

`dict`

## Source

[`/src/signalwire/signalwire/rest/namespaces/phone_numbers.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/rest/namespaces/phone_numbers.py)

Line 60.
