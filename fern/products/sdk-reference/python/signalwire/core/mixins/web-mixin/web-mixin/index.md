---
slug: "/reference/python/signalwire/core/mixins/web-mixin/web-mixin"
title: "WebMixin"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.mixins.web_mixin.WebMixin"
  parent: "signalwire.core.mixins.web_mixin"
  module: "signalwire.core.mixins.web_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/web_mixin.py"
---
# `WebMixin`

Mixin class containing all web server and routing-related methods for AgentBase

## Signature

```python
class WebMixin
```

## Methods

- [`as_router`](/reference/python/signalwire/core/mixins/web-mixin/web-mixin/as-router) — Get a FastAPI router for this agent
- [`enable_debug_routes`](/reference/python/signalwire/core/mixins/web-mixin/web-mixin/enable-debug-routes) — Enable debug routes for testing and development
- [`get_app`](/reference/python/signalwire/core/mixins/web-mixin/web-mixin/get-app) — Get the FastAPI application instance for deployment adapters like Lambda/Mangum
- [`manual_set_proxy_url`](/reference/python/signalwire/core/mixins/web-mixin/web-mixin/manual-set-proxy-url) — Manually set the proxy URL base for webhook callbacks
- [`on_request`](/reference/python/signalwire/core/mixins/web-mixin/web-mixin/on-request) — Called when SWML is requested, with request data when available
- [`on_swml_request`](/reference/python/signalwire/core/mixins/web-mixin/web-mixin/on-swml-request) — Customization point for subclasses to modify SWML based on request data
- [`register_routing_callback`](/reference/python/signalwire/core/mixins/web-mixin/web-mixin/register-routing-callback) — Register a callback function that will be called to determine routing based on POST data.
- [`run`](/reference/python/signalwire/core/mixins/web-mixin/web-mixin/run) — Smart run method that automatically detects environment and handles accordingly
- [`serve`](/reference/python/signalwire/core/mixins/web-mixin/web-mixin/serve) — Start a web server for this agent
- [`set_dynamic_config_callback`](/reference/python/signalwire/core/mixins/web-mixin/web-mixin/set-dynamic-config-callback) — Set a callback function for dynamic agent configuration
- [`setup_graceful_shutdown`](/reference/python/signalwire/core/mixins/web-mixin/web-mixin/setup-graceful-shutdown) — Setup signal handlers for graceful shutdown (useful for Kubernetes)

## Source

[`/src/signalwire/signalwire/core/mixins/web_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/web_mixin.py)

Line 36.
