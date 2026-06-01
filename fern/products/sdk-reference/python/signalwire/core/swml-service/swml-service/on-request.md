---
slug: "/reference/python/signalwire/core/swml-service/swml-service/on-request"
title: "on_request"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swml_service.SWMLService.on_request"
  parent: "signalwire.core.swml_service.SWMLService"
  module: "signalwire.core.swml_service"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_service.py"
---
# `on_request`

Called when SWML is requested, with request data when available

Subclasses can override this to inspect or modify SWML based on the request

## Signature

```python
on_request(
    request_data: Optional[dict] = None,
    callback_path: Optional[str] = None
) -> Optional[dict]
```

## Parameters

| Name            | Type             | Required | Default | Description                                         |
| --------------- | ---------------- | -------- | ------- | --------------------------------------------------- |
| `request_data`  | `Optional[dict]` | no       | `None`  | Optional dictionary containing the parsed POST body |
| `callback_path` | `Optional[str]`  | no       | `None`  | Optional callback path                              |

## Returns

`Optional[dict]` — Optional dict to modify/augment the SWML document

## Source

[`/src/signalwire/signalwire/core/swml_service.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_service.py)

Line 941.
