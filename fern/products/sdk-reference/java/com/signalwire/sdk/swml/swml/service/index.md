---
slug: "/reference/java/com/signalwire/sdk/swml/swml/service"
title: "Service"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.swml.Service"
  parent: "com.signalwire.sdk.swml"
  module: "com.signalwire.sdk.swml"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java"
  visibility: "public"
---
# `Service`

Base SWML service with an embedded HTTP server, basic auth, security headers,
and explicit methods for all 38 schema-driven verbs.

<p>
 Uses JDK built-in com.sun.net.httpserver.HttpServer with virtual threads.

## Signature

```java
public class Service
```

## Properties

| Name                       | Type                                                                                        | Required | Default | Description |
| -------------------------- | ------------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `authPassword`             | `java.lang.String authPassword`                                                             | yes      | —       | —           |
| `authUser`                 | `java.lang.String authUser`                                                                 | yes      | —       | —           |
| `document`                 | `com.signalwire.sdk.swml.Document document`                                                 | yes      | —       | —           |
| `host`                     | `java.lang.String host`                                                                     | yes      | —       | —           |
| `httpServer`               | `com.sun.net.httpserver.HttpServer httpServer`                                              | yes      | —       | —           |
| `name`                     | `java.lang.String name`                                                                     | yes      | —       | —           |
| `port`                     | `int port`                                                                                  | yes      | —       | —           |
| `registeredSwaigFunctions` | `java.util.List<java.util.Map<java.lang.String,java.lang.Object>> registeredSwaigFunctions` | yes      | —       | —           |
| `route`                    | `java.lang.String route`                                                                    | yes      | —       | —           |
| `schemaUtilsInstance`      | `com.signalwire.sdk.swml.SchemaUtils schemaUtilsInstance`                                   | yes      | —       | —           |
| `tools`                    | `java.util.Map<java.lang.String,com.signalwire.sdk.swaig.ToolDefinition> tools`             | yes      | —       | —           |

## Constants

