---
slug: "/reference/python/signalwire/core/mixins/web-mixin/web-mixin/register-routing-callback"
title: "register_routing_callback"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.web_mixin.WebMixin.register_routing_callback"
  parent: "signalwire.core.mixins.web_mixin.WebMixin"
  module: "signalwire.core.mixins.web_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/web_mixin.py"
---
# `register_routing_callback`

Register a callback function that will be called to determine routing
based on POST data.

When a routing callback is registered, an endpoint at the specified path is automatically
created that will handle requests. This endpoint will use the callback to
determine if the request should be processed by this service or redirected.

The callback should take a request object and request body dictionary and return:

- A route string if it should be routed to a different endpoint
- None if normal processing should continue

## Signature

```python
register_routing_callback(
    callback_fn: Callable[Request, Dict[str, Any], Optional[str]],
    path: str = '/sip'
) -> None
```

## Parameters

| Name          | Type                                               | Required | Default  | Description                                                         |
| ------------- | -------------------------------------------------- | -------- | -------- | ------------------------------------------------------------------- |
| `callback_fn` | `Callable[Request, Dict[str, Any], Optional[str]]` | yes      | —        | The callback function to register                                   |
| `path`        | `str`                                              | no       | `'/sip'` | The path where this callback should be registered (default: "/sip") |

## Returns

`None`

## Source

[`/src/signalwire/signalwire/core/mixins/web_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/web_mixin.py)

Line 1131.
