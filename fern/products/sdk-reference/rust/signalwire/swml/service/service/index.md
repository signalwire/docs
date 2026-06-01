---
slug: "/reference/rust/signalwire/swml/service/service"
title: "Service"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::swml::service::Service"
  parent: "signalwire::swml::service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `Service`

SWML service: holds a document, auth credentials, and handles HTTP requests.

## Signature

```rust
struct Service { /* fields */ }
```

## Methods

- [`add_verb`](/reference/rust/signalwire/swml/service/service/add-verb) — Add a verb to a section, validating against the schema.
- [`basic_auth_credentials`](/reference/rust/signalwire/swml/service/service/basic-auth-credentials)
- [`define_tool`](/reference/rust/signalwire/swml/service/service/define-tool) — Define a SWAIG function the AI can call. Tool descriptions and parameter descriptions are LLM-facing prompt engineering — see PORTING\_GUIDE for guidance.
- [`document`](/reference/rust/signalwire/swml/service/service/document)
- [`document_mut`](/reference/rust/signalwire/swml/service/service/document-mut)
- [`extract_sip_username`](/reference/rust/signalwire/swml/service/service/extract-sip-username) — Extract SIP username from a request body. Validates format: only `[a-zA-Z0-9._-]`, max 64 chars.
- [`get_all_functions`](/reference/rust/signalwire/swml/service/service/get-all-functions) — Snapshot of all registered SWAIG functions keyed by name. Python parity: `ToolRegistry.get_all_functions`.
- [`get_basic_auth_credentials`](/reference/rust/signalwire/swml/service/service/get-basic-auth-credentials) — Get (user, password) — Python-canonical name. Python parity: `AuthMixin.get_basic_auth_credentials`.
- [`get_basic_auth_credentials_with_source`](/reference/rust/signalwire/swml/service/service/get-basic-auth-credentials-with-source) — Get (user, password, source) where source is one of "provided", "environment", or "generated". Python parity: `AuthMixin.get_basic_auth_credentials(include_source=True)`.
- [`get_function`](/reference/rust/signalwire/swml/service/service/get-function) — Get a registered SWAIG function definition by name, or `None` when absent. Python parity: `ToolRegistry.get_function`.
- [`get_proxy_url_base`](/reference/rust/signalwire/swml/service/service/get-proxy-url-base) — Detect or construct the proxy URL base from request headers.
- [`handle_request`](/reference/rust/signalwire/swml/service/service/handle-request) — Handle an HTTP request. Returns (status\_code, headers, body).
- [`has_function`](/reference/rust/signalwire/swml/service/service/has-function) — Whether a SWAIG function with the given name is registered. Python parity: `ToolRegistry.has_function`.
- [`has_tool`](/reference/rust/signalwire/swml/service/service/has-tool) — Whether a tool with the given name is registered.
- [`host`](/reference/rust/signalwire/swml/service/service/host)
- [`list_tool_names`](/reference/rust/signalwire/swml/service/service/list-tool-names) — Registered tool names in insertion order.
- [`name`](/reference/rust/signalwire/swml/service/service/name)
- [`new`](/reference/rust/signalwire/swml/service/service/new)
- [`on_function_call`](/reference/rust/signalwire/swml/service/service/on-function-call) — Dispatch a function call to the registered handler. Returns `None` for unknown functions or registered functions with no local handler (e.g. DataMap tools that execute server-side).
- [`on_request`](/reference/rust/signalwire/swml/service/service/on-request) — Customization hook called when SWML is requested. Default delegates to \[`Service::on_swml_request`] and returns its result. Subclasses (or external callers) typically configure `on_swml_request` via \[`Service::set_on_swml_request_hook`] rather than overriding this method.
- [`on_swml_request`](/reference/rust/signalwire/swml/service/service/on-swml-request) — Customization point for modifying SWML based on request data. If a hook has been registered via \[`Service::set_on_swml_request_hook`] the hook is invoked; otherwise this returns `None` (no modification).
- [`port`](/reference/rust/signalwire/swml/service/service/port)
- [`register_swaig_function`](/reference/rust/signalwire/swml/service/service/register-swaig-function) — Register a raw SWAIG function definition (e.g. DataMap tools that have no local handler).
- [`remove_function`](/reference/rust/signalwire/swml/service/service/remove-function) — Remove a registered SWAIG function. Returns `true` when the function was found and removed; `false` when it wasn't registered. Python parity: `ToolRegistry.remove_function`.
- [`render`](/reference/rust/signalwire/swml/service/service/render)
- [`render_pretty`](/reference/rust/signalwire/swml/service/service/render-pretty)
- [`route`](/reference/rust/signalwire/swml/service/service/route)
- [`run`](/reference/rust/signalwire/swml/service/service/run)
- [`schema_utils`](/reference/rust/signalwire/swml/service/service/schema-utils) — SchemaUtils helper bound to this Service. Mirrors Python's `self.schema_utils` instance attribute on `SWMLService`. Returns a freshly-built helper each call — the underlying schema is `LazyLock`-cached, so this is cheap.
- [`set_on_swml_request_hook`](/reference/rust/signalwire/swml/service/service/set-on-swml-request-hook) — Register a function that customizes the SWML response on a per-request basis. The hook receives the parsed body and the callback path; returning `Some(value)` applies modifications, `None` falls through to the default rendering.
- [`sleep`](/reference/rust/signalwire/swml/service/service/sleep) — Add a `sleep` verb (integer milliseconds) to a section.
- [`tool_definition`](/reference/rust/signalwire/swml/service/service/tool-definition) — Look up a registered tool's full SWAIG definition (the JSON shape returned to the SignalWire platform). Used by audit harnesses that need to inspect the DataMap webhook URL of a registered tool without invoking it.
- [`validate_basic_auth`](/reference/rust/signalwire/swml/service/service/validate-basic-auth) — Validate provided basic-auth credentials against the configured ones. Python parity: `AuthMixin.validate_basic_auth(username, password)`.

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 48.
