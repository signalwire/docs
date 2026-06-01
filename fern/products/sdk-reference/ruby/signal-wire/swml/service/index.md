---
slug: "/reference/ruby/signal-wire/swml/service"
title: "Service"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::SWML::Service"
  parent: "SignalWire::SWML"
  module: "SignalWire.SWML"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb"
  visibility: "public"
---
# `Service`

## Signature

```ruby
class Service < Object
```

## Inheritance

**Extends:** `Object`

## Constants

| Name            | Type                                                  | Required | Default | Description                                                             |
| --------------- | ----------------------------------------------------- | -------- | ------- | ----------------------------------------------------------------------- |
| `SWAIG_FN_NAME` | `SWAIG_FN_NAME = /\A[a-zA-Z_][a-zA-Z0-9_]*\z/.freeze` | yes      | —       | Maximum request body size enforced on /swaig and the main route (1 MB). |

## Methods

- [`config_file`](/reference/ruby/signal-wire/swml/service/config-file) — Python parity: - `name`, `route`, `host`, `port` — surface from SWMLService. - `schema_path` — path to the SWML schema file (or nil to use the gem-bundled default). - `config_file` — optional TOML/YAML config file path. - `schema_validation` — boolean flag mirroring Python's `self._schema_validation`. `SWML_SKIP_SCHEMA_VALIDATION=1` env var forces this to false.
- [`define_tool`](/reference/ruby/signal-wire/swml/service/define-tool) — Define a SWAIG function the AI can call. Tool descriptions and parameter descriptions are LLM-facing prompt engineering — see PORTING\_GUIDE for guidance.
- [`define_tools`](/reference/ruby/signal-wire/swml/service/define-tools) — Return an array of all tool definitions (for SWML rendering).
- [`document`](/reference/ruby/signal-wire/swml/service/document) — Expose the underlying document (useful for tests and subclasses).
- [`execute_verb`](/reference/ruby/signal-wire/swml/service/execute-verb) — Execute a SWML verb, adding it to the current document.
- [`get_all_functions`](/reference/ruby/signal-wire/swml/service/get-all-functions) — Snapshot of all registered SWAIG functions keyed by name. (Python parity: ToolRegistry#get\_all\_functions.)
- [`get_basic_auth_credentials`](/reference/ruby/signal-wire/swml/service/get-basic-auth-credentials) — Get the configured basic-auth credentials.
- [`get_basic_auth_credentials_with_source`](/reference/ruby/signal-wire/swml/service/get-basic-auth-credentials-with-source) — Backwards-compat alias for the legacy 3-tuple-only form.
- [`get_full_url`](/reference/ruby/signal-wire/swml/service/get-full-url) — Build the full URL for this service.
- [`get_function`](/reference/ruby/signal-wire/swml/service/get-function) — Get a registered SWAIG function by name, or nil when absent. (Python parity: ToolRegistry#get\_function.)
- [`handle_additional_route`](/reference/ruby/signal-wire/swml/service/handle-additional-route) — Extension point: register additional Rack routes after Service mounts /health, /ready, /swaig, and the main route. AgentBase uses this to add /post\_prompt, /debug\_events, /mcp.
- [`has_function`](/reference/ruby/signal-wire/swml/service/has-function) — Whether a SWAIG function with the given name is registered. (Python parity: ToolRegistry#has\_function.)
- [`host`](/reference/ruby/signal-wire/swml/service/host) — Python parity: - `name`, `route`, `host`, `port` — surface from SWMLService. - `schema_path` — path to the SWML schema file (or nil to use the gem-bundled default). - `config_file` — optional TOML/YAML config file path. - `schema_validation` — boolean flag mirroring Python's `self._schema_validation`. `SWML_SKIP_SCHEMA_VALIDATION=1` env var forces this to false.
- [`initialize`](/reference/ruby/signal-wire/swml/service/initialize)
- [`list_tool_names`](/reference/ruby/signal-wire/swml/service/list-tool-names) — List registered SWAIG tool names in registration order.
- [`method_missing`](/reference/ruby/signal-wire/swml/service/method-missing) — ------------------------------------------------------------------ Verb auto-vivification via method\_missing ------------------------------------------------------------------
- [`name`](/reference/ruby/signal-wire/swml/service/name) — Python parity: - `name`, `route`, `host`, `port` — surface from SWMLService. - `schema_path` — path to the SWML schema file (or nil to use the gem-bundled default). - `config_file` — optional TOML/YAML config file path. - `schema_validation` — boolean flag mirroring Python's `self._schema_validation`. `SWML_SKIP_SCHEMA_VALIDATION=1` env var forces this to false.
- [`on_function_call`](/reference/ruby/signal-wire/swml/service/on-function-call) — Dispatch a function call to the registered handler. Default plain implementation — AgentBase overrides with token validation.
- [`on_request`](/reference/ruby/signal-wire/swml/service/on-request) — Customization hook called when SWML is requested. Default delegates to {#on\_swml\_request} and returns its result. Subclasses typically override +on\_swml\_request+ rather than this method.
- [`on_swml_request`](/reference/ruby/signal-wire/swml/service/on-swml-request) — Customization point for subclasses to modify SWML based on request data. The default returns nil (no modification).
- [`port`](/reference/ruby/signal-wire/swml/service/port) — Python parity: - `name`, `route`, `host`, `port` — surface from SWMLService. - `schema_path` — path to the SWML schema file (or nil to use the gem-bundled default). - `config_file` — optional TOML/YAML config file path. - `schema_validation` — boolean flag mirroring Python's `self._schema_validation`. `SWML_SKIP_SCHEMA_VALIDATION=1` env var forces this to false.
- [`rack_app`](/reference/ruby/signal-wire/swml/service/rack-app) — Returns a Rack-compatible application.
- [`register_routing_callback`](/reference/ruby/signal-wire/swml/service/register-routing-callback) — ------------------------------------------------------------------ Routing callbacks & request handling ------------------------------------------------------------------
- [`register_swaig_function`](/reference/ruby/signal-wire/swml/service/register-swaig-function) — Register a raw SWAIG function definition (e.g. from DataMap#to\_swaig\_function).
- [`remove_function`](/reference/ruby/signal-wire/swml/service/remove-function) — Remove a registered SWAIG function. Returns true on success, false when the function was not registered. (Python parity: ToolRegistry#remove\_function.)
- [`render`](/reference/ruby/signal-wire/swml/service/render) — ------------------------------------------------------------------ Render the current SWML document ------------------------------------------------------------------
- [`render_main_swml`](/reference/ruby/signal-wire/swml/service/render-main-swml) — Extension point: handle GET /swaig (returns the SWML document by default). AgentBase overrides to render with prompts + dynamic config.
- [`render_pretty`](/reference/ruby/signal-wire/swml/service/render-pretty)
- [`respond_to_missing?`](/reference/ruby/signal-wire/swml/service/respond-to-missing)
- [`route`](/reference/ruby/signal-wire/swml/service/route) — Python parity: - `name`, `route`, `host`, `port` — surface from SWMLService. - `schema_path` — path to the SWML schema file (or nil to use the gem-bundled default). - `config_file` — optional TOML/YAML config file path. - `schema_validation` — boolean flag mirroring Python's `self._schema_validation`. `SWML_SKIP_SCHEMA_VALIDATION=1` env var forces this to false.
- [`schema_path`](/reference/ruby/signal-wire/swml/service/schema-path) — Python parity: - `name`, `route`, `host`, `port` — surface from SWMLService. - `schema_path` — path to the SWML schema file (or nil to use the gem-bundled default). - `config_file` — optional TOML/YAML config file path. - `schema_validation` — boolean flag mirroring Python's `self._schema_validation`. `SWML_SKIP_SCHEMA_VALIDATION=1` env var forces this to false.
- [`schema_utils`](/reference/ruby/signal-wire/swml/service/schema-utils) — SchemaUtils helper bound to this Service. Mirrors Python's self.schema\_utils public instance attribute on SWMLService. Built lazily on first access.
- [`schema_validation`](/reference/ruby/signal-wire/swml/service/schema-validation) — Python parity: - `name`, `route`, `host`, `port` — surface from SWMLService. - `schema_path` — path to the SWML schema file (or nil to use the gem-bundled default). - `config_file` — optional TOML/YAML config file path. - `schema_validation` — boolean flag mirroring Python's `self._schema_validation`. `SWML_SKIP_SCHEMA_VALIDATION=1` env var forces this to false.
- [`serve`](/reference/ruby/signal-wire/swml/service/serve) — Start serving (blocking).
- [`stop`](/reference/ruby/signal-wire/swml/service/stop) — Gracefully stop the server.
- [`swaig_pre_dispatch`](/reference/ruby/signal-wire/swml/service/swaig-pre-dispatch) — Extension point: invoked between argument parsing and function dispatch on POST /swaig. Returns \[target, short\_circuit]. If short\_circuit is non-nil, it's returned as the SWAIG response without calling on\_function\_call. AgentBase overrides to add session-token validation and ephemeral dynamic-config copies.
- [`validate_basic_auth`](/reference/ruby/signal-wire/swml/service/validate-basic-auth) — Validate provided basic-auth credentials against the configured ones using a constant-time comparison. Python parity: AuthMixin#validate\_basic\_auth(username, password).

## Classes

- [`SecurityHeadersMiddleware`](/reference/ruby/signal-wire/swml/service/security-headers-middleware) — ------------------------------------------------------------------ Middleware: security headers ------------------------------------------------------------------
- [`TimingSafeBasicAuth`](/reference/ruby/signal-wire/swml/service/timing-safe-basic-auth) — ------------------------------------------------------------------ Middleware: timing-safe Basic-Auth ------------------------------------------------------------------

## Source

[`lib/signalwire/swml/service.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb)

Line 13.
