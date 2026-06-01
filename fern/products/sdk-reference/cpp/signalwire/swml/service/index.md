---
slug: "/reference/cpp/signalwire/swml/service"
title: "Service"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::swml::Service"
  parent: "signalwire::swml"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp"
  visibility: "public"
---
# `Service`

Base SWML service providing HTTP server, auth, and verb methods. Also hosts SWAIG functions: any Service (sidecar, non-agent verb host) can register tools and serve them on /swaig without subclassing AgentBase.

## Signature

```cpp
class signalwire::swml::Service
```

## Methods

- [`~Service`](/reference/cpp/signalwire/swml/service/service__2)
- [`add_security_headers`](/reference/cpp/signalwire/swml/service/add-security-headers) — Add security headers to response.
- [`add_verb`](/reference/cpp/signalwire/swml/service/add-verb)
- [`ai`](/reference/cpp/signalwire/swml/service/ai)
- [`amazon_bedrock`](/reference/cpp/signalwire/swml/service/amazon-bedrock)
- [`answer`](/reference/cpp/signalwire/swml/service/answer)
- [`auth_password`](/reference/cpp/signalwire/swml/service/auth-password) — Get the password for basic auth.
- [`auth_username`](/reference/cpp/signalwire/swml/service/auth-username) — Get the username for basic auth.
- [`build_tool_registry_json`](/reference/cpp/signalwire/swml/service/build-tool-registry-json) — Build the introspect payload for the registered tools as a JSON string shaped like {"tools":\[\<each tool's SWAIG definition>]}. Iterates tool\_order\_ first, falling back to map order for entries registered only via register\_swaig\_function. Stable across SDKs so the swaig-test --example CLI can parse output uniformly. Used by the SWAIG\_LIST\_TOOLS env-var path; pulled out as a separate helper so tests can assert content without invoking exit().
- [`cond`](/reference/cpp/signalwire/swml/service/cond)
- [`connect`](/reference/cpp/signalwire/swml/service/connect)
- [`define_tool`](/reference/cpp/signalwire/swml/service/define-tool) — Define a SWAIG function the AI can call.
- [`denoise`](/reference/cpp/signalwire/swml/service/denoise)
- [`detect_machine`](/reference/cpp/signalwire/swml/service/detect-machine)
- [`document`](/reference/cpp/signalwire/swml/service/document) — Get the underlying SWML document.
- [`enter_queue`](/reference/cpp/signalwire/swml/service/enter-queue)
- [`execute`](/reference/cpp/signalwire/swml/service/execute)
- [`extract_introspect_payload`](/reference/cpp/signalwire/swml/service/extract-introspect-payload) — Pure-string extractor: slice the JSON payload between **SWAIG\_TOOLS\_BEGIN** and **SWAIG\_TOOLS\_END** sentinels in a captured stdout. Returns empty string if either marker is missing or the order is wrong. Static so the swaig-test CLI / tests can reuse it.
- [`generate_random_hex`](/reference/cpp/signalwire/swml/service/generate-random-hex) — Generate a random hex string of given byte length.
- [`get_all_functions`](/reference/cpp/signalwire/swml/service/get-all-functions) — Snapshot of all registered SWAIG functions keyed by name. Returned by value so subsequent registrations don't mutate the snapshot. Python parity: ToolRegistry.get\_all\_functions.
- [`get_basic_auth_credentials`](/reference/cpp/signalwire/swml/service/get-basic-auth-credentials) — Get (user, password) — Python-canonical name. Python parity: AuthMixin.get\_basic\_auth\_credentials.
- [`get_basic_auth_credentials_with_source`](/reference/cpp/signalwire/swml/service/get-basic-auth-credentials-with-source) — Get (user, password, source) where source is one of "provided", "environment", or "generated". Python parity: AuthMixin.get\_basic\_auth\_credentials(include\_source=True).
- [`get_function`](/reference/cpp/signalwire/swml/service/get-function) — Get a registered SWAIG function definition by name. Returns nullptr when no such function is registered. Python parity: ToolRegistry.get\_function.
- [`goto_section`](/reference/cpp/signalwire/swml/service/goto-section)
- [`handle_swaig_endpoint`](/reference/cpp/signalwire/swml/service/handle-swaig-endpoint) — Handle GET/POST /swaig (lifted from AgentBase).
- [`hangup`](/reference/cpp/signalwire/swml/service/hangup)
- [`has_function`](/reference/cpp/signalwire/swml/service/has-function) — Whether a SWAIG function with the given name is registered. Python parity: ToolRegistry.has\_function.
- [`has_tool`](/reference/cpp/signalwire/swml/service/has-tool)
- [`join_conference`](/reference/cpp/signalwire/swml/service/join-conference)
- [`join_room`](/reference/cpp/signalwire/swml/service/join-room)
- [`label`](/reference/cpp/signalwire/swml/service/label)
- [`list_tool_names`](/reference/cpp/signalwire/swml/service/list-tool-names)
- [`live_transcribe`](/reference/cpp/signalwire/swml/service/live-transcribe)
- [`live_translate`](/reference/cpp/signalwire/swml/service/live-translate)
- [`name`](/reference/cpp/signalwire/swml/service/name)
- [`on_function_call`](/reference/cpp/signalwire/swml/service/on-function-call) — Dispatch a function call to the registered handler. Returns a FunctionResult; if the function isn't registered, returns a FunctionResult with a "Function not found" response.
- [`on_render_swml`](/reference/cpp/signalwire/swml/service/on-render-swml) — Override to customize SWML rendering.
- [`on_request`](/reference/cpp/signalwire/swml/service/on-request) — Customization hook called when SWML is requested. Default delegates to on\_swml\_request and returns its result. Subclasses typically override on\_swml\_request rather than this method. Returns std::nullopt to use the default SWML rendering, or a non-null JSON with modifications to merge into the rendered document. Python parity: WebMixin.on\_request(request\_data, callback\_path). The Python third request argument is FastAPI-specific and intentionally not mirrored on the cross-language API.
- [`on_swml_request`](/reference/cpp/signalwire/swml/service/on-swml-request) — Customization point for subclasses to modify SWML based on request data. Default returns std::nullopt (no modification). Python parity: WebMixin.on\_swml\_request(request\_data, callback\_path).
- [`pay`](/reference/cpp/signalwire/swml/service/pay)
- [`play`](/reference/cpp/signalwire/swml/service/play)
- [`port`](/reference/cpp/signalwire/swml/service/port) — Get the effective port.
- [`prompt`](/reference/cpp/signalwire/swml/service/prompt)
- [`receive_fax`](/reference/cpp/signalwire/swml/service/receive-fax)
- [`record`](/reference/cpp/signalwire/swml/service/record)
- [`record_call`](/reference/cpp/signalwire/swml/service/record-call)
- [`register_additional_routes`](/reference/cpp/signalwire/swml/service/register-additional-routes) — Extension point: register additional HTTP routes. AgentBase uses this to add /post\_prompt, /mcp, etc.
- [`register_swaig_function`](/reference/cpp/signalwire/swml/service/register-swaig-function) — Register a raw SWAIG function definition (e.g. DataMap tools).
- [`remove_function`](/reference/cpp/signalwire/swml/service/remove-function) — Remove a registered SWAIG function. Returns true when the function was found and removed; false when it wasn't registered. Python parity: ToolRegistry.remove\_function.
- [`render_main_swml`](/reference/cpp/signalwire/swml/service/render-main-swml) — Extension point: render the SWML document for the main path or for GET /swaig. Default returns the currently-built Document. AgentBase overrides to emit prompt + AI verb at request time.
- [`render_swml`](/reference/cpp/signalwire/swml/service/render-swml) — Render the SWML document to JSON.
- [`request`](/reference/cpp/signalwire/swml/service/request)
- [`return_section`](/reference/cpp/signalwire/swml/service/return-section)
- [`route`](/reference/cpp/signalwire/swml/service/route)
- [`schema_utils`](/reference/cpp/signalwire/swml/service/schema-utils) — SchemaUtils helper bound to this Service. Mirrors Python's self.schema\_utils instance attribute on SWMLService. Built lazily on first access; the underlying schema is cached so the helper is cheap to build.
- [`send_digits`](/reference/cpp/signalwire/swml/service/send-digits)
- [`send_fax`](/reference/cpp/signalwire/swml/service/send-fax)
- [`send_sms`](/reference/cpp/signalwire/swml/service/send-sms)
- [`serve`](/reference/cpp/signalwire/swml/service/serve) — Start the HTTP server (blocking).
- [`Service`](/reference/cpp/signalwire/swml/service/service)
- [`set`](/reference/cpp/signalwire/swml/service/set)
- [`set_auth`](/reference/cpp/signalwire/swml/service/set-auth) — Set basic auth credentials (auto-generated if not set).
- [`set_host`](/reference/cpp/signalwire/swml/service/set-host) — Set the host to bind to.
- [`set_name`](/reference/cpp/signalwire/swml/service/set-name) — Set the service name (default: "service").
- [`set_port`](/reference/cpp/signalwire/swml/service/set-port) — Set the port to listen on.
- [`set_route`](/reference/cpp/signalwire/swml/service/set-route) — Set the route path for this service (default: "/").
- [`setup_routes`](/reference/cpp/signalwire/swml/service/setup-routes)
- [`sip_refer`](/reference/cpp/signalwire/swml/service/sip-refer)
- [`sleep`](/reference/cpp/signalwire/swml/service/sleep)
- [`stop`](/reference/cpp/signalwire/swml/service/stop) — Stop the HTTP server.
- [`stop_denoise`](/reference/cpp/signalwire/swml/service/stop-denoise)
- [`stop_record_call`](/reference/cpp/signalwire/swml/service/stop-record-call)
- [`stop_tap`](/reference/cpp/signalwire/swml/service/stop-tap)
- [`swaig_pre_dispatch`](/reference/cpp/signalwire/swml/service/swaig-pre-dispatch) — Extension point: invoked between argument parsing and function dispatch on POST /swaig. Returns a target Service\* (defaults to this) and an optional short-circuit JSON. If short\_circuit is non-null, it's returned as the SWAIG response without calling on\_function\_call. AgentBase overrides for token validation.
- [`switch_section`](/reference/cpp/signalwire/swml/service/switch-section)
- [`tap`](/reference/cpp/signalwire/swml/service/tap)
- [`timing_safe_compare`](/reference/cpp/signalwire/swml/service/timing-safe-compare) — Timing-safe string comparison using CRYPTO\_memcmp.
- [`transfer`](/reference/cpp/signalwire/swml/service/transfer)
- [`unset`](/reference/cpp/signalwire/swml/service/unset)
- [`user_event`](/reference/cpp/signalwire/swml/service/user-event)
- [`validate_auth`](/reference/cpp/signalwire/swml/service/validate-auth) — Validate basic auth from a request; returns true if valid.
- [`validate_basic_auth`](/reference/cpp/signalwire/swml/service/validate-basic-auth) — Validate provided basic-auth credentials against the configured ones using a constant-time comparison. Python parity: AuthMixin.validate\_basic\_auth(username, password).

## Source

[`include/signalwire/swml/service.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp)

Line 33.
