---
slug: "/reference/typescript/swml-service/swml-service"
title: "SWMLService"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "SWMLService.SWMLService"
  parent: "SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `SWMLService`

HTTP service that serves non-AI SWML documents built from verb methods.

Use `SWMLService` when you need a SignalWire call flow but don't need AI —
plain call routing, IVR-style trees, recording workflows, static playback, etc.
For AI-powered voice agents, use [AgentBase](/reference/typescript/agent-base) instead.

## Signature

```typescript
class SWMLService
```

## Examples

```typescript
import { SWMLService } from '@signalwire/sdk';

const service = new SWMLService({ name: 'greeter', route: '/', port: 3000 });
service.builder
  .answer()
  .play({ url: 'https://cdn.example.com/welcome.mp3' })
  .hangup();

await service.serve();
```

## See Also

- \- \[SwmlBuilder]\(/reference/typescript/swml-builder) — the underlying SWML document builder
  \- \[AgentBase]\(/reference/typescript/agent-base) — AI-powered alternative

## Properties

| Name                    | Type                                                    | Required | Default | Description                                                                                            |
| ----------------------- | ------------------------------------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------ |
| `authCredentials`       | `[string, string]`                                      | no       | —       | —                                                                                                      |
| `authSource`            | `"provided" \| "environment" \| "generated"`            | yes      | —       | —                                                                                                      |
| `domain`                | `string \| undefined`                                   | yes      | —       | Domain name for SSL. Mirrors Python's `self.domain`.                                                   |
| `fullValidationEnabled` | `get fullValidationEnabled(): boolean`                  | yes      | —       | Check if full JSON Schema validation is enabled. Mirrors Python's `@property full_validation_enabled`. |
| `host`                  | `string`                                                | yes      | —       | Host the server binds to.                                                                              |
| `log`                   | `Logger`                                                | yes      | —       | Structured logger, exposed for subclass access. Mirrors Python's public `self.log`.                    |
| `name`                  | `string`                                                | yes      | —       | Service display name.                                                                                  |
| `onRequestCallback`     | `OnRequestCallback`                                     | no       | —       | —                                                                                                      |
| `port`                  | `number`                                                | yes      | —       | Port the server binds to.                                                                              |
| `route`                 | `string`                                                | yes      | —       | HTTP route path.                                                                                       |
| `schemaUtils`           | `SchemaUtils`                                           | yes      | —       | Schema validation utilities. Mirrors Python's `self.schema_utils`.                                     |
| `security`              | `SecurityConfig`                                        | yes      | —       | Unified security configuration. Mirrors Python's `self.security`.                                      |
| `sslCertPath`           | `string \| undefined`                                   | yes      | —       | Path to SSL certificate. Mirrors Python's `self.ssl_cert_path`.                                        |
| `sslEnabled`            | `boolean`                                               | yes      | —       | Whether SSL is enabled. Mirrors Python's `self.ssl_enabled`.                                           |
| `sslKeyPath`            | `string \| undefined`                                   | yes      | —       | Path to SSL private key. Mirrors Python's `self.ssl_key_path`.                                         |
| `swmlBuilder`           | `SwmlBuilder`                                           | yes      | —       | —                                                                                                      |
| `toolRegistry`          | `Map<string, Record<string, unknown> \| SwaigFunction>` | yes      | —       | —                                                                                                      |
| `verbRegistry`          | `VerbHandlerRegistry`                                   | yes      | —       | Custom verb handler registry. Mirrors Python's `self.verb_registry`.                                   |

## Methods

