---
slug: "/reference/typescript/agent-base/agent-base"
title: "AgentBase"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "AgentBase.AgentBase"
  parent: "AgentBase"
  module: "AgentBase"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `AgentBase`

Core agent class that composes an HTTP server, prompt management, session handling,
SWAIG tool registry, and 5-phase SWML rendering into a single deployable unit.

A single `AgentBase` is one HTTP-servable voice agent:

- `GET /` returns the SWML call-flow document
- `POST /swaig` dispatches SWAIG function calls to registered tool handlers
- `POST /post_prompt` receives the end-of-call summary and invokes [onSummary](/reference/typescript/agent-base/agent-base/on-summary)

Most user agents either (a) subclass `AgentBase` and override `defineTools()` / `onSummary()`
or (b) use one of the `prefab agents` (e.g. `ReceptionistAgent`).

## Signature

```typescript
class AgentBase extends SWMLService
```

## Inheritance

**Extends:** [SWMLService](/reference/typescript/swml-service)

## Examples

**Example 1**

```typescript
import { AgentBase, FunctionResult } from '@signalwire/sdk';

class WeatherAgent extends AgentBase {
  static override PROMPT_SECTIONS = [
    { title: 'Role', body: 'You are a weather assistant.' },
  ];

  protected override defineTools(): void {
    this.defineTool({
      name: 'get_forecast',
      description: 'Return the forecast for a city.',
      parameters: {
        type: 'object',
        properties: { city: { type: 'string' } },
        required: ['city'],
      },
      handler: async ({ city }) => {
        const forecast = await fetchForecast(city as string);
        return new FunctionResult(forecast);
      },
    });
  }
}

const agent = new WeatherAgent({ name: 'weather', route: '/' });
await agent.serve({ port: 3000 });
```

**Example 2**

```typescript
const agent = new AgentBase({ name: 'hello', route: '/' });
agent.setPromptText('You are a friendly greeter.');
agent.defineTool({
  name: 'say_hi',
  description: 'Respond with a greeting.',
  parameters: { type: 'object', properties: {} },
  handler: () => new FunctionResult('Hello from SignalWire!'),
});
await agent.serve();
```

## See Also

- \- \[FunctionResult]\(/reference/typescript/function-result) — builder for tool handler responses
  \- \[ContextBuilder]\(/reference/typescript/context-builder) — multi-step conversation state machines
  \- \[DataMap]\(/reference/typescript/data-map) — server-side tools without webhooks
  \- \[AgentServer]\(/reference/typescript/agent-server) — host multiple agents on one HTTP server

## Properties

