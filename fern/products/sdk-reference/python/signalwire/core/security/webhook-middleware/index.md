---
slug: "/reference/python/signalwire/core/security/webhook-middleware"
title: "webhook_middleware"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "module"
  language: "python"
  qualified_name: "signalwire.core.security.webhook_middleware"
  parent: "signalwire.core.security"
  module: "signalwire.core.security"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security/webhook_middleware.py"
---
# `webhook_middleware`

FastAPI middleware / dependency for SignalWire webhook signature validation.

Copyright (c) 2025 SignalWire. Licensed under the MIT License.
See LICENSE file in the project root for full license information.

This module ships a small, framework-aware adapter around
:func:`signalwire.core.security.webhook_validator.validate_webhook_signature`.

Why a custom dependency rather than a vanilla `Depends` on `request.body()`?

- We MUST capture the raw bytes BEFORE FastAPI's JSON parser consumes the
  stream — re-serialization changes whitespace and key order, which breaks
  the Scheme A digest. The dependency stashes the raw body on
  `request.state.raw_body` so the downstream handler can re-parse without
  re-reading the stream.
- Reverse-proxy / ngrok deployments need the URL the platform POSTed to,
  which differs from the URL the SDK sees. The dependency honors
  `X-Forwarded-Proto` / `X-Forwarded-Host` when `trust_proxy=True`,
  plus the `SWML_PROXY_URL_BASE` env var, with `request.url` as last
  resort.
- The legacy cXML/Compatibility scheme used the `X-Twilio-Signature`
  header. We accept it as an alias of `X-SignalWire-Signature` so users
  migrating from the legacy SDK can keep their callers unchanged.

Usage::

```
from signalwire.core.security.webhook_middleware import (
    make_webhook_validation_dependency,
)

dep = make_webhook_validation_dependency(signing_key="PSK...")

@app.post("/webhook", dependencies=[Depends(dep)])
async def webhook(request: Request):
    body = request.state.raw_body  # bytes; re-parse if you need JSON
```

## Signature

```python
module webhook_middleware
```

## Examples

```python
from signalwire.core.security.webhook_middleware import (
    make_webhook_validation_dependency,
)

dep = make_webhook_validation_dependency(signing_key="PSK...")

@app.post("/webhook", dependencies=[Depends(dep)])
async def webhook(request: Request):
    body = request.state.raw_body  # bytes; re-parse if you need JSON
```

## Properties

| Name      | Type      | Required | Default | Description |
| --------- | --------- | -------- | ------- | ----------- |
| `__all__` | `__all__` | yes      | —       | —           |

## Constants

| Name                             | Type                             | Required | Default | Description |
| -------------------------------- | -------------------------------- | -------- | ------- | ----------- |
| `SIGNALWIRE_SIGNATURE_HEADER`    | `SIGNALWIRE_SIGNATURE_HEADER`    | yes      | —       | —           |
| `TWILIO_COMPAT_SIGNATURE_HEADER` | `TWILIO_COMPAT_SIGNATURE_HEADER` | yes      | —       | —           |

## Functions

- [`make_webhook_validation_dependency`](/reference/python/signalwire/core/security/webhook-middleware/make-webhook-validation-dependency) — Build a FastAPI dependency that enforces signature validation.

## Source

[`/src/signalwire/signalwire/core/security/webhook_middleware.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security/webhook_middleware.py)
