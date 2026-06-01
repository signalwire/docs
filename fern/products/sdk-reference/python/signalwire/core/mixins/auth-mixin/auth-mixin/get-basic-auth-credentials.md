---
slug: "/reference/python/signalwire/core/mixins/auth-mixin/auth-mixin/get-basic-auth-credentials"
title: "get_basic_auth_credentials"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.auth_mixin.AuthMixin.get_basic_auth_credentials"
  parent: "signalwire.core.mixins.auth_mixin.AuthMixin"
  module: "signalwire.core.mixins.auth_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/auth_mixin.py"
---
# `get_basic_auth_credentials`

Get the basic auth credentials

## Signature

```python
get_basic_auth_credentials(
    include_source: bool = False
) -> Union[Tuple[str, str], Tuple[str, str, str]]
```

## Parameters

| Name             | Type   | Required | Default | Description                                      |
| ---------------- | ------ | -------- | ------- | ------------------------------------------------ |
| `include_source` | `bool` | no       | `False` | Whether to include the source of the credentials |

## Returns

`Union[Tuple[str, str], Tuple[str, str, str]]` — If include\_source is False: (username, password) tuple If include\_source is True: (username, password, source) tuple, where source is one of: "provided", "environment", or "generated"

## Source

[`/src/signalwire/signalwire/core/mixins/auth_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/auth_mixin.py)

Line 42.