| Name                              | Type                                                                         | Required | Default | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| --------------------------------- | ---------------------------------------------------------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `agentId`                         | `string`                                                                     | yes      | —       | Unique identifier for this agent instance.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| `authCredentials`                 | `[string, string]`                                                           | no       | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `authSource`                      | `"provided" \| "environment" \| "generated"`                                 | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `domain`                          | `string \| undefined`                                                        | yes      | —       | Domain name for SSL. Mirrors Python's `self.domain`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `fullValidationEnabled`           | `get fullValidationEnabled(): boolean`                                       | yes      | —       | Check if full JSON Schema validation is enabled. Mirrors Python's `@property full_validation_enabled`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `host`                            | `string`                                                                     | yes      | —       | Host the server binds to.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `log`                             | `Logger`                                                                     | yes      | —       | Structured logger instance for this agent. Override the inherited SWMLService logger with an AgentBase-tagged one.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `name`                            | `string`                                                                     | yes      | —       | Service display name.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `nativeFunctions`                 | `get/set nativeFunctions: string[]`                                          | yes      | —       | Public accessor for the native functions list. Python exposes `self.native_functions` as a public read/write attribute.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| `onRequestCallback`               | `OnRequestCallback`                                                          | no       | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `pom`                             | `get pom(): PromptObjectModel \| null`                                       | yes      | —       | Public accessor for the agent's POM as a `PromptObjectModel` instance. Python parity: `agent.pom` instance attribute (agent\_base.py line 209) is a `signalwire.pom.pom.PromptObjectModel` when `use_pom=True`, or `None` otherwise. This getter returns the equivalent TypeScript `PromptObjectModel` instance — callers can use `addSection`, `findSection`, `renderMarkdown`, `renderXml`, `toJson`, `toYaml` exactly as in Python. The instance returned is a fresh snapshot built from the current `PomBuilder` state, so mutating it does not feed back into the agent's internal builder. To mutate the agent's prompt, use `promptAddSection` / `promptAddToSection` / `promptAddSubsection`. |
| `port`                            | `number`                                                                     | yes      | —       | Port the server binds to.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `PROMPT_SECTIONS`                 | `{ body?: string; bullets?: string[]; numbered?: boolean; title: string }[]` | no       | —       | Static prompt sections: subclasses can define these declaratively. Each entry is applied via promptAddSection() in the constructor.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `promptManager`                   | `get promptManager(): PromptManager`                                         | yes      | —       | Public accessor for the PromptManager (POM). Python exposes `self.pom` as a public attribute. This getter provides equivalent access for direct POM manipulation.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `route`                           | `string`                                                                     | yes      | —       | HTTP route path.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| `schemaUtils`                     | `SchemaUtils`                                                                | yes      | —       | Schema validation utilities. Mirrors Python's `self.schema_utils`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `security`                        | `SecurityConfig`                                                             | yes      | —       | Unified security configuration. Mirrors Python's `self.security`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `skillManager`                    | `get skillManager(): SkillManager`                                           | yes      | —       | Public read-only accessor for the SkillManager. Python exposes `self.skill_manager` as a public attribute. This getter provides equivalent read access.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| `sslCertPath`                     | `string \| undefined`                                                        | yes      | —       | Path to SSL certificate. Mirrors Python's `self.ssl_cert_path`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `sslEnabled`                      | `boolean`                                                                    | yes      | —       | Whether SSL is enabled. Mirrors Python's `self.ssl_enabled`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| `sslKeyPath`                      | `string \| undefined`                                                        | yes      | —       | Path to SSL private key. Mirrors Python's `self.ssl_key_path`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `SUPPORTED_INTERNAL_FILLER_NAMES` | `ReadonlySet<string>`                                                        | yes      | —       | The complete set of internal SWAIG function names that accept fillers, matching the SWAIGInternalFiller schema definition. Any name outside this set is silently ignored by the runtime — addInternalFiller / setInternalFillers warn if you pass an unknown name.                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `swmlBuilder`                     | `SwmlBuilder`                                                                | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `toolRegistry`                    | `Map<string, Record<string, unknown> \| SwaigFunction>`                      | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `verbRegistry`                    | `VerbHandlerRegistry`                                                        | yes      | —       | Custom verb handler registry. Mirrors Python's `self.verb_registry`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |

## Methods

