---
slug: "/reference/python/signalwire/core/data-map/create-simple-api-tool"
title: "create_simple_api_tool"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.core.data_map.create_simple_api_tool"
  parent: "signalwire.core.data_map"
  module: "signalwire.core.data_map"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py"
---
# `create_simple_api_tool`

Create a simple API tool with minimal configuration

## Signature

```python
create_simple_api_tool(
    name: str,
    url: str,
    response_template: str,
    parameters: Optional[Dict[str, Dict]] = None,
    method: str = 'GET',
    headers: Optional[Dict[str, str]] = None,
    body: Optional[Dict[str, Any]] = None,
    error_keys: Optional[List[str]] = None
) -> DataMap
```

## Parameters

| Name                | Type                        | Required | Default | Description                           |
| ------------------- | --------------------------- | -------- | ------- | ------------------------------------- |
| `name`              | `str`                       | yes      | —       | Function name                         |
| `url`               | `str`                       | yes      | —       | API endpoint URL                      |
| `response_template` | `str`                       | yes      | —       | Template for formatting the response  |
| `parameters`        | `Optional[Dict[str, Dict]]` | no       | `None`  | Optional parameter definitions        |
| `method`            | `str`                       | no       | `'GET'` | HTTP method (default: GET)            |
| `headers`           | `Optional[Dict[str, str]]`  | no       | `None`  | Optional HTTP headers                 |
| `body`              | `Optional[Dict[str, Any]]`  | no       | `None`  | Optional request body (for POST/PUT)  |
| `error_keys`        | `Optional[List[str]]`       | no       | `None`  | Optional list of error indicator keys |

## Returns

`DataMap` — Configured DataMap object

## Source

[`/src/signalwire/signalwire/core/data_map.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py)

Line 439.