- [`addSection`](/reference/typescript/swml-service/swml-service/add-section) — Add a new named section to the SWML document. Mirrors Python's `add_section()`.
- [`addVerb`](/reference/typescript/swml-service/swml-service/add-verb) — Add a verb to the SWML document.
- [`addVerbToSection`](/reference/typescript/swml-service/swml-service/add-verb-to-section) — Add a verb to a specific named section. Mirrors Python's `add_verb_to_section()`.
- [`asRouter`](/reference/typescript/swml-service/swml-service/as-router) — Alias for `getApp()`. Provided for cross-SDK consistency with Python's `as_router()` method — allows Python callers porting to TypeScript to use the familiar name without changes.
- [`buildSwmlForRequest`](/reference/typescript/swml-service/swml-service/build-swml-for-request) — Service-side SWML-builder hook. Subclasses return a `SwmlBuilder` to fully replace the document for this request, or `null` to fall through to `setOnRequestCallback` or the static builder.
- [`constructor`](/reference/typescript/swml-service/swml-service/constructor)
- [`defineTool`](/reference/typescript/swml-service/swml-service/define-tool) — Define a SWAIG function the AI can call. Tool descriptions and parameter descriptions are LLM-facing prompt engineering — see PORTING\_GUIDE for guidance on writing them.
- [`extractSipUsername`](/reference/typescript/swml-service/swml-service/extract-sip-username) — Extract the SIP username from a request body's call.to field. Mirrors Python's `@staticmethod extract_sip_username()`.
- [`getAllFunctions`](/reference/typescript/swml-service/swml-service/get-all-functions) — Snapshot of all registered SWAIG functions keyed by name. (Python parity: `ToolRegistry.get_all_functions`.)
- [`getApp`](/reference/typescript/swml-service/swml-service/get-app) — Get the Hono application for mounting or testing. This is the TypeScript equivalent of Python's `as_router()`, which returns a FastAPI `APIRouter`. Both expose the underlying app/router so callers can mount it into a larger framework. Use `asRouter()` when porting Python code that calls `as_router()` directly.
- [`getBasicAuthCredentials`](/reference/typescript/swml-service/swml-service/get-basic-auth-credentials) — Get the basic-auth credentials used by this service. Mirrors Python's `get_basic_auth_credentials()`.
- [`getBuilder`](/reference/typescript/swml-service/swml-service/get-builder) — Get the underlying SwmlBuilder for direct manipulation.
- [`getDocument`](/reference/typescript/swml-service/swml-service/get-document) — Get the SWML document as a dictionary. Alias for `renderSwml()` that matches Python's `get_document()` name.
- [`getFunction`](/reference/typescript/swml-service/swml-service/get-function) — Get a registered SWAIG function entry, or undefined. (Python parity: `ToolRegistry.get_function`.)
- [`getRegisteredTools`](/reference/typescript/swml-service/swml-service/get-registered-tools) — Get a summary of all registered tools with their names, descriptions, and parameter schemas. Lifted from AgentBase so the swaig-test CLI can list tools on a non-AgentBase SWMLService target (sidecar / standalone SWAIG host).
- [`getTool`](/reference/typescript/swml-service/swml-service/get-tool) — Look up a registered SwaigFunction by name. Lifted from AgentBase so `swaig-test --exec <name>` works against a non-AgentBase SWMLService target.
- [`hasFunction`](/reference/typescript/swml-service/swml-service/has-function) — Whether a SWAIG function with the given name is registered. (Python parity: `ToolRegistry.has_function`.)
- [`hasTool`](/reference/typescript/swml-service/swml-service/has-tool) — Whether a tool with the given name is registered.
- [`listToolNames`](/reference/typescript/swml-service/swml-service/list-tool-names) — List registered tool names in insertion order (Map preserves it).
- [`manualSetProxyUrl`](/reference/typescript/swml-service/swml-service/manual-set-proxy-url) — Manually set the proxy base URL used for webhook URL generation. Mirrors Python's `manual_set_proxy_url()`.
- [`onFunctionCall`](/reference/typescript/swml-service/swml-service/on-function-call) — Dispatch a function call to the registered handler. Returns null when the function isn't registered or has no handler. Subclasses (AgentBase) override to add session-token validation and FunctionResult-shape normalization. Return type is wide enough to accommodate the agent override (which may also return void shapes for fire-and-forget tool calls).
- [`registerAdditionalRoutes`](/reference/typescript/swml-service/swml-service/register-additional-routes) — Extension point: register additional Hono routes after SWMLService mounts /health, /ready, /swaig, and the main route. AgentBase uses this to add /post\_prompt, /check\_for\_input, /debug\_events, /mcp.
- [`registerRoutingCallback`](/reference/typescript/swml-service/swml-service/register-routing-callback) — Register a routing callback at a given path. When a POST request arrives at `path`, the callback is invoked with the parsed request body. If it returns a string, the response is a 307 redirect to that route; if it returns null, normal SWML serving continues. Mirrors Python's `register_routing_callback()`.
- [`registerSwaigFunction`](/reference/typescript/swml-service/swml-service/register-swaig-function) — Register a SwaigFunction instance or a raw function descriptor (DataMap).
- [`registerVerbHandler`](/reference/typescript/swml-service/swml-service/register-verb-handler) — Register a custom verb handler. Mirrors Python's `register_verb_handler()`.
- [`removeFunction`](/reference/typescript/swml-service/swml-service/remove-function) — Remove a registered SWAIG function. Returns true when removed, false when not found. (Python parity: `ToolRegistry.remove_function`.)
- [`renderDocument`](/reference/typescript/swml-service/swml-service/render-document) — Render the SWML document as a JSON string. Mirrors Python's `render_document()`.
- [`renderSwml`](/reference/typescript/swml-service/swml-service/render-swml) — Render the SWML document.
- [`resetDocument`](/reference/typescript/swml-service/swml-service/reset-document) — Reset the SWML document to an empty state. Mirrors Python's `reset_document()`.
- [`run`](/reference/typescript/swml-service/swml-service/run) — Start the HTTP server.
- [`serve`](/reference/typescript/swml-service/swml-service/serve) — Start the HTTP server. Alias for [run](/reference/typescript/swml-service/swml-service/run) provided for cross-SDK consistency with Python's `serve()` method — callers porting from Python can use this name without changes.
- [`setOnRequestCallback`](/reference/typescript/swml-service/swml-service/set-on-request-callback) — Set a callback invoked per-request to dynamically build SWML. When set, the static SwmlBuilder is ignored and the callback's returned SwmlBuilder is used instead.
- [`stop`](/reference/typescript/swml-service/swml-service/stop) — Stop the HTTP server. Mirrors Python's `stop()`.
- [`swaigPreDispatch`](/reference/typescript/swml-service/swml-service/swaig-pre-dispatch) — Extension point: invoked between argument parsing and function dispatch on POST /swaig. Returns \[target, shortCircuit]: when shortCircuit is non-null, it's returned directly without dispatching. AgentBase may override to add session-token validation or ephemeral dynamic-config.
- [`validateBasicAuth`](/reference/typescript/swml-service/swml-service/validate-basic-auth) — Validate provided basic-auth credentials against the configured ones using a constant-time comparison. (Python parity: `AuthMixin.validate_basic_auth(username, password)`.)

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 202.
