---
slug: "/reference/php/signal-wire/swml/swml/service"
title: "Service"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\SWML\\Service"
  parent: "SignalWire\\SWML"
  module: "SignalWire.SWML"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWML/Service.php"
---
# `Service`

## Signature

```php
class Service
```

## Methods

- [`__call`](/reference/php/signal-wire/swml/swml/service/call) — Dynamic verb methods from schema.
- [`__construct`](/reference/php/signal-wire/swml/swml/service/construct)
- [`defineTool`](/reference/php/signal-wire/swml/swml/service/define-tool) — Define a SWAIG function the AI can call.
- [`defineTools`](/reference/php/signal-wire/swml/swml/service/define-tools) — Register multiple tool definitions at once.
- [`dispatchFromGlobals`](/reference/php/signal-wire/swml/swml/service/dispatch-from-globals) — Dispatch the current PHP request (cli-server / php-fpm / mod\_php) to
- [`extractSipUsername`](/reference/php/signal-wire/swml/swml/service/extract-sip-username) — Extract SIP username from a request body.
- [`getAllFunctions`](/reference/php/signal-wire/swml/swml/service/get-all-functions) — Snapshot of all registered SWAIG functions keyed by name.
- [`getBasicAuthCredentials`](/reference/php/signal-wire/swml/swml/service/get-basic-auth-credentials)
- [`getBasicAuthCredentialsWithSource`](/reference/php/signal-wire/swml/swml/service/get-basic-auth-credentials-with-source) — Get (user, password, source) where source is "provided",
- [`getDocument`](/reference/php/signal-wire/swml/swml/service/get-document)
- [`getFullUrl`](/reference/php/signal-wire/swml/swml/service/get-full-url) — Build the full URL for this service.
- [`getFunction`](/reference/php/signal-wire/swml/swml/service/get-function) — Get a registered SWAIG function by name, or null when absent.
- [`getHost`](/reference/php/signal-wire/swml/swml/service/get-host)
- [`getName`](/reference/php/signal-wire/swml/swml/service/get-name)
- [`getPort`](/reference/php/signal-wire/swml/swml/service/get-port)
- [`getProxyUrlBase`](/reference/php/signal-wire/swml/swml/service/get-proxy-url-base) — Detect or construct the proxy URL base from request headers.
- [`getRoute`](/reference/php/signal-wire/swml/swml/service/get-route)
- [`getSchemaUtils`](/reference/php/signal-wire/swml/swml/service/get-schema-utils) — SchemaUtils helper bound to this Service. Mirrors Python's
- [`getToolNames`](/reference/php/signal-wire/swml/swml/service/get-tool-names) — Return the names of registered tools in the order they were
- [`getTools`](/reference/php/signal-wire/swml/swml/service/get-tools) — Return the registered SWAIG tool definitions.
- [`handleRequest`](/reference/php/signal-wire/swml/swml/service/handle-request) — Handle an HTTP request. Returns \[status, headers, body].
- [`hasFunction`](/reference/php/signal-wire/swml/swml/service/has-function) — Whether a SWAIG function with the given name is registered.
- [`onFunctionCall`](/reference/php/signal-wire/swml/swml/service/on-function-call) — Dispatch a function call to the registered handler.
- [`onRequest`](/reference/php/signal-wire/swml/swml/service/on-request) — Customization hook called when SWML is requested. Default
- [`onSwmlRequest`](/reference/php/signal-wire/swml/swml/service/on-swml-request) — Customization point for subclasses to modify SWML based on
- [`registerRoutingCallback`](/reference/php/signal-wire/swml/swml/service/register-routing-callback)
- [`registerSwaigFunction`](/reference/php/signal-wire/swml/swml/service/register-swaig-function) — Register a raw SWAIG function definition (e.g. DataMap tools).
- [`removeFunction`](/reference/php/signal-wire/swml/swml/service/remove-function) — Remove a registered SWAIG function. True on success, false if absent.
- [`render`](/reference/php/signal-wire/swml/swml/service/render)
- [`renderPretty`](/reference/php/signal-wire/swml/swml/service/render-pretty)
- [`renderSwml`](/reference/php/signal-wire/swml/swml/service/render-swml) — Render SWML for a request. Subclasses override this.
- [`run`](/reference/php/signal-wire/swml/swml/service/run) — Run the service (alias for serve).
- [`serve`](/reference/php/signal-wire/swml/swml/service/serve) — Start serving using PHP's built-in server (blocking).
- [`validateBasicAuth`](/reference/php/signal-wire/swml/swml/service/validate-basic-auth) — Validate provided basic-auth credentials against the configured ones

## Source

[`/src/src/SignalWire/SWML/Service.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWML/Service.php)

Line 11.
