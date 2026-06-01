---
slug: "/reference/python/signalwire/core/swml-service/swml-service/get-basic-auth-credentials"
title: "get_basic_auth_credentials"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swml_service.SWMLService.get_basic_auth_credentials"
  parent: "signalwire.core.swml_service.SWMLService"
  module: "signalwire.core.swml_service"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_service.py"
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

`Union[Tuple[str, str], Tuple[str, str, str]]` — (username, password) tuple or (username, password, source) tuple if include\_source is True

## Source

[`/src/signalwire/signalwire/core/swml_service.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_service.py)

Line 1133.
