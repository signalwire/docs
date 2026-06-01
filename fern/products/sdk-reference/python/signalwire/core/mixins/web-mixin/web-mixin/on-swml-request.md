---
slug: "/reference/python/signalwire/core/mixins/web-mixin/web-mixin/on-swml-request"
title: "on_swml_request"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.web_mixin.WebMixin.on_swml_request"
  parent: "signalwire.core.mixins.web_mixin.WebMixin"
  module: "signalwire.core.mixins.web_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/web_mixin.py"
---
# `on_swml_request`

Customization point for subclasses to modify SWML based on request data

## Signature

```python
on_swml_request(
    request_data: Optional[dict] = None,
    callback_path: Optional[str] = None,
    request: Optional[Request] = None
) -> Optional[dict]
```

## Parameters

| Name            | Type                | Required | Default | Description                                                               |
| --------------- | ------------------- | -------- | ------- | ------------------------------------------------------------------------- |
| `request_data`  | `Optional[dict]`    | no       | `None`  | Optional dictionary containing the parsed POST body                       |
| `callback_path` | `Optional[str]`     | no       | `None`  | Optional callback path                                                    |
| `request`       | `Optional[Request]` | no       | `None`  | Optional FastAPI Request object for accessing query params, headers, etc. |

## Returns

`Optional[dict]` — Optional dict with modifications to apply to the SWML document

## Source

[`/src/signalwire/signalwire/core/mixins/web_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/web_mixin.py)

Line 1100.
