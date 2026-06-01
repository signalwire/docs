---
slug: "/reference/python/signalwire/core/swml-service/swml-service"
title: "SWMLService"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.swml_service.SWMLService"
  parent: "signalwire.core.swml_service"
  module: "signalwire.core.swml_service"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_service.py"
---
# `SWMLService`

Base class for creating and serving SWML documents.

This class provides core functionality for:

- Loading and validating SWML schema
- Creating SWML documents
- Setting up web endpoints for serving SWML
- Managing authentication
- Registering SWML functions

It serves as the foundation for more specialized services like AgentBase.

## Signature

```python
class SWMLService(ToolMixin)
```

## Inheritance

**Extends:** [ToolMixin](/reference/python/signalwire/core/mixins/tool-mixin/tool-mixin)

## Properties

| Name                      | Type            | Required | Default | Description                                      |
| ------------------------- | --------------- | -------- | ------- | ------------------------------------------------ |
| `domain`                  | `domain`        | yes      | —       | —                                                |
| `full_validation_enabled` | `bool`          | yes      | —       | Check if full JSON Schema validation is enabled. |
| `host`                    | `host`          | yes      | —       | —                                                |
| `log`                     | `log`           | yes      | —       | —                                                |
| `name`                    | `name`          | yes      | —       | —                                                |
| `port`                    | `port`          | yes      | —       | —                                                |
| `route`                   | `route`         | yes      | —       | —                                                |
| `schema_utils`            | `schema_utils`  | yes      | —       | —                                                |
| `security`                | `security`      | yes      | —       | —                                                |
| `ssl_cert_path`           | `ssl_cert_path` | yes      | —       | —                                                |
| `ssl_enabled`             | `ssl_enabled`   | yes      | —       | —                                                |
| `ssl_key_path`            | `ssl_key_path`  | yes      | —       | —                                                |
| `verb_registry`           | `verb_registry` | yes      | —       | —                                                |

## Methods

- [`__getattr__`](/reference/python/signalwire/core/swml-service/swml-service/getattr) — Dynamically generate and return SWML verb methods when accessed
- [`__init__`](/reference/python/signalwire/core/swml-service/swml-service/init) — Initialize a new SWML service
- [`add_section`](/reference/python/signalwire/core/swml-service/swml-service/add-section) — Add a new section to the document
- [`add_verb`](/reference/python/signalwire/core/swml-service/swml-service/add-verb) — Add a verb to the main section of the current document
- [`add_verb_to_section`](/reference/python/signalwire/core/swml-service/swml-service/add-verb-to-section) — Add a verb to a specific section
- [`as_router`](/reference/python/signalwire/core/swml-service/swml-service/as-router) — Create a FastAPI router for this service
- [`extract_sip_username`](/reference/python/signalwire/core/swml-service/swml-service/extract-sip-username) — Extract SIP username from request body
- [`get_basic_auth_credentials`](/reference/python/signalwire/core/swml-service/swml-service/get-basic-auth-credentials) — Get the basic auth credentials
- [`get_document`](/reference/python/signalwire/core/swml-service/swml-service/get-document) — Get the current SWML document
- [`manual_set_proxy_url`](/reference/python/signalwire/core/swml-service/swml-service/manual-set-proxy-url) — Manually set the proxy URL base for webhook callbacks
- [`on_request`](/reference/python/signalwire/core/swml-service/swml-service/on-request) — Called when SWML is requested, with request data when available
- [`register_routing_callback`](/reference/python/signalwire/core/swml-service/swml-service/register-routing-callback) — Register a callback function that will be called to determine routing based on POST data.
- [`register_verb_handler`](/reference/python/signalwire/core/swml-service/swml-service/register-verb-handler) — Register a custom verb handler
- [`render_document`](/reference/python/signalwire/core/swml-service/swml-service/render-document) — Render the current SWML document as a JSON string
- [`reset_document`](/reference/python/signalwire/core/swml-service/swml-service/reset-document) — Reset the current document to an empty state
- [`serve`](/reference/python/signalwire/core/swml-service/swml-service/serve) — Start a web server for this service
- [`stop`](/reference/python/signalwire/core/swml-service/swml-service/stop) — Stop the web server

## Source

[`/src/signalwire/signalwire/core/swml_service.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_service.py)

Line 56.
