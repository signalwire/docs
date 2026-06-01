---
slug: "/reference/python/signalwire/rest/namespaces/phone-numbers/phone-numbers-resource/set-swml-webhook"
title: "set_swml_webhook"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.rest.namespaces.phone_numbers.PhoneNumbersResource.set_swml_webhook"
  parent: "signalwire.rest.namespaces.phone_numbers.PhoneNumbersResource"
  module: "signalwire.rest.namespaces.phone_numbers"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/rest/namespaces/phone_numbers.py"
---
# `set_swml_webhook`

Route inbound calls to an SWML webhook URL.

Your backend returns an SWML document per call. The server
auto-creates a `swml_webhook` Fabric resource keyed off this URL.

## Signature

```python
set_swml_webhook(resource_id: str, url: str, **extra = {}) -> dict
```

## Parameters

| Name          | Type  | Required | Default | Description |
| ------------- | ----- | -------- | ------- | ----------- |
| `resource_id` | `str` | yes      | —       | —           |
| `url`         | `str` | yes      | —       | —           |
| `...extra`    | —     | no       | `{}`    | —           |

## Returns

`dict`

## Source

[`/src/signalwire/signalwire/rest/namespaces/phone_numbers.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/rest/namespaces/phone_numbers.py)

Line 47.
