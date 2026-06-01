---
slug: "/reference/python/signalwire/core/security-config/security-config/get-security-headers"
title: "get_security_headers"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.security_config.SecurityConfig.get_security_headers"
  parent: "signalwire.core.security_config.SecurityConfig"
  module: "signalwire.core.security_config"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security_config.py"
---
# `get_security_headers`

Get security headers to add to responses.

## Signature

```python
get_security_headers(is_https: bool = False) -> Dict[str, str]
```

## Parameters

| Name       | Type   | Required | Default | Description                          |
| ---------- | ------ | -------- | ------- | ------------------------------------ |
| `is_https` | `bool` | no       | `False` | Whether the connection is over HTTPS |

## Returns

`Dict[str, str]` — Dictionary of security headers

## Source

[`/src/signalwire/signalwire/core/security_config.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security_config.py)

Line 290.
