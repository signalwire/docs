---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml"
title: "swml"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
---
# `swml`

Package swml provides the SWML (SignalWire Markup Language) document model, builder, and rendering for the SignalWire AI platform.

SWML documents define call flows, AI agent behavior, and telephony operations. The SignalWire platform fetches SWML from agents and executes it.

Package swml — URL validation utility to prevent SSRF attacks. Ported from signalwire/utils/url\_validator.py.

## Signature

```go
package swml
```

## Constants

| Name                      | Type                                    | Required | Default | Description |
| ------------------------- | --------------------------------------- | -------- | ------- | ----------- |
| `ModeAzureFunction`       | `ModeAzureFunction ExecutionMode`       | yes      | —       | —           |
| `ModeCGI`                 | `ModeCGI ExecutionMode`                 | yes      | —       | —           |
| `ModeGoogleCloudFunction` | `ModeGoogleCloudFunction ExecutionMode` | yes      | —       | —           |
| `ModeLambda`              | `ModeLambda ExecutionMode`              | yes      | —       | —           |
| `ModeServer`              | `ModeServer ExecutionMode`              | yes      | —       | —           |

## Functions

- [`ExtractSIPUsername`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/extract-sip-username) — ExtractSIPUsername extracts a SIP username from a request body.
- [`GetExecutionMode`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/get-execution-mode) — GetExecutionMode inspects the process environment and returns the detected runtime mode. The detection order matches the Python and TypeScript SDKs so that the same env vars resolve to the same mode across languages.
- [`GetSchema`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/get-schema) — GetSchema returns the global singleton Schema loaded from the embedded schema.json.
- [`IsServerlessMode`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/is-serverless-mode) — IsServerlessMode reports whether the process is running in any serverless environment (i.e. NOT in plain long-running server mode).
- [`LoadSchemaFromFile`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/load-schema-from-file) — LoadSchemaFromFile loads a SWML schema from the given file path instead of the embedded schema.json. Mirrors Python's schema\_path constructor param.
- [`NewAIVerbHandler`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/new-ai-verb-handler) — NewAIVerbHandler returns a new AIVerbHandler ready for registration.
- [`NewDocument`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/new-document) — NewDocument creates a new empty SWML document with default version.
- [`NewSchemaUtils`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/new-schema-utils) — NewSchemaUtils constructs a SchemaUtils. Mirrors Python's “SchemaUtils(schema\_path, schema\_validation=True)“.
- [`NewSchemaValidationError`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/new-schema-validation-error) — NewSchemaValidationError constructs a SchemaValidationError. Mirrors Python's SchemaValidationError.**init**(verb\_name, errors).
- [`NewService`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/new-service) — NewService creates a new SWML service with the given options.
- [`ValidateURL`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/validate-url) — ValidateURL reports whether rawURL is safe to fetch (i.e. does not point to a private or internal resource). It returns an error describing why the URL was rejected, or nil if the URL is acceptable.
- [`WithAPIKey`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-api-key) — WithAPIKey configures API key authentication. When set, the withSecurity middleware accepts requests where the header named by header equals key. header is the HTTP header name (e.g. "X-API-Key"); pass an empty string to use the default "X-API-Key". Mirrors Python's SecurityConfig.api\_key / api\_key\_header fields and the AuthHandler verify\_api\_key / flask\_decorator behaviour.
- [`WithBasicAuth`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-basic-auth) — WithBasicAuth sets explicit basic auth credentials.
- [`WithBearerToken`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-bearer-token) — WithBearerToken configures Bearer token authentication. When set, the withSecurity middleware accepts requests carrying an "Authorization: Bearer \<token>" header that matches token in addition to (or instead of) Basic Auth. Mirrors Python's SecurityConfig.bearer\_token field and the AuthHandler verify\_bearer\_token / flask\_decorator behaviour.
- [`WithConfigFile`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-config-file) — WithConfigFile loads a YAML configuration file and applies its `security` section to the Service. Mirrors Python's SecurityConfig(config\_file=...) loader (signalwire/core/security\_config.py \_load\_config\_file). The expected schema is:
- [`WithDomain`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-domain) — WithDomain sets the domain name used in URL generation when TLS is enabled. Mirrors Python's SecurityConfig.domain / SWML\_DOMAIN env var.
- [`WithHost`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-host) — WithHost sets the HTTP server bind host.
- [`WithName`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-name) — WithName sets the service name.
- [`WithPort`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-port) — WithPort sets the HTTP server port.
- [`WithRoute`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-route) — WithRoute sets the HTTP route path.
- [`WithSchemaPath`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-schema-path) — WithSchemaPath overrides the schema file path used for verb validation. By default the embedded schema.json is used. Pass a custom path when testing or when deploying a modified schema alongside your binary. Mirrors Python's schema\_path constructor parameter.
- [`WithSchemaValidation`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-schema-validation) — WithSchemaValidation enables or disables SWML schema validation. Defaults to true (validation on). Set to false, or export SWML\_SKIP\_SCHEMA\_VALIDATION=1, to bypass schema checks. Mirrors Python's schema\_validation constructor parameter.
- [`WithSecurityConfig`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-security-config) — WithSecurityConfig applies a SecurityConfig bundle, setting Basic Auth, Bearer token, and API key configuration in one call. This is the Go equivalent of Python's AuthHandler(security\_config=...) pattern: it maps each SecurityConfig field to the corresponding WithXxx option.
- [`WithTLS`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/with-tls) — WithTLS configures TLS for the service. When set, Serve() calls ListenAndServeTLS instead of ListenAndServe. Mirrors Python's ssl\_cert / ssl\_key serve() parameters and ssl\_enabled property.