| Name                | Type                                                                  | Required | Default | Description                                                                                                                                                                                                                                                                                                                          |
| ------------------- | --------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `REQUEST_BODY_ATTR` | `java.lang.String REQUEST_BODY_ATTR = com.signalwire.sdk.requestBody` | yes      | —       | HttpExchange attribute key under which the raw POST body is stashed by `#serve()` when reading it up-front for signature validation. Subclasses (notably `com.signalwire.sdk.agent.AgentBase`) check this attribute in `renderMainSwml` so they can re-use the cached body without re-reading the (already-consumed) request stream. |

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/swml/swml/service/init)
- [`addSecurityHeaders`](/reference/java/com/signalwire/sdk/swml/swml/service/add-security-headers) — Add security headers to every authenticated response.
- [`ai`](/reference/java/com/signalwire/sdk/swml/swml/service/ai)
- [`amazonBedrock`](/reference/java/com/signalwire/sdk/swml/swml/service/amazon-bedrock)
- [`answer`](/reference/java/com/signalwire/sdk/swml/swml/service/answer)
- [`cond`](/reference/java/com/signalwire/sdk/swml/swml/service/cond)
- [`connect`](/reference/java/com/signalwire/sdk/swml/swml/service/connect)
- [`defineTool`](/reference/java/com/signalwire/sdk/swml/swml/service/define-tool) — Define a SWAIG function the AI can call.
- [`defineTools`](/reference/java/com/signalwire/sdk/swml/swml/service/define-tools) — Register multiple tool definitions at once.
- [`denoise`](/reference/java/com/signalwire/sdk/swml/swml/service/denoise)
- [`detectMachine`](/reference/java/com/signalwire/sdk/swml/swml/service/detect-machine)
- [`enterQueue`](/reference/java/com/signalwire/sdk/swml/swml/service/enter-queue)
- [`execute`](/reference/java/com/signalwire/sdk/swml/swml/service/execute)
- [`generatePassword`](/reference/java/com/signalwire/sdk/swml/swml/service/generate-password)
- [`getAllFunctions`](/reference/java/com/signalwire/sdk/swml/swml/service/get-all-functions) — Snapshot of all registered SWAIG functions keyed by name.
- [`getAuthPassword`](/reference/java/com/signalwire/sdk/swml/swml/service/get-auth-password)
- [`getAuthUser`](/reference/java/com/signalwire/sdk/swml/swml/service/get-auth-user)
- [`getBasicAuthCredentials`](/reference/java/com/signalwire/sdk/swml/swml/service/get-basic-auth-credentials) — Get the configured (user, password) pair as a String\[2] tuple.
- [`getBasicAuthCredentialsWithSource`](/reference/java/com/signalwire/sdk/swml/swml/service/get-basic-auth-credentials-with-source) — Get (user, password, source) where source is "provided", "environment", or "generated".
- [`getDocument`](/reference/java/com/signalwire/sdk/swml/swml/service/get-document)
- [`getFunction`](/reference/java/com/signalwire/sdk/swml/swml/service/get-function) — Get a registered SWAIG function by name, or null when absent.
- [`getRegisteredSwaigFunctions`](/reference/java/com/signalwire/sdk/swml/swml/service/get-registered-swaig-functions) — Read-only view of the raw SWAIG function entries registered via `#registerSwaigFunction(java.util.Map)`.
- [`getRegisteredTools`](/reference/java/com/signalwire/sdk/swml/swml/service/get-registered-tools) — Public, read-only view of the registered SWAIG tool registry.
- [`getSchemaUtils`](/reference/java/com/signalwire/sdk/swml/swml/service/get-schema-utils) — SchemaUtils helper bound to this Service.
- [`gotoLabel`](/reference/java/com/signalwire/sdk/swml/swml/service/goto-label)
- [`hangup`](/reference/java/com/signalwire/sdk/swml/swml/service/hangup)
- [`hasFunction`](/reference/java/com/signalwire/sdk/swml/swml/service/has-function) — Whether a SWAIG function with the given name is registered.
- [`joinConference`](/reference/java/com/signalwire/sdk/swml/swml/service/join-conference)
- [`joinRoom`](/reference/java/com/signalwire/sdk/swml/swml/service/join-room)
- [`label`](/reference/java/com/signalwire/sdk/swml/swml/service/label)
- [`listToolNames`](/reference/java/com/signalwire/sdk/swml/swml/service/list-tool-names) — List registered SWAIG tool names in insertion order.
- [`liveTranscribe`](/reference/java/com/signalwire/sdk/swml/swml/service/live-transcribe)
- [`liveTranslate`](/reference/java/com/signalwire/sdk/swml/swml/service/live-translate)
- [`onFunctionCall`](/reference/java/com/signalwire/sdk/swml/swml/service/on-function-call) — Dispatch a function call to the registered handler.
- [`onRequest`](/reference/java/com/signalwire/sdk/swml/swml/service/on-request) — Customization hook called when SWML is requested.
- [`onSwmlRequest`](/reference/java/com/signalwire/sdk/swml/swml/service/on-swml-request) — Customization point for subclasses to modify SWML based on request data.
- [`pay`](/reference/java/com/signalwire/sdk/swml/swml/service/pay)
- [`play`](/reference/java/com/signalwire/sdk/swml/swml/service/play)
- [`prompt`](/reference/java/com/signalwire/sdk/swml/swml/service/prompt)
- [`readBody`](/reference/java/com/signalwire/sdk/swml/swml/service/read-body) — Read request body with size limit.
- [`receiveFax`](/reference/java/com/signalwire/sdk/swml/swml/service/receive-fax)
- [`record`](/reference/java/com/signalwire/sdk/swml/swml/service/record)
- [`recordCall`](/reference/java/com/signalwire/sdk/swml/swml/service/record-call)
- [`registerAdditionalRoutes`](/reference/java/com/signalwire/sdk/swml/swml/service/register-additional-routes) — Extension point: register additional HTTP routes after Service mounts /health, /ready, /swaig and the main route.
- [`registerSwaigFunction`](/reference/java/com/signalwire/sdk/swml/swml/service/register-swaig-function) — Register a raw SWAIG function definition (e.g.
- [`removeFunction`](/reference/java/com/signalwire/sdk/swml/swml/service/remove-function) — Remove a registered SWAIG function.
- [`renderMainSwml`](/reference/java/com/signalwire/sdk/swml/swml/service/render-main-swml) — Extension point: render the SWML document for the main path or for GET /swaig.
- [`request`](/reference/java/com/signalwire/sdk/swml/swml/service/request)
- [`resolvePort`](/reference/java/com/signalwire/sdk/swml/swml/service/resolve-port)
- [`returnVerb`](/reference/java/com/signalwire/sdk/swml/swml/service/return-verb)
- [`sendDigits`](/reference/java/com/signalwire/sdk/swml/swml/service/send-digits)
- [`sendFax`](/reference/java/com/signalwire/sdk/swml/swml/service/send-fax)
- [`sendJson`](/reference/java/com/signalwire/sdk/swml/swml/service/send-json) — Send a JSON response.
- [`sendPayloadTooLarge`](/reference/java/com/signalwire/sdk/swml/swml/service/send-payload-too-large) — Send a 413 Payload Too Large response.
- [`sendSms`](/reference/java/com/signalwire/sdk/swml/swml/service/send-sms)
- [`sendUnauthorized`](/reference/java/com/signalwire/sdk/swml/swml/service/send-unauthorized) — Send a 401 Unauthorized response.
- [`serve`](/reference/java/com/signalwire/sdk/swml/swml/service/serve) — Start the HTTP server with health, ready, /swaig, and main SWML endpoint.
- [`set`](/reference/java/com/signalwire/sdk/swml/swml/service/set)
- [`sipRefer`](/reference/java/com/signalwire/sdk/swml/swml/service/sip-refer)
- [`sleep`](/reference/java/com/signalwire/sdk/swml/swml/service/sleep) — Sleep takes an integer (milliseconds), not a map.
- [`stop`](/reference/java/com/signalwire/sdk/swml/swml/service/stop) — Stop the HTTP server.
- [`stopDenoise`](/reference/java/com/signalwire/sdk/swml/swml/service/stop-denoise)
- [`stopRecordCall`](/reference/java/com/signalwire/sdk/swml/swml/service/stop-record-call)
- [`stopTap`](/reference/java/com/signalwire/sdk/swml/swml/service/stop-tap)
- [`swaigPreDispatch`](/reference/java/com/signalwire/sdk/swml/swml/service/swaig-pre-dispatch) — Extension point: invoked between argument parsing and function dispatch.
- [`switchVerb`](/reference/java/com/signalwire/sdk/swml/swml/service/switch-verb)
- [`tap`](/reference/java/com/signalwire/sdk/swml/swml/service/tap)
- [`transfer`](/reference/java/com/signalwire/sdk/swml/swml/service/transfer)
- [`unset`](/reference/java/com/signalwire/sdk/swml/swml/service/unset)
- [`userEvent`](/reference/java/com/signalwire/sdk/swml/swml/service/user-event)
- [`validateAuth`](/reference/java/com/signalwire/sdk/swml/swml/service/validate-auth) — Timing-safe basic auth validation using MessageDigest.isEqual.
- [`validateBasicAuth`](/reference/java/com/signalwire/sdk/swml/swml/service/validate-basic-auth) — Validate provided basic-auth credentials against the configured ones using a constant-time comparison.
- [`validateSignedWebhook`](/reference/java/com/signalwire/sdk/swml/swml/service/validate-signed-webhook) — Extension hook invoked between raw-body capture and JSON parsing on signed POST routes (`/`, `/swaig`, `/post_prompt`).

## Source

[`src/main/java/com/signalwire/sdk/swml/Service.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swml/Service.java)

Line 31.
