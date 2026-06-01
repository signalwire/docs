---
slug: "/reference/python/signalwire/core/mixins/web-mixin/web-mixin/get-app"
title: "get_app"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.web_mixin.WebMixin.get_app"
  parent: "signalwire.core.mixins.web_mixin.WebMixin"
  module: "signalwire.core.mixins.web_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/web_mixin.py"
---
# `get_app`

Get the FastAPI application instance for deployment adapters like Lambda/Mangum

This method ensures the FastAPI app is properly initialized and configured,
then returns it for use with deployment adapters like Mangum for AWS Lambda.

## Signature

```python
get_app()
```

## Returns

The configured FastAPI application instance

## Source

[`/src/signalwire/signalwire/core/mixins/web_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/web_mixin.py)

Line 41.
