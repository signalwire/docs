---
slug: "/reference/java/com/signalwire/sdk/agent/agent/agent-base"
title: "AgentBase"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.agent.AgentBase"
  parent: "com.signalwire.sdk.agent"
  module: "com.signalwire.sdk.agent"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java"
  visibility: "public"
---
# `AgentBase`

Base class for all SignalWire AI agents.

Composes prompt management, tool registration, AI config, HTTP serving,
skills integration, and SWML rendering.

Use the builder pattern:

 <pre>
 var agent = AgentBase.builder()
     .name("my-agent")
     .route("/")
     .port(3000)
     .build();
 </pre>

## Signature

```java
public class AgentBase extends com.signalwire.sdk.swml.Service
```

## Inheritance

**Extends:** [com.signalwire.sdk.swml.Service](/reference/java/com/signalwire/sdk/swml/swml/service)

## Constants

| Name                              | Type                                                              | Required | Default | Description                                                                                                                                                                                                                                                                                                                                                                                                                                |
| --------------------------------- | ----------------------------------------------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `SUPPORTED_INTERNAL_FILLER_NAMES` | `java.util.Set<java.lang.String> SUPPORTED_INTERNAL_FILLER_NAMES` | yes      | —       | The complete set of internal SWAIG function names that accept fillers, matching the SWAIGInternalFiller schema definition.  \<p>Any name outside this set is silently ignored by the runtime \u2014 \`#setInternalFillersMap(java.util.Map)\` and String, java.util.List) warn if you pass an unknown name.  \<p>Notable absences: \`change\_step\`, \`gather\_submit\`, or arbitrary user-defined SWAIG function names are NOT supported. |

## Methods

- [`addAnswerVerb`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-answer-verb)
- [`addFunctionInclude`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-function-include)
- [`addHint`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-hint)
- [`addHints`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-hints)
- [`addInternalFiller`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-internal-filler) — Add internal fillers for a single internal function and language.
- [`addLanguage`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-language) — Add a language configuration with an optional per-language `params` dict (engine-specific tuning, voice settings, etc.).
- [`addMcpServer`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-mcp-server) — Add an external MCP server for tool discovery and invocation.
- [`addPatternHint`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-pattern-hint)
- [`addPostAiVerb`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-post-ai-verb)
- [`addPostAnswerVerb`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-post-answer-verb)
- [`addPreAnswerVerb`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-pre-answer-verb)
- [`addPronunciation`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-pronunciation)
- [`addSkill`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-skill)
- [`addSwaigQueryParams`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/add-swaig-query-params)
- [`builder`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder)
- [`buildMcpToolList`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/build-mcp-tool-list) — Build MCP tool list from registered tools.
- [`clearPostAiVerbs`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/clear-post-ai-verbs)
- [`clearPostAnswerVerbs`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/clear-post-answer-verbs)
- [`clearPreAnswerVerbs`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/clear-pre-answer-verbs)
- [`clearSwaigQueryParams`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/clear-swaig-query-params)
- [`clone`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/clone) — Create a deep copy of this agent for per-request customization.
- [`contexts`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/contexts)
- [`createToolToken`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/create-tool-token) — Mint a per-call SWAIG-function token via the agent's SessionManager.
- [`defineContexts`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/define-contexts) — Define or return the ContextBuilder for this agent.
- [`defineTool`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/define-tool) — Register a SWAIG tool (function) that the AI can invoke during a call.
- [`defineTools`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/define-tools)
- [`detectServerlessBaseUrl`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/detect-serverless-base-url) — Resolve a base URL from environment variables alone (proxy or serverless platform).
- [`enableDebugEvents`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/enable-debug-events)
- [`enableDebugRoutes`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/enable-debug-routes)
- [`enableMcpServer`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/enable-mcp-server) — Expose this agent's tools as an MCP server endpoint at /mcp.
- [`enableSipRouting`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/enable-sip-routing)
- [`extractSipUsername`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/extract-sip-username) — Extract the username portion from a SIP URI.
- [`getAuthPassword`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-auth-password)
- [`getAuthUser`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-auth-user)
- [`getContexts`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-contexts) — Returns the contexts dictionary as serialised SWML, or null when no contexts have been defined yet.
- [`getDynamicConfigCallback`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-dynamic-config-callback)
- [`getGlobalData`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-global-data)
- [`getHost`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-host)
- [`getLanguageParams`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-language-params) — Read the per-language `params` dict for a previously-added language.
- [`getMcpServers`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-mcp-servers) — Get configured MCP servers (read-only).
- [`getName`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-name)
- [`getNormalisedRoute`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-normalised-route) — Return the agent's route normalised to an empty string for the root route or `"/<path>"` otherwise.
- [`getOnSummaryCallback`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-on-summary-callback)
- [`getPom`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-pom) — Read-only snapshot of the agent's POM as a typed `PromptObjectModel`.
- [`getPort`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-port)
- [`getPostPrompt`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-post-prompt) — Returns the post-prompt text that was set via setPostPrompt, or null when none has been set.
- [`getPrompt`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-prompt)
- [`getRawPrompt`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-raw-prompt) — Returns the raw prompt text whatever setPromptText stored, or null when no raw prompt has been set.
- [`getRoute`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-route)
- [`getSigningKey`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-signing-key)
- [`getSipUsernames`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-sip-usernames)
- [`getSkillManager`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-skill-manager)
- [`getTools`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/get-tools)
- [`handleMcpRequest`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/handle-mcp-request) — Handle an MCP JSON-RPC 2.0 request.
- [`hasSkill`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/has-skill)
- [`hasTool`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/has-tool)
- [`isMcpServerEnabled`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/is-mcp-server-enabled) — Check if MCP server endpoint is enabled.
- [`isSipRoutingEnabled`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/is-sip-routing-enabled)
- [`isTrustProxyForSignature`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/is-trust-proxy-for-signature)
- [`listSkills`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/list-skills)
- [`manualSetProxyUrl`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/manual-set-proxy-url)
- [`onDebugEvent`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/on-debug-event)
- [`onFunctionCall`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/on-function-call)
- [`onSummary`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/on-summary)
- [`promptAddSection`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/prompt-add-section)
- [`promptAddSubsection`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/prompt-add-subsection)
- [`promptAddToSection`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/prompt-add-to-section)
- [`promptHasSection`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/prompt-has-section)
- [`registerAdditionalRoutes`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/register-additional-routes)
- [`registerSipUsername`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/register-sip-username)
- [`registerSwaigFunction`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/register-swaig-function)
- [`removeSkill`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/remove-skill)
- [`renderMainSwml`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/render-main-swml)
- [`renderSwml`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/render-swml) — Render the complete SWML document.
- [`renderSwmlJson`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/render-swml-json) — Render SWML as a JSON string.
- [`resetContexts`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/reset-contexts) — Remove all contexts, returning the agent to a no-contexts state.
- [`run`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/run) — Start the agent server.
- [`setDynamicConfigCallback`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-dynamic-config-callback)
- [`setFunctionIncludes`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-function-includes)
- [`setGlobalData`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-global-data)
- [`setInternalFillers`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-internal-fillers)
- [`setInternalFillersMap`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-internal-fillers-map) — Set internal fillers for native SWAIG functions.
- [`setLanguageParams`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-language-params) — Set (or replace) the per-language `params` dict on an already-added language.
- [`setLanguages`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-languages)
- [`setNativeFunctions`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-native-functions)
- [`setParam`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-param)
- [`setParams`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-params)
- [`setPostPrompt`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-post-prompt)
- [`setPostPromptLlmParams`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-post-prompt-llm-params)
- [`setPostPromptUrl`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-post-prompt-url)
- [`setPromptLlmParams`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-prompt-llm-params)
- [`setPromptPom`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-prompt-pom) — Sets the prompt as a list of POM section maps.
- [`setPromptText`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-prompt-text)
- [`setPronunciations`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-pronunciations)
- [`setWebHookUrl`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/set-web-hook-url)
- [`updateGlobalData`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/update-global-data)
- [`validateSignedWebhook`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/validate-signed-webhook) — Override the `Service` hook to enforce SignalWire webhook signature validation when a `#signingKey` is configured.
- [`validateToolToken`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/validate-tool-token) — Validate a per-call SWAIG-function token.
- [`validateWebhook`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/validate-webhook) — Public delegate around `#validateSignedWebhook` so external front-doors (e.g.

## Classes

- [`Builder`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/builder)

## Interfaces

- [`DynamicConfigCallback`](/reference/java/com/signalwire/sdk/agent/agent/agent-base/dynamic-config-callback)

## Source

[`src/main/java/com/signalwire/sdk/agent/AgentBase.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/agent/AgentBase.java)

Line 53.
