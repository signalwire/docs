---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base"
title: "AgentBase"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  parent: "github.com/signalwire/signalwire-go/pkg/agent"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `AgentBase`

AgentBase is the central agent struct. It embeds \*swml.Service so that Service's fields and methods (Name, Route, Host, Port, basic auth, the HTTP server, the tool registry, etc.) are promoted onto AgentBase. The agent-specific state below is layered on top.

## Signature

```go
type AgentBase struct
```

## Properties

| Name      | Type                     | Required | Default | Description                                                                                                                                     |
| --------- | ------------------------ | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `AgentID` | `AgentID string`         | yes      | —       | Agent identity — matches Python: self.agent\_id = agent\_id or str(uuid.uuid4()) Exported so callers can read the assigned ID without a getter. |
| `Logger`  | `Logger *logging.Logger` | yes      | —       | —                                                                                                                                               |
| `Service` | `*swml.Service`          | yes      | —       | —                                                                                                                                               |

## Methods

- [`AddAnswerVerb`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-answer-verb) — AddAnswerVerb configures the answer verb. Merged with defaults at render time.
- [`AddFunctionInclude`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-function-include) — AddFunctionInclude adds a remote SWAIG function include.
- [`AddHint`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-hint) — AddHint adds a single speech-recognition hint.
- [`AddHints`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-hints) — AddHints adds multiple speech-recognition hints.
- [`AddInternalFiller`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-internal-filler) — AddInternalFiller adds fillers for a specific function and language.
- [`AddLanguage`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-language) — AddLanguage adds a language configuration as a raw map.
- [`AddLanguageTyped`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-language-typed) — AddLanguageTyped adds a language configuration using typed named parameters, matching the Python SDK's add\_language method signature exactly.
- [`AddMcpServer`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-mcp-server) — AddMcpServer adds an external MCP server for tool discovery and invocation. Tools are discovered via the MCP protocol at session start and registered as SWAIG functions. Returns self for method chaining.
- [`AddPatternHint`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-pattern-hint) — AddPatternHint adds a pattern-based speech-recognition hint with regex replacement semantics.
- [`AddPostAiVerb`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-post-ai-verb) — AddPostAiVerb adds a SWML verb to execute after the AI verb.
- [`AddPostAnswerVerb`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-post-answer-verb) — AddPostAnswerVerb adds a SWML verb to execute after the answer.
- [`AddPreAnswerVerb`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-pre-answer-verb) — AddPreAnswerVerb adds a SWML verb to execute before the answer.
- [`AddPronunciation`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-pronunciation) — AddPronunciation adds a pronunciation override rule.
- [`AddSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-skill) — AddSkill loads a skill by name with optional params and registers its tools.
- [`AddSwaigQueryParams`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-swaig-query-params) — AddSwaigQueryParams adds query parameters that will be appended to SWAIG webhook URLs.
- [`AsRouter`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/as-router) — AsRouter returns an http.Handler for embedding in a custom server.
- [`AutoMapSipUsernames`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/auto-map-sip-usernames) — AutoMapSipUsernames automatically registers common SIP usernames derived from this agent's name and route.
- [`ClearPostAiVerbs`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/clear-post-ai-verbs) — ClearPostAiVerbs removes all post-AI verbs.
- [`ClearPostAnswerVerbs`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/clear-post-answer-verbs) — ClearPostAnswerVerbs removes all post-answer verbs.
- [`ClearPreAnswerVerbs`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/clear-pre-answer-verbs) — ClearPreAnswerVerbs removes all pre-answer verbs.
- [`ClearSwaigQueryParams`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/clear-swaig-query-params) — ClearSwaigQueryParams removes all SWAIG query parameters.
- [`Contexts`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/contexts) — Contexts is an alias for DefineContexts.
- [`CreateToolToken`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/create-tool-token) — CreateToolToken mints a per-call SWAIG-function token via the agent's SessionManager. Returns an empty string when minting fails (Python parity: state\_mixin.StateMixin.\_create\_tool\_token, which catches all exceptions and returns "" on error).
- [`DefineContexts`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/define-contexts) — DefineContexts returns the context builder, creating it if needed. The builder is attached to this agent so Validate() can check user-defined tool names against reserved native tool names (next\_step, change\_context, gather\_submit).
- [`DefineTool`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/define-tool) — DefineTool registers a tool (SWAIG function) with the agent.
- [`DefineTools`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/define-tools) — DefineTools returns all registered tool definitions in insertion order.
- [`EnableDebugEvents`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/enable-debug-events) — EnableDebugEvents sets the debug events level (0 = off).
- [`EnableDebugRoutes`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/enable-debug-routes) — EnableDebugRoutes is a placeholder for adding debug HTTP routes.
- [`EnableMcpServer`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/enable-mcp-server) — EnableMcpServer exposes this agent's tools as an MCP server endpoint at /mcp. The endpoint speaks JSON-RPC 2.0 (MCP protocol) and supports initialize, tools/list, tools/call, and ping. Returns self for method chaining.
- [`EnableSipRouting`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/enable-sip-routing) — EnableSipRouting enables SIP-based routing for this agent.
- [`GetAllFunctions`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/get-all-functions) — GetAllFunctions returns a snapshot of all registered SWAIG functions keyed by name. The returned map is a copy — subsequent registrations do not mutate it. (Python parity: “ToolRegistry.get\_all\_functions“.)
- [`GetBasicAuthCredentials`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/get-basic-auth-credentials) — GetBasicAuthCredentials returns the (username, password) configured for this agent's HTTP basic auth.
- [`GetBasicAuthCredentialsWithSource`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/get-basic-auth-credentials-with-source) — GetBasicAuthCredentialsWithSource returns the basic-auth credentials plus a string indicating their SOURCE — one of "provided", "environment", or "generated". Mirrors Python's “auth\_mixin.AuthMixin.get\_basic\_auth\_credentials(include\_source=True)“ (auth\_mixin.py line 42-73).
- [`GetContexts`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/get-contexts) — GetContexts returns the contexts as a serialised map (the same shape SWML expects), or nil when no contexts have been defined yet. This mirrors Python's “PromptManager.get\_contexts“ which returns the contexts dict or “None“.
- [`GetFullURL`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/get-full-url) — GetFullURL returns the full URL for this agent's endpoint, optionally embedding basic-auth credentials.
- [`GetFunction`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/get-function) — GetFunction returns the registered tool definition for the given name, or nil when no such function is registered. (Python parity: “ToolRegistry.get\_function“.)
- [`GetLanguageParams`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/get-language-params) — GetLanguageParams reads the per-language params dict for a previously-added language.
- [`GetName`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/get-name) — GetName returns the agent's name.
- [`GetPostPrompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/get-post-prompt) — GetPostPrompt returns the current post-prompt text. Returns an empty string if no post-prompt has been set.
- [`GetPrompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/get-prompt) — GetPrompt returns the current prompt. If POM mode is active, it returns \[]map\[string]any; otherwise it returns the raw string.
- [`GetRawPrompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/get-raw-prompt) — GetRawPrompt returns the raw prompt text whatever “SetPromptText“ stored, regardless of POM mode. Returns an empty string when no raw prompt has been set.
- [`GetRoute`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/get-route) — GetRoute returns the agent's configured route path.
- [`HasFunction`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/has-function) — HasFunction reports whether a SWAIG function with the given name is registered. (Python parity: “ToolRegistry.has\_function“.)
- [`HasSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/has-skill) — HasSkill returns whether a skill is loaded.
- [`ListSkills`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/list-skills) — ListSkills returns the names of loaded skills.
- [`ListToolNames`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/list-tool-names) — ListToolNames returns the names of every registered SWAIG tool in insertion order. Implements contexts.ToolLister.
- [`ManualSetProxyUrl`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/manual-set-proxy-url) — ManualSetProxyUrl overrides the proxy URL base used for webhook URL generation.
- [`OnDebugEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/on-debug-event) — OnDebugEvent registers a callback for debug events.
- [`OnFunctionCall`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/on-function-call) — OnFunctionCall dispatches a SWAIG function call to the registered handler.
- [`OnRequest`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/on-request) — OnRequest is called on every SWML request before rendering. Subclasses can override this method to inspect or transform the request data. It delegates to OnSwmlRequest.
- [`OnSummary`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/on-summary) — OnSummary registers a callback for post-prompt summaries.
- [`OnSwmlRequest`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/on-swml-request) — OnSwmlRequest is the primary customization point for the user to modify the SWML document based on request data. If a hook has been registered via SetOnSwmlRequestHook the hook is invoked; otherwise this returns nil (no modification).
- [`Pom`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/pom) — Pom returns a typed PromptObjectModel built from the agent's current POM sections. Returns nil when use\_pom is false (Python parity: “self.pom“ is “None“ when “use\_pom=False“). The returned value is a deep copy / fresh build — mutations don't affect the agent's internal state.
- [`PromptAddSection`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/prompt-add-section) — PromptAddSection appends a new section to the POM prompt.
- [`PromptAddSubsection`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/prompt-add-subsection) — PromptAddSubsection adds a subsection under an existing parent section.
- [`PromptAddToSection`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/prompt-add-to-section) — PromptAddToSection finds an existing POM section by title and appends text and/or bullets. If the section does not exist, it is a no-op.
- [`PromptHasSection`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/prompt-has-section) — PromptHasSection returns true if a POM section with the given title exists.
- [`RegisterRoutingCallback`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/register-routing-callback) — RegisterRoutingCallback registers a callback function that is invoked for incoming requests at the given path to determine routing.
- [`RegisterSipRoutingCallback`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/register-sip-routing-callback) — RegisterSipRoutingCallback registers a callback whose string return value triggers an HTTP 307 Temporary Redirect to that route. An empty return value (or a GET / non-POST request) lets normal SWML processing continue.
- [`RegisterSipUsername`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/register-sip-username) — RegisterSipUsername registers a SIP username that this agent handles.
- [`RegisterSwaigFunction`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/register-swaig-function) — RegisterSwaigFunction registers a raw SWAIG function definition (e.g. for DataMap tools that don't have a Go handler).
- [`RemoveFunction`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/remove-function) — RemoveFunction removes a registered SWAIG function. Returns true when the function was found and removed; false when it wasn't registered. (Python parity: “ToolRegistry.remove\_function“.)
- [`RemoveSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/remove-skill) — RemoveSkill unloads a skill by name.
- [`RenderSWML`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/render-swml) — RenderSWML builds the complete SWML document for a request.
- [`ResetContexts`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/reset-contexts) — ResetContexts removes all contexts, returning the agent to a no-contexts state. This is a convenience wrapper around DefineContexts().Reset(). Use it in a dynamic config callback when you need to rebuild contexts from scratch for a specific request.
- [`Run`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/run) — Run starts the HTTP server for the agent. This is a blocking call.
- [`Serve`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/serve) — Serve is an alias for Run.
- [`SetDynamicConfigCallback`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-dynamic-config-callback) — SetDynamicConfigCallback sets a callback invoked on each request to allow per-request agent customisation.
- [`SetFunctionIncludes`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-function-includes) — SetFunctionIncludes replaces all function includes.
- [`SetGlobalData`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-global-data) — SetGlobalData replaces all global data.
- [`SetInternalFillers`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-internal-fillers) — SetInternalFillers replaces all internal fillers.
- [`SetLanguageParams`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-language-params) — SetLanguageParams sets (or replaces) the per-language params dict on an already-added language. Useful when language entries are built up via AddLanguage/AddLanguageTyped first and engine-specific tuning is added later (e.g., from a config loader).
- [`SetLanguages`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-languages) — SetLanguages replaces all language configurations.
- [`SetNativeFunctions`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-native-functions) — SetNativeFunctions sets the list of native function names.
- [`SetOnSwmlRequestHook`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-on-swml-request-hook) — SetOnSwmlRequestHook registers a function that customizes the SWML response on a per-request basis. The hook receives the parsed body, the callback path (for routing-callback dispatch), and the raw \*http.Request for header / query inspection. Returning a non-nil map applies modifications to the rendered SWML; returning nil falls through to the default rendering.
- [`SetParam`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-param) — SetParam sets a single AI parameter (e.g. temperature, top\_p).
- [`SetParams`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-params) — SetParams replaces all AI parameters.
- [`SetPostPrompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-post-prompt) — SetPostPrompt sets the post-prompt text used for conversation summary.
- [`SetPostPromptLlmParams`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-post-prompt-llm-params) — SetPostPromptLlmParams sets LLM parameters for the post-prompt.
- [`SetPostPromptUrl`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-post-prompt-url) — SetPostPromptUrl sets the URL for post-prompt summary delivery.
- [`SetPromptLlmParams`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-prompt-llm-params) — SetPromptLlmParams sets LLM parameters for the main prompt.
- [`SetPromptPom`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-prompt-pom) — SetPromptPom sets the POM sections directly and enables POM mode.
- [`SetPromptText`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-prompt-text) — SetPromptText sets the agent prompt to raw text, disabling POM mode.
- [`SetPromptTransformer`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-prompt-transformer) — SetPromptTransformer installs a hook that is called with the assembled prompt map before it is placed into the AI verb config. The function may return a new map or mutate and return the same map. Set to nil to remove a previously installed transformer.
- [`SetPronunciations`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-pronunciations) — SetPronunciations replaces all pronunciation overrides.
- [`SetupGracefulShutdown`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/setup-graceful-shutdown) — SetupGracefulShutdown registers OS signal handlers for SIGTERM and SIGINT that initiate a graceful HTTP server shutdown. This is useful for Kubernetes deployments where the pod receives SIGTERM before termination.
- [`SetWebHookUrl`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-web-hook-url) — SetWebHookUrl explicitly sets the webhook URL used in SWAIG function defs.
- [`UpdateGlobalData`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/update-global-data) — UpdateGlobalData merges data into existing global data.
- [`ValidateBasicAuth`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/validate-basic-auth) — ValidateBasicAuth validates the provided username and password against the agent's configured basic auth credentials using a constant-time comparison.
- [`ValidateToolToken`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/validate-tool-token) — ValidateToolToken verifies that a SWAIG tool security token is authentic, unexpired, and matches the given function name and call ID. Returns false when the function is not registered, the SessionManager rejects the token, or the validation panics for any reason.

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 322.