- [`addAnswerVerb`](/reference/typescript/agent-base/agent-base/add-answer-verb) — Configure the answer verb (phase 2) with optional settings.
- [`addFunctionInclude`](/reference/typescript/agent-base/agent-base/add-function-include) — Add a remote SWAIG function include reference.
- [`addHint`](/reference/typescript/agent-base/agent-base/add-hint) — Add a single speech-recognition hint.
- [`addHints`](/reference/typescript/agent-base/agent-base/add-hints) — Add multiple speech-recognition hints at once.
- [`addInternalFiller`](/reference/typescript/agent-base/agent-base/add-internal-filler) — Add internal filler phrases for a single internal function and language.
- [`addLanguage`](/reference/typescript/agent-base/agent-base/add-language) — Add a supported language to the AI configuration.
- [`addMcpServer`](/reference/typescript/agent-base/agent-base/add-mcp-server) — Add an external MCP server for tool discovery and invocation. Tools are discovered via MCP protocol at session start and added to the AI's tool list.
- [`addPatternHint`](/reference/typescript/agent-base/agent-base/add-pattern-hint) — Add a pattern-based speech-recognition hint with find-and-replace behavior.
- [`addPostAiVerb`](/reference/typescript/agent-base/agent-base/add-post-ai-verb) — Add a SWML verb to execute after the AI verb (phase 5).
- [`addPostAnswerVerb`](/reference/typescript/agent-base/agent-base/add-post-answer-verb) — Add a SWML verb to execute after the answer phase but before the AI verb (phase 3).
- [`addPreAnswerVerb`](/reference/typescript/agent-base/agent-base/add-pre-answer-verb) — Add a SWML verb to execute before the answer phase (phase 1).
- [`addPronunciation`](/reference/typescript/agent-base/agent-base/add-pronunciation) — Add a pronunciation override rule for the TTS engine.
- [`addSection`](/reference/typescript/agent-base/agent-base/add-section) — Add a new named section to the SWML document. Mirrors Python's `add_section()`.
- [`addSkill`](/reference/typescript/agent-base/agent-base/add-skill) — Add a skill to this agent, registering its tools, prompt sections, hints, and global data.
- [`addSkillByName`](/reference/typescript/agent-base/agent-base/add-skill-by-name) — Add a skill by its registered name, looking it up in the global SkillRegistry.
- [`addSwaigQueryParams`](/reference/typescript/agent-base/agent-base/add-swaig-query-params) — Add extra query parameters appended to all SWAIG webhook URLs.
- [`addVerb`](/reference/typescript/agent-base/agent-base/add-verb) — Add a verb to the SWML document.
- [`addVerbToSection`](/reference/typescript/agent-base/agent-base/add-verb-to-section) — Add a verb to a specific named section. Mirrors Python's `add_verb_to_section()`.
- [`asRouter`](/reference/typescript/agent-base/agent-base/as-router) — Return this agent's Hono app for mounting as a sub-router in an AgentServer.
- [`autoMapSipUsernames`](/reference/typescript/agent-base/agent-base/auto-map-sip-usernames) — Automatically register common SIP usernames based on this agent's name and route. Derives cleaned variants (alphanumeric + underscore) and registers each via `registerSipUsername()`.
- [`buildSwmlForRequest`](/reference/typescript/agent-base/agent-base/build-swml-for-request) — Service-side SWML-builder hook. Subclasses return a `SwmlBuilder` to fully replace the document for this request, or `null` to fall through to `setOnRequestCallback` or the static builder.
- [`clearPostAiVerbs`](/reference/typescript/agent-base/agent-base/clear-post-ai-verbs) — Remove all post-AI verbs.
- [`clearPostAnswerVerbs`](/reference/typescript/agent-base/agent-base/clear-post-answer-verbs) — Remove all post-answer verbs.
- [`clearPreAnswerVerbs`](/reference/typescript/agent-base/agent-base/clear-pre-answer-verbs) — Remove all pre-answer verbs.
- [`clearSwaigQueryParams`](/reference/typescript/agent-base/agent-base/clear-swaig-query-params) — Clear all SWAIG query parameters.
- [`constructor`](/reference/typescript/agent-base/agent-base/constructor) — Create a new AgentBase instance.
- [`createToolToken`](/reference/typescript/agent-base/agent-base/create-tool-token) — Mint a per-call SWAIG-function token via the agent's SessionManager.
- [`defineContexts`](/reference/typescript/agent-base/agent-base/define-contexts) — Define or replace the contexts configuration for the AI verb.
- [`defineTool`](/reference/typescript/agent-base/agent-base/define-tool) — Register a SWAIG tool (function) that the AI can invoke during a call.
- [`defineTools`](/reference/typescript/agent-base/agent-base/define-tools) — Lifecycle method to register tools. Subclasses should call this at the end of their own constructor (after all fields are initialized). Not called automatically — call `this.defineTools()` explicitly.
- [`defineTypedTool`](/reference/typescript/agent-base/agent-base/define-typed-tool) — Register a SWAIG tool with a typed handler that receives named parameters instead of the standard `(args, rawData)` convention.
- [`enableDebugEvents`](/reference/typescript/agent-base/agent-base/enable-debug-events) — Enable debug event webhooks for this agent.
- [`enableDebugRoutes`](/reference/typescript/agent-base/agent-base/enable-debug-routes) — Register a callback function that determines routing based on POST data.
- [`enableMcpServer`](/reference/typescript/agent-base/agent-base/enable-mcp-server) — Expose this agent's tools as an MCP server endpoint at /mcp. Adds a JSON-RPC 2.0 endpoint that MCP clients (Claude Desktop, other agents) can connect to.
- [`enableSipRouting`](/reference/typescript/agent-base/agent-base/enable-sip-routing) — Enable SIP routing for this agent.
- [`extractSipUsername`](/reference/typescript/agent-base/agent-base/extract-sip-username) — Extract the SIP username from a request body's call.to field.
- [`getAllFunctions`](/reference/typescript/agent-base/agent-base/get-all-functions) — Snapshot of all registered SWAIG functions keyed by name. (Python parity: `ToolRegistry.get_all_functions`.)
- [`getApp`](/reference/typescript/agent-base/agent-base/get-app) — Get or lazily create the Hono HTTP application with all routes, middleware, auth, and CORS.
- [`getBasicAuthCredentials`](/reference/typescript/agent-base/agent-base/get-basic-auth-credentials) — Get the basic-auth credentials used by this agent.
- [`getBuilder`](/reference/typescript/agent-base/agent-base/get-builder) — Get the underlying SwmlBuilder for direct manipulation.
- [`getContexts`](/reference/typescript/agent-base/agent-base/get-contexts) — Get the contexts dictionary as serialised SWML, or null when no contexts have been defined yet.
- [`getDocument`](/reference/typescript/agent-base/agent-base/get-document) — Get the SWML document as a dictionary. Alias for `renderSwml()` that matches Python's `get_document()` name.
- [`getFullUrl`](/reference/typescript/agent-base/agent-base/get-full-url) — Get the full external URL of this agent, using the proxy base URL if available.
- [`getFunction`](/reference/typescript/agent-base/agent-base/get-function) — Get a registered SWAIG function entry, or undefined. (Python parity: `ToolRegistry.get_function`.)
- [`getLanguageParams`](/reference/typescript/agent-base/agent-base/get-language-params) — Read the per-language `params` dict for a previously-added language.
- [`getMcpServers`](/reference/typescript/agent-base/agent-base/get-mcp-servers) — Get configured MCP servers (read-only copy).
- [`getName`](/reference/typescript/agent-base/agent-base/get-name) — Get the agent's display name.
- [`getPostPrompt`](/reference/typescript/agent-base/agent-base/get-post-prompt) — Get the post-prompt text, if one has been set.
- [`getPrompt`](/reference/typescript/agent-base/agent-base/get-prompt) — Get the fully rendered main prompt text.
- [`getPromptPom`](/reference/typescript/agent-base/agent-base/get-prompt-pom) — Get the raw POM (Prompt Object Model) structure as an array of section data objects, when the agent is in POM mode and has at least one section.
- [`getRawPrompt`](/reference/typescript/agent-base/agent-base/get-raw-prompt) — Get the raw prompt text whatever `setPromptText` stored, or null when no raw prompt has been set.
- [`getRegisteredTools`](/reference/typescript/agent-base/agent-base/get-registered-tools) — Get a summary of all registered tools with their names, descriptions, and parameter schemas. Lifted from AgentBase so the swaig-test CLI can list tools on a non-AgentBase SWMLService target (sidecar / standalone SWAIG host).
- [`getTool`](/reference/typescript/agent-base/agent-base/get-tool) — Look up a registered SwaigFunction by name. Lifted from AgentBase so `swaig-test --exec <name>` works against a non-AgentBase SWMLService target.
- [`getTools`](/reference/typescript/agent-base/agent-base/get-tools) — Public access to the list of registered tools.
- [`handleMcpRequest`](/reference/typescript/agent-base/agent-base/handle-mcp-request) — Handle an MCP JSON-RPC 2.0 request. Returns the response object.
- [`hasFunction`](/reference/typescript/agent-base/agent-base/has-function) — Whether a SWAIG function with the given name is registered. (Python parity: `ToolRegistry.has_function`.)
- [`hasSkill`](/reference/typescript/agent-base/agent-base/has-skill) — Check whether a skill with the given name is registered.
- [`hasTool`](/reference/typescript/agent-base/agent-base/has-tool) — Whether a tool with the given name is registered.
- [`isMcpServerEnabled`](/reference/typescript/agent-base/agent-base/is-mcp-server-enabled) — Check if MCP server endpoint is enabled.
- [`listSkills`](/reference/typescript/agent-base/agent-base/list-skills) — List all registered skills with their names, instance IDs, and initialization status.
- [`listToolNames`](/reference/typescript/agent-base/agent-base/list-tool-names) — List registered tool names in insertion order (Map preserves it).
- [`manualSetProxyUrl`](/reference/typescript/agent-base/agent-base/manual-set-proxy-url) — Manually set the proxy base URL used for webhook URL generation.
- [`onDebugEvent`](/reference/typescript/agent-base/agent-base/on-debug-event) — Lifecycle hook called when a debug event webhook is received. Override in subclasses.
- [`onFunctionCall`](/reference/typescript/agent-base/agent-base/on-function-call) — Hook called before each SWAIG function execution. Override in subclasses.
- [`onRequest`](/reference/typescript/agent-base/agent-base/on-request) — Lifecycle hook called when SWML is requested. Default delegates to [onSwmlRequest](/reference/typescript/agent-base/agent-base/on-swml-request) and returns its result. Subclasses typically override `onSwmlRequest` rather than this method.
- [`onSummary`](/reference/typescript/agent-base/agent-base/on-summary) — Lifecycle hook called when a post-prompt summary is received. Override in subclasses.
- [`onSwmlRequest`](/reference/typescript/agent-base/agent-base/on-swml-request) — Lifecycle hook called on every SWML request before rendering. Override in subclasses.
- [`promptAddSection`](/reference/typescript/agent-base/agent-base/prompt-add-section) — Add a new section to the prompt with optional body, bullets, and subsections.
- [`promptAddSubsection`](/reference/typescript/agent-base/agent-base/prompt-add-subsection) — Add a subsection under an existing prompt section.
- [`promptAddToSection`](/reference/typescript/agent-base/agent-base/prompt-add-to-section) — Append content to an existing prompt section.
- [`promptHasSection`](/reference/typescript/agent-base/agent-base/prompt-has-section) — Check whether a prompt section with the given title exists.
- [`registerAdditionalRoutes`](/reference/typescript/agent-base/agent-base/register-additional-routes) — Extension point: register additional Hono routes after SWMLService mounts /health, /ready, /swaig, and the main route. AgentBase uses this to add /post\_prompt, /check\_for\_input, /debug\_events, /mcp.
- [`registerRoutingCallback`](/reference/typescript/agent-base/agent-base/register-routing-callback) — Register a callback at a specific HTTP path that decides how to route an incoming request.
- [`registerSipUsername`](/reference/typescript/agent-base/agent-base/register-sip-username) — Register a SIP username to route to this agent.
- [`registerSwaigFunction`](/reference/typescript/agent-base/agent-base/register-swaig-function) — Register a SwaigFunction instance or a raw function descriptor (DataMap).
- [`registerVerbHandler`](/reference/typescript/agent-base/agent-base/register-verb-handler) — Register a custom verb handler. Mirrors Python's `register_verb_handler()`.
- [`removeFunction`](/reference/typescript/agent-base/agent-base/remove-function) — Remove a registered SWAIG function. Returns true when removed, false when not found. (Python parity: `ToolRegistry.remove_function`.)
- [`removeSkill`](/reference/typescript/agent-base/agent-base/remove-skill) — Remove a previously added skill by its instance ID.
- [`removeSkillByName`](/reference/typescript/agent-base/agent-base/remove-skill-by-name) — Remove a skill by its name (Python parity).
- [`renderDocument`](/reference/typescript/agent-base/agent-base/render-document) — Render the SWML document as a JSON string. Mirrors Python's `render_document()`.
- [`renderSwml`](/reference/typescript/agent-base/agent-base/render-swml) — Render the complete SWML document by assembling all 5 phases: pre-answer, answer, post-answer, AI, and post-AI verbs.
- [`resetContexts`](/reference/typescript/agent-base/agent-base/reset-contexts) — Remove all contexts, returning the agent to a no-contexts state.
- [`resetDocument`](/reference/typescript/agent-base/agent-base/reset-document) — Reset the SWML document to an empty state. Mirrors Python's `reset_document()`.
- [`run`](/reference/typescript/agent-base/agent-base/run) — Alias for [serve](/reference/typescript/agent-base/agent-base/serve). Starts the HTTP server.
- [`runServerless`](/reference/typescript/agent-base/agent-base/run-serverless) — Handle a single serverless invocation (AWS Lambda, Google Cloud Functions, Azure Functions, or CGI).
- [`serve`](/reference/typescript/agent-base/agent-base/serve) — Start the HTTP server and begin listening for requests.
- [`setDynamicConfigCallback`](/reference/typescript/agent-base/agent-base/set-dynamic-config-callback) — Set a callback invoked on each SWML request to dynamically modify an ephemeral agent copy.
- [`setFunctionIncludes`](/reference/typescript/agent-base/agent-base/set-function-includes) — Replace the entire list of function includes. Each include must have a `url` and `functions` array.
- [`setGlobalData`](/reference/typescript/agent-base/agent-base/set-global-data) — Merge data into the global\_data object passed into the AI configuration.
- [`setInternalFillers`](/reference/typescript/agent-base/agent-base/set-internal-fillers) — Set internal fillers for native SWAIG functions.
- [`setLanguageParams`](/reference/typescript/agent-base/agent-base/set-language-params) — Set (or replace) the per-language `params` dict on an already-added language. Useful when language entries are built up via [addLanguage](/reference/typescript/agent-base/agent-base/add-language) first and engine-specific tuning is added later (e.g., from a config loader).
- [`setLanguages`](/reference/typescript/agent-base/agent-base/set-languages) — Replace all configured languages with a new list.
- [`setNativeFunctions`](/reference/typescript/agent-base/agent-base/set-native-functions) — Set the list of native SWAIG function names (built-in platform functions).
- [`setOnRequestCallback`](/reference/typescript/agent-base/agent-base/set-on-request-callback) — Set a callback invoked per-request to dynamically build SWML. When set, the static SwmlBuilder is ignored and the callback's returned SwmlBuilder is used instead.
- [`setParam`](/reference/typescript/agent-base/agent-base/set-param) — Set a single AI parameter (e.g. "temperature", "top\_p").
- [`setParams`](/reference/typescript/agent-base/agent-base/set-params) — Merge multiple AI parameters into the existing params object.
- [`setPostPrompt`](/reference/typescript/agent-base/agent-base/set-post-prompt) — Set the post-prompt text evaluated after the call ends.
- [`setPostPromptLlmParams`](/reference/typescript/agent-base/agent-base/set-post-prompt-llm-params) — Merge LLM-specific parameters into the post-prompt configuration.
- [`setPostPromptUrl`](/reference/typescript/agent-base/agent-base/set-post-prompt-url) — Override the default post-prompt webhook URL with a custom one.
- [`setPromptLlmParams`](/reference/typescript/agent-base/agent-base/set-prompt-llm-params) — Merge LLM-specific parameters into the main prompt configuration (e.g. model, temperature).
- [`setPromptPom`](/reference/typescript/agent-base/agent-base/set-prompt-pom) — Set the prompt as a POM (Prompt Object Model) dictionary.
- [`setPromptText`](/reference/typescript/agent-base/agent-base/set-prompt-text) — Set the main system prompt text for the AI.
- [`setPronunciations`](/reference/typescript/agent-base/agent-base/set-pronunciations) — Replace all pronunciation rules with a new list.
- [`setupGracefulShutdown`](/reference/typescript/agent-base/agent-base/setup-graceful-shutdown) — Register process signal handlers for clean Kubernetes/Docker shutdown. Handles SIGTERM and SIGINT, waits for a timeout, then exits.
- [`setWebHookUrl`](/reference/typescript/agent-base/agent-base/set-web-hook-url) — Override the default SWAIG webhook URL with a custom one.
- [`stop`](/reference/typescript/agent-base/agent-base/stop) — Stop the HTTP server. Mirrors Python's `stop()`.
- [`swaigPreDispatch`](/reference/typescript/agent-base/agent-base/swaig-pre-dispatch) — Extension point: invoked between argument parsing and function dispatch on POST /swaig. Returns \[target, shortCircuit]: when shortCircuit is non-null, it's returned directly without dispatching. AgentBase may override to add session-token validation or ephemeral dynamic-config.
- [`updateGlobalData`](/reference/typescript/agent-base/agent-base/update-global-data) — Merge additional entries into the existing global\_data object.
- [`validateBasicAuth`](/reference/typescript/agent-base/agent-base/validate-basic-auth) — Override to add custom basic-auth validation logic beyond credential matching.
- [`validateToolToken`](/reference/typescript/agent-base/agent-base/validate-tool-token) — Validate a tool-call token for the given function.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 110.
