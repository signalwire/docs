---
slug: "/reference/python/signalwire/core/data-map/data-map/webhook"
title: "webhook"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.data_map.DataMap.webhook"
  parent: "signalwire.core.data_map.DataMap"
  module: "signalwire.core.data_map"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py"
---
# `webhook`

Add a webhook API call

## Signature

```python
webhook(
    method: str,
    url: str,
    headers: Optional[Dict[str, str]] = None,
    form_param: Optional[str] = None,
    input_args_as_params: bool = False,
    require_args: Optional[List[str]] = None
) -> DataMap
```

## Parameters

| Name                   | Type                       | Required | Default | Description                                              |
| ---------------------- | -------------------------- | -------- | ------- | -------------------------------------------------------- |
| `method`               | `str`                      | yes      | —       | HTTP method (GET, POST, PUT, DELETE, etc.)               |
| `url`                  | `str`                      | yes      | —       | API endpoint URL (can include ${variable} substitutions) |
| `headers`              | `Optional[Dict[str, str]]` | no       | `None`  | Optional HTTP headers                                    |
| `form_param`           | `Optional[str]`            | no       | `None`  | Send JSON body as single form parameter with this name   |
| `input_args_as_params` | `bool`                     | no       | `False` | Merge function arguments into params                     |
| `require_args`         | `Optional[List[str]]`      | no       | `None`  | Only execute if these arguments are present              |

## Returns

`DataMap` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/data_map.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py)

Line 204.