## Type Aliases

- [`ExecutionMode`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/execution-mode) — ExecutionMode identifies the runtime environment the service is executing in. The value is used to adjust URL construction, request parsing, and auth handling for platforms that do not provide a traditional TCP listener.
- [`RoutingCallback`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/routing-callback) — RoutingCallback is a function called on incoming requests to customize responses. It receives the request and request body, and returns an optional SWML JSON override. If it returns nil, the default document is used.
- [`ServiceOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service-option) — ServiceOption is a functional option for configuring a Service.
- [`ToolHandler`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/tool-handler) — ToolHandler is the function signature for a registered SWAIG tool. Returns a result that will be JSON-encoded as the SWAIG response.
- [`Verb`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/verb) — Verb represents a single SWML verb (instruction) as a key-value pair. Example: {"play": {"url": "https://example.com/audio.mp3"}}

## Classes

- [`AIVerbHandler`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/ai-verb-handler) — AIVerbHandler is a concrete VerbHandler for the SWML "ai" verb.
- [`Document`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/document) — Document represents a complete SWML document with version and sections.
- [`Schema`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema) — Schema holds the parsed SWML schema and provides verb metadata.
- [`SchemaUtils`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-utils) — SchemaUtils is the Go port of signalwire.utils.schema\_utils.SchemaUtils.
- [`SchemaValidationError`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/schema-validation-error) — SchemaValidationError is the canonical error type raised when SWML schema validation fails. Mirrors Python's SchemaValidationError.
- [`SecurityConfig`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/security-config) — SecurityConfig bundles configuration for all supported authentication methods: HTTP Basic Auth, Bearer token, and API key. Pass it to WithSecurityConfig to configure multiple auth methods in one call.
- [`Service`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service) — Service is the base SWML service that manages documents, HTTP endpoints, and auth. It provides auto-vivified verb methods driven by the SWML schema.
- [`ToolDefinition`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/tool-definition) — ToolDefinition is a SWAIG tool registered on the Service.
- [`ValidationResult`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/validation-result) — ValidationResult mirrors Python's “Tuple\[bool, List\[str]]“ return shape used by ValidateVerb / ValidateDocument.
- [`VerbInfo`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/verb-info) — VerbInfo holds metadata about a SWML verb extracted from the schema.

## Interfaces

- [`VerbHandler`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/verb-handler) — VerbHandler defines the contract for specialized SWML verb handlers.
