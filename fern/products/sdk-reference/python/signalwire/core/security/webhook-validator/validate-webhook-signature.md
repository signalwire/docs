---
slug: "/reference/python/signalwire/core/security/webhook-validator/validate-webhook-signature"
title: "validate_webhook_signature"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.core.security.webhook_validator.validate_webhook_signature"
  parent: "signalwire.core.security.webhook_validator"
  module: "signalwire.core.security.webhook_validator"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security/webhook_validator.py"
---
# `validate_webhook_signature`

Validate a SignalWire webhook signature against both schemes.

## Signature

```python
validate_webhook_signature(
    signing_key: str,
    signature: str,
    url: str,
    raw_body: str
) -> bool
```

## Parameters

| Name          | Type  | Required | Default | Description                                                                                                                                                                       |
| ------------- | ----- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `signing_key` | `str` | yes      | —       | Customer's Signing Key from the Dashboard. UTF-8 string, secret. `None` / empty raises `ValueError` — that's a programming error, not a validation failure.                       |
| `signature`   | `str` | yes      | —       | The `X-SignalWire-Signature` header value (or `X-Twilio-Signature` for cXML compat). Missing / empty returns False without raising.                                               |
| `url`         | `str` | yes      | —       | The full URL SignalWire POSTed to (scheme, host, optional port, path, query). Must match what the platform saw — see the `URL reconstruction` section of porting-sdk/webhooks.md. |
| `raw_body`    | `str` | yes      | —       | The raw request body bytes as a UTF-8 string, BEFORE any JSON / form parsing. Must be a `str` — passing a parsed dict raises `TypeError`.                                         |

## Returns

`bool` — True if the signature matches either Scheme A (hex JSON) or Scheme B (base64 form, with port-normalization variants and optional bodySHA256 fallback). False otherwise.

## Throws

- `ValueError` — when `signing_key` is missing.
- `TypeError` — when `raw_body` is not a string.

## Source

[`/src/signalwire/signalwire/core/security/webhook_validator.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security/webhook_validator.py)

Line 198.
