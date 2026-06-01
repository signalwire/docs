---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service"
title: "Service"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.Service"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `Service`

Service is the base SWML service that manages documents, HTTP endpoints, and auth. It provides auto-vivified verb methods driven by the SWML schema.

## Signature

```go
type Service struct
```

## Properties

| Name     | Type                     | Required | Default | Description                                                           |
| -------- | ------------------------ | -------- | ------- | --------------------------------------------------------------------- |
| `Domain` | `Domain string`          | yes      | —       | Domain for TLS certificates and URL generation (SWML\_DOMAIN env var) |
| `Host`   | `Host string`            | yes      | —       | —                                                                     |
| `Logger` | `Logger *logging.Logger` | yes      | —       | —                                                                     |
| `Name`   | `Name string`            | yes      | —       | —                                                                     |
| `Port`   | `Port int`               | yes      | —       | —                                                                     |
| `Route`  | `Route string`           | yes      | —       | —                                                                     |

## Methods

- [`AddSection`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/add-section) — AddSection adds a new named section to the SWML document. Returns false if the section already exists. Delegates to Document.AddSection. Mirrors Python's add\_section method which was only on the Document in Go but is on SWMLService in Python.
- [`AI`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/ai) — AI adds the ai verb. AgentBase overrides this with its own AI rendering. promptText and promptPOM are mutually exclusive; providing both is an error. promptText sets a plain-text prompt; promptPOM sets a structured POM prompt. postPrompt and postPromptURL configure post-prompt behavior (optional). swaig supplies SWAIG configuration (optional). extra is a map of additional AI parameters merged into the verb config (optional). Mirrors Python SWMLBuilder.ai(prompt\_text, prompt\_pom, post\_prompt, post\_prompt\_url, swaig, \*\*kwargs).
- [`AmazonBedrock`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/amazon-bedrock) — AmazonBedrock adds the amazon\_bedrock verb.
- [`Answer`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/answer) — Answer adds the answer verb to the document. maxDuration sets the maximum call duration in seconds (optional). codecs sets a comma-separated list of allowed codecs (optional). Mirrors Python SWMLBuilder.answer(max\_duration, codecs).
- [`AsRouter`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/as-router) — AsRouter returns an http.Handler that serves this service's endpoints. Use this to embed the service in a custom HTTP mux or router. Mirrors Python's as\_router() -> APIRouter method on SWMLService.
- [`BuildSwaigListToolsPayload`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/build-swaig-list-tools-payload) — BuildSwaigListToolsPayload returns the JSON payload that --example mode expects between the sentinel markers: {"tools": \[\<definitions>]}. Each element echoes whatever the in-memory ToolDefinition stores (name, description, parameters); we deliberately do not normalize so the CLI can be permissive about field names.
- [`Cond`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/cond) — Cond adds the cond verb (conditional logic).
- [`Connect`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/connect) — Connect adds the connect verb.
- [`DefineTool`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/define-tool) — DefineTool registers a SWAIG function the AI can call. Tool descriptions and parameter descriptions are LLM-facing prompt engineering — see PORTING\_GUIDE for guidance.
- [`Denoise`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/denoise) — Denoise adds the denoise verb.
- [`DetectMachine`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/detect-machine) — DetectMachine adds the detect\_machine verb.
- [`EnterQueue`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/enter-queue) — EnterQueue adds the enter\_queue verb.
- [`Execute`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/execute) — Execute adds the execute verb (run another SWML section).
- [`ExecuteVerb`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/execute-verb) — ExecuteVerb adds any SWML verb to the document, validated against the schema and any registered VerbHandler. This is the core method that all verb convenience methods delegate to. For most verbs, config should be a map\[string]any of verb parameters. For "sleep", config should be an integer (milliseconds).
- [`ExecuteVerbToSection`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/execute-verb-to-section) — ExecuteVerbToSection adds a SWML verb to a named section.
- [`FullValidationEnabled`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/full-validation-enabled) — FullValidationEnabled reports whether schema validation is active. Returns true when a schema was successfully loaded and schemaValidation is on. Mirrors Python's full\_validation\_enabled property.
- [`GetAuthInfo`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/get-auth-info) — GetAuthInfo returns a map describing every configured authentication method. The map mirrors the Python AuthHandler.get\_auth\_info() return value:
- [`GetBasicAuthCredentials`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/get-basic-auth-credentials) — GetBasicAuthCredentials returns the (username, password) for basic auth.
- [`GetBasicAuthCredentialsWithSource`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/get-basic-auth-credentials-with-source) — GetBasicAuthCredentialsWithSource returns (username, password, source) where source is one of "environment", "explicit", or "auto-generated". Mirrors Python's get\_basic\_auth\_credentials(include\_source=True) three-tuple return.
- [`GetDocument`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/get-document) — GetDocument returns the current SWML document.
- [`GetFullURL`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/get-full-url) — GetFullURL returns the full URL for this service including auth.
- [`GetVerbHandler`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/get-verb-handler) — GetVerbHandler returns the registered handler for verbName, or nil if no handler has been registered for that verb. This is the Go equivalent of Python's VerbHandlerRegistry.get\_handler.
- [`Goto`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/goto) — Goto adds the goto verb.
- [`Hangup`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/hangup) — Hangup adds the hangup verb. reason is an optional reason string for the hangup. Mirrors Python SWMLBuilder.hangup(reason).
- [`HasTool`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/has-tool) — HasTool reports whether a tool with the given name has been registered.
- [`HasVerbHandler`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/has-verb-handler) — HasVerbHandler reports whether a custom handler is registered for verbName. This is the Go equivalent of Python's VerbHandlerRegistry.has\_handler.
- [`JoinConference`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/join-conference) — JoinConference adds the join\_conference verb.
- [`JoinRoom`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/join-room) — JoinRoom adds the join\_room verb.
- [`Label`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/label) — Label adds the label verb.
- [`ListToolNames`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/list-tool-names) — ListToolNames returns the registered tool names in insertion order.
- [`LiveTranscribe`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/live-transcribe) — LiveTranscribe adds the live\_transcribe verb.
- [`LiveTranslate`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/live-translate) — LiveTranslate adds the live\_translate verb.
- [`ManualSetProxyUrl`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/manual-set-proxy-url) — ManualSetProxyUrl overrides the proxy URL base used for URL generation. Call this at runtime to set or update the proxy URL (e.g. an ngrok URL). Mirrors Python's manual\_set\_proxy\_url(proxy\_url: str) on SWMLService.
- [`OnFunctionCall`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/on-function-call) — OnFunctionCall dispatches a function call to the registered handler. Default implementation: looks up the tool in the registry and invokes its handler. Subclasses (AgentBase) may override at the type level by providing their own method (Go method dispatch is static — to override in a way that is callable through Service, use the SwaigPreDispatch extension hook to substitute a target).
- [`OnRequest`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/on-request) — OnRequest generates the SWML response for an incoming request. It checks routing callbacks first, then returns the default document.
- [`Pay`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/pay) — Pay adds the pay verb.
- [`Play`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/play) — Play adds the play verb. Exactly one of url or urls must be provided; providing both is an error. volume sets the playback volume (-40 to 40, optional). sayVoice, sayLanguage, sayGender configure text-to-speech (optional). autoAnswer controls whether to auto-answer the call (optional). Mirrors Python SWMLBuilder.play(url, urls, volume, say\_voice, say\_language, say\_gender, auto\_answer).
- [`Prompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/prompt) — Prompt adds the prompt verb.
- [`ReceiveFax`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/receive-fax) — ReceiveFax adds the receive\_fax verb.
- [`Record`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/record) — Record adds the record verb.
- [`RecordCall`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/record-call) — RecordCall adds the record\_call verb.
- [`RegisterAdditionalRoutes`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/register-additional-routes) — RegisterAdditionalRoutes is an extension hook for subclasses (e.g. AgentBase) to mount additional routes (/post\_prompt, /mcp). Default no-op. Composing types call this from their own buildMux equivalent.
- [`RegisterRoutingCallback`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/register-routing-callback) — RegisterRoutingCallback registers a callback for a specific path.
- [`RegisterSwaigFunction`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/register-swaig-function) — RegisterSwaigFunction registers a raw SWAIG function definition (e.g. DataMap tools that have no local handler). The map must contain a "function" key giving the tool name.
- [`RegisterVerbHandler`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/register-verb-handler) — RegisterVerbHandler registers a custom handler for a SWML verb, keyed by the name returned by h.GetVerbName(). A subsequent call with the same verb name replaces the previous handler. This is the Go equivalent of Python's VerbHandlerRegistry.register\_handler.
- [`Render`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/render) — Render returns the SWML document as a JSON string.
- [`RenderMainSwml`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/render-main-swml) — RenderMainSwml is an extension hook invoked for the main route and for GET /swaig. Default returns the currently-built document. AgentBase overrides to render with prompts + dynamic config.
- [`RenderPretty`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/render-pretty) — RenderPretty returns the SWML document as an indented JSON string.
- [`Request`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/request) — Request adds the request verb (HTTP request).
- [`ResetDocument`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/reset-document) — ResetDocument resets the SWML document to empty.
- [`Return`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/return) — Return adds the return verb.
- [`RoutingCallbackPaths`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/routing-callback-paths) — RoutingCallbackPaths returns the paths that have routing callbacks registered. Callers use this to register corresponding HTTP endpoints (mirrors Python web\_mixin.py line 428 which iterates self.\_routing\_callbacks to register callback endpoints on the router). Paths are returned in sorted order for deterministic HTTP registration.
- [`Say`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/say) — Say adds a play verb with a "say:" prefix for text-to-speech. voice, language, and gender configure the TTS voice (optional). volume sets the playback volume (-40 to 40, optional). Mirrors Python SWMLBuilder.say(text, voice, language, gender, volume).
- [`SchemaUtils`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/schema-utils) — SchemaUtils returns the SchemaUtils helper bound to this Service. Mirrors Python's “self.schema\_utils“ instance attribute exposed publicly on signalwire.core.swml\_service.SWMLService.
- [`SendDigits`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/send-digits) — SendDigits adds the send\_digits verb.
- [`SendFax`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/send-fax) — SendFax adds the send\_fax verb.
- [`SendSMS`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/send-sms) — SendSMS adds the send\_sms verb.
- [`Serve`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/serve) — Serve starts the HTTP server. This is a blocking call.
- [`Set`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/set) — Set adds the set verb (set variables).
- [`SIPRefer`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/sip-refer) — SIPRefer adds the sip\_refer verb.
- [`Sleep`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/sleep) — Sleep adds the sleep verb. Duration is in milliseconds.
- [`Stop`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/stop) — Stop gracefully stops the HTTP server.
- [`StopDenoise`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/stop-denoise) — StopDenoise adds the stop\_denoise verb.
- [`StopRecordCall`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/stop-record-call) — StopRecordCall adds the stop\_record\_call verb.
- [`StopTap`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/stop-tap) — StopTap adds the stop\_tap verb.
- [`SwaigPreDispatch`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/swaig-pre-dispatch) — SwaigPreDispatch is an extension hook invoked between argument parsing and function dispatch on POST /swaig. It returns a target Service to dispatch on (defaults to s) and an optional short-circuit response. Subclasses (AgentBase) override to add session-token validation or ephemeral dynamic-config copies.
- [`Switch`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/switch) — Switch adds the switch verb.
- [`Tap`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/tap) — Tap adds the tap verb (media tapping).
- [`TLSEnabled`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/tls-enabled) — TLSEnabled reports whether TLS is configured for this service. Mirrors Python's ssl\_enabled property on SWMLService.
- [`Transfer`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/transfer) — Transfer adds the transfer verb.
- [`Unset`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/unset) — Unset adds the unset verb.
- [`UserEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/user-event) — UserEvent adds the user\_event verb.
- [`VerifyAPIKey`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/verify-api-key) — VerifyAPIKey performs a timing-safe comparison of the supplied key value against the service's configured API key. Returns false when no API key is configured (i.e. WithAPIKey was not called).
- [`VerifyBasicAuth`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/verify-basic-auth) — VerifyBasicAuth performs a timing-safe comparison of the supplied credentials against the service's configured basic auth username and password. Returns true when both username and password match.
- [`VerifyBearerToken`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/verify-bearer-token) — VerifyBearerToken performs a timing-safe comparison of the supplied token against the service's configured bearer token. Returns false when no bearer token is configured (i.e. WithBearerToken was not called).

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 63.
