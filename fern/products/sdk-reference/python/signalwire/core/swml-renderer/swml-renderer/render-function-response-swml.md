---
slug: "/reference/python/signalwire/core/swml-renderer/swml-renderer/render-function-response-swml"
title: "render_function_response_swml"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swml_renderer.SwmlRenderer.render_function_response_swml"
  parent: "signalwire.core.swml_renderer.SwmlRenderer"
  module: "signalwire.core.swml_renderer"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_renderer.py"
---
# `render_function_response_swml`

Generate a SWML document for a function response

**Modifiers:** `static`

## Signature

```python
@staticmethod
render_function_response_swml(
    response_text: str,
    service: SWMLService,
    actions: Optional[List[Dict[str, Any]]] = None,
    format: str = 'json'
) -> str
```

## Parameters

| Name            | Type                             | Required | Default  | Description                              |
| --------------- | -------------------------------- | -------- | -------- | ---------------------------------------- |
| `response_text` | `str`                            | yes      | —        | Text response to include in the document |
| `service`       | `SWMLService`                    | yes      | —        | SWMLService instance to use              |
| `actions`       | `Optional[List[Dict[str, Any]]]` | no       | `None`   | Optional list of actions to perform      |
| `format`        | `str`                            | no       | `'json'` | Output format (json or yaml)             |

## Returns

`str` — SWML document as a string

## Source

[`/src/signalwire/signalwire/core/swml_renderer.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_renderer.py)

Line 150.
