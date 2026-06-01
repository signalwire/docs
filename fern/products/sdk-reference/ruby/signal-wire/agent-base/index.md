---
slug: "/reference/ruby/signal-wire/agent-base"
title: "AgentBase"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase"
  parent: "SignalWire"
  module: "SignalWire"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `AgentBase`

Central agent class that composes SWML rendering, tool dispatch,
prompt management, AI config, and HTTP serving.

AgentBase extends SWMLService with agent-specific capabilities:

- Prompt management (POM sections and raw text)
- Tool (SWAIG function) registration & dispatch
- AI configuration (hints, languages, pronunciations, params)
- Verb management (pre/post answer, post-AI)
- Context & step workflows
- Skill integration
- Dynamic configuration via per-request ephemeral copies

All configuration methods return +self+ for method chaining.

## Signature

```ruby
class AgentBase < SignalWire::SWML::Service
```

## Inheritance

**Extends:** [SignalWire::SWML::Service](/reference/ruby/signal-wire/swml/service)

## Constants

| Name                              | Type                                                                                                                 | Required | Default | Description                                                                                                                                                                                                                                                                                                                                                                                            |
| --------------------------------- | -------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `MAX_BODY_SIZE`                   | `MAX_BODY_SIZE = 1_048_576`                                                                                          | yes      | —       | Maximum request body size (1 MB)                                                                                                                                                                                                                                                                                                                                                                       |
| `SUPPORTED_INTERNAL_FILLER_NAMES` | `SUPPORTED_INTERNAL_FILLER_NAMES = %w[
  hangup
  check_time
  wait_for_user
  wait_seconds
  adjust_response_laten` | yes      | —       | The complete set of internal SWAIG function names that accept fillers, matching the SWAIGInternalFiller schema definition. Any name outside this set is silently ignored by the runtime — +set\_internal\_fillers+ and +add\_internal\_filler+ warn if you pass an unknown name. Notable absences: +change\_step+, +gather\_submit+, or arbitrary user-defined SWAIG function names are NOT supported. |

## Methods

- [`add_answer_verb`](/reference/ruby/signal-wire/agent-base/add-answer-verb)
- [`add_function_include`](/reference/ruby/signal-wire/agent-base/add-function-include)
- [`add_hint`](/reference/ruby/signal-wire/agent-base/add-hint) — ================================================================== AI Config methods ==================================================================
- [`add_hints`](/reference/ruby/signal-wire/agent-base/add-hints)
- [`add_internal_filler`](/reference/ruby/signal-wire/agent-base/add-internal-filler) — Add internal fillers for a single internal function and language.
- [`add_language`](/reference/ruby/signal-wire/agent-base/add-language) — Add a language configuration.
- [`add_mcp_server`](/reference/ruby/signal-wire/agent-base/add-mcp-server) — Add an external MCP server for tool discovery and invocation.
- [`add_pattern_hint`](/reference/ruby/signal-wire/agent-base/add-pattern-hint) — Add a complex (pattern-matched) hint.
- [`add_post_ai_verb`](/reference/ruby/signal-wire/agent-base/add-post-ai-verb)
- [`add_post_answer_verb`](/reference/ruby/signal-wire/agent-base/add-post-answer-verb)
- [`add_pre_answer_verb`](/reference/ruby/signal-wire/agent-base/add-pre-answer-verb) — ================================================================== Verb management ==================================================================
- [`add_pronunciation`](/reference/ruby/signal-wire/agent-base/add-pronunciation)
- [`add_skill`](/reference/ruby/signal-wire/agent-base/add-skill) — Load and register a skill by name.
- [`add_swaig_query_params`](/reference/ruby/signal-wire/agent-base/add-swaig-query-params)
- [`agent_id`](/reference/ruby/signal-wire/agent-base/agent-id) — Python parity: - `logger` — agent-specific structured logger (Python: `self.log`). - `skill_manager` — owning SkillManager (Python's `self.skill_manager`). - `agent_id` — UUID identifier from constructor or auto-generated. - `default_webhook_url` — base URL for SWAIG webhook fallbacks. - `native_functions` — names of built-in SWAIG functions to advertise. - `use_pom` — whether prompt-object-model rendering is enabled.
- [`as_rack_app`](/reference/ruby/signal-wire/agent-base/as-rack-app) — Return a Rack-compatible application for mounting.
- [`clear_post_ai_verbs`](/reference/ruby/signal-wire/agent-base/clear-post-ai-verbs)
- [`clear_post_answer_verbs`](/reference/ruby/signal-wire/agent-base/clear-post-answer-verbs)
- [`clear_pre_answer_verbs`](/reference/ruby/signal-wire/agent-base/clear-pre-answer-verbs)
- [`clear_swaig_query_params`](/reference/ruby/signal-wire/agent-base/clear-swaig-query-params)
- [`contexts`](/reference/ruby/signal-wire/agent-base/contexts) — Define / retrieve the ContextBuilder for this agent.
- [`create_tool_token`](/reference/ruby/signal-wire/agent-base/create-tool-token) — Mint a per-call SWAIG-function token via the agent's SessionManager.
- [`default_webhook_url`](/reference/ruby/signal-wire/agent-base/default-webhook-url) — Python parity: - `logger` — agent-specific structured logger (Python: `self.log`). - `skill_manager` — owning SkillManager (Python's `self.skill_manager`). - `agent_id` — UUID identifier from constructor or auto-generated. - `default_webhook_url` — base URL for SWAIG webhook fallbacks. - `native_functions` — names of built-in SWAIG functions to advertise. - `use_pom` — whether prompt-object-model rendering is enabled.
- [`define_contexts`](/reference/ruby/signal-wire/agent-base/define-contexts) — Define / retrieve the ContextBuilder for this agent.
- [`define_tool`](/reference/ruby/signal-wire/agent-base/define-tool) — Register a SWAIG tool (function) that the AI can invoke during a call.
- [`define_tools`](/reference/ruby/signal-wire/agent-base/define-tools) — Return an array of all tool definitions (for SWML rendering).
- [`enable_debug_events`](/reference/ruby/signal-wire/agent-base/enable-debug-events)
- [`enable_debug_routes`](/reference/ruby/signal-wire/agent-base/enable-debug-routes)
- [`enable_mcp_server`](/reference/ruby/signal-wire/agent-base/enable-mcp-server) — Expose this agent's tools as an MCP server endpoint at /mcp.
- [`enable_sip_routing`](/reference/ruby/signal-wire/agent-base/enable-sip-routing) — ================================================================== SIP ==================================================================
- [`extract_sip_username`](/reference/ruby/signal-wire/agent-base/extract-sip-username) — Extract a SIP username from a SIP URI string.
- [`extract_sip_username_from_request`](/reference/ruby/signal-wire/agent-base/extract-sip-username-from-request) — Extract the SIP username from request body data.
- [`get_basic_auth_credentials`](/reference/ruby/signal-wire/agent-base/get-basic-auth-credentials) — Get the configured basic-auth credentials.
- [`get_contexts`](/reference/ruby/signal-wire/agent-base/get-contexts) — Returns the contexts dictionary as a serialised hash, or nil when no contexts have been defined yet.
- [`get_language_params`](/reference/ruby/signal-wire/agent-base/get-language-params) — Read the per-language `params` hash for a previously-added language.
- [`get_post_prompt`](/reference/ruby/signal-wire/agent-base/get-post-prompt) — Returns the post-prompt text whatever set\_post\_prompt stored, or nil when no post-prompt has been set.
- [`get_prompt`](/reference/ruby/signal-wire/agent-base/get-prompt) — Return the current prompt: either a string (text mode) or an array (POM).
- [`get_raw_prompt`](/reference/ruby/signal-wire/agent-base/get-raw-prompt) — Returns the raw prompt text whatever set\_prompt\_text stored, or nil when no raw prompt has been set. Distinct from #get\_prompt which may return the POM array when use\_pom is true.
- [`handle_additional_route`](/reference/ruby/signal-wire/agent-base/handle-additional-route)
- [`has_skill?`](/reference/ruby/signal-wire/agent-base/has-skill)
- [`initialize`](/reference/ruby/signal-wire/agent-base/initialize) — ------------------------------------------------------------------ Construction ------------------------------------------------------------------
- [`list_skills`](/reference/ruby/signal-wire/agent-base/list-skills)
- [`list_tool_names`](/reference/ruby/signal-wire/agent-base/list-tool-names) — Return the names of all registered SWAIG tools in insertion order. Used by ContextBuilder#validate! to detect collisions with reserved native tool names.
- [`logger`](/reference/ruby/signal-wire/agent-base/logger) — Python parity: - `logger` — agent-specific structured logger (Python: `self.log`). - `skill_manager` — owning SkillManager (Python's `self.skill_manager`). - `agent_id` — UUID identifier from constructor or auto-generated. - `default_webhook_url` — base URL for SWAIG webhook fallbacks. - `native_functions` — names of built-in SWAIG functions to advertise. - `use_pom` — whether prompt-object-model rendering is enabled.
- [`manual_set_proxy_url`](/reference/ruby/signal-wire/agent-base/manual-set-proxy-url)
- [`native_functions`](/reference/ruby/signal-wire/agent-base/native-functions) — Python parity: - `logger` — agent-specific structured logger (Python: `self.log`). - `skill_manager` — owning SkillManager (Python's `self.skill_manager`). - `agent_id` — UUID identifier from constructor or auto-generated. - `default_webhook_url` — base URL for SWAIG webhook fallbacks. - `native_functions` — names of built-in SWAIG functions to advertise. - `use_pom` — whether prompt-object-model rendering is enabled.
- [`on_debug_event`](/reference/ruby/signal-wire/agent-base/on-debug-event)
- [`on_function_call`](/reference/ruby/signal-wire/agent-base/on-function-call) — Dispatch a function call to the registered handler.
- [`on_summary`](/reference/ruby/signal-wire/agent-base/on-summary) — Python parity: `on_summary(self, summary, raw_data=None)` is a virtual hook called when a post-prompt summary is received. Ruby supports two equivalent shapes:
- [`pom`](/reference/ruby/signal-wire/agent-base/pom) — Read-only snapshot of the agent's POM as a typed {SignalWire::POM::PromptObjectModel} instance.
- [`prompt_add_section`](/reference/ruby/signal-wire/agent-base/prompt-add-section) — Add a POM section.
- [`prompt_add_subsection`](/reference/ruby/signal-wire/agent-base/prompt-add-subsection) — Add a subsection under a parent section.
- [`prompt_add_to_section`](/reference/ruby/signal-wire/agent-base/prompt-add-to-section) — Append content to an existing POM section, creating it if absent.
- [`prompt_has_section?`](/reference/ruby/signal-wire/agent-base/prompt-has-section) — Check whether a POM section with the given title exists.
- [`rack_app`](/reference/ruby/signal-wire/agent-base/rack-app) — Return a Rack-compatible application for mounting.
- [`register_sip_username`](/reference/ruby/signal-wire/agent-base/register-sip-username)
- [`register_swaig_function`](/reference/ruby/signal-wire/agent-base/register-swaig-function) — Register a raw SWAIG function definition (e.g. from DataMap#to\_swaig\_function).
- [`remove_skill`](/reference/ruby/signal-wire/agent-base/remove-skill)
- [`render_swml`](/reference/ruby/signal-wire/agent-base/render-swml) — Build the complete SWML document hash.
- [`reset_contexts`](/reference/ruby/signal-wire/agent-base/reset-contexts) — Remove all contexts, returning the agent to a no-contexts state. This is a convenience wrapper around +define\_contexts.reset+. Use it in a dynamic config callback when you need to rebuild contexts from scratch for a specific request.
- [`run`](/reference/ruby/signal-wire/agent-base/run) — Universal run method — mirrors Python's `WebMixin.run(event=None, context=None, force_mode=None, host=None, port=None)`.
- [`serve`](/reference/ruby/signal-wire/agent-base/serve) — Start the HTTP server (blocking).
- [`set_dynamic_config_callback`](/reference/ruby/signal-wire/agent-base/set-dynamic-config-callback) — ================================================================== Web / HTTP configuration ==================================================================
- [`set_function_includes`](/reference/ruby/signal-wire/agent-base/set-function-includes)
- [`set_global_data`](/reference/ruby/signal-wire/agent-base/set-global-data)
- [`set_internal_fillers`](/reference/ruby/signal-wire/agent-base/set-internal-fillers) — Set internal fillers for native SWAIG functions.
- [`set_language_params`](/reference/ruby/signal-wire/agent-base/set-language-params) — Set (or replace) the per-language `params` dict on an already-added language. Useful when language entries are built up via add\_language first and engine-specific tuning is added later (e.g. from a config loader). Returns self for chaining.
- [`set_languages`](/reference/ruby/signal-wire/agent-base/set-languages)
- [`set_native_functions`](/reference/ruby/signal-wire/agent-base/set-native-functions)
- [`set_param`](/reference/ruby/signal-wire/agent-base/set-param)
- [`set_params`](/reference/ruby/signal-wire/agent-base/set-params)
- [`set_post_prompt`](/reference/ruby/signal-wire/agent-base/set-post-prompt) — Set post-prompt text.
- [`set_post_prompt_llm_params`](/reference/ruby/signal-wire/agent-base/set-post-prompt-llm-params)
- [`set_post_prompt_url`](/reference/ruby/signal-wire/agent-base/set-post-prompt-url)
- [`set_prompt_llm_params`](/reference/ruby/signal-wire/agent-base/set-prompt-llm-params)
- [`set_prompt_pom`](/reference/ruby/signal-wire/agent-base/set-prompt-pom) — Set POM array directly.
- [`set_prompt_text`](/reference/ruby/signal-wire/agent-base/set-prompt-text) — Set prompt as raw text. Clears any POM state.
- [`set_pronunciations`](/reference/ruby/signal-wire/agent-base/set-pronunciations)
- [`set_web_hook_url`](/reference/ruby/signal-wire/agent-base/set-web-hook-url)
- [`signing_key`](/reference/ruby/signal-wire/agent-base/signing-key) — Python parity: - `logger` — agent-specific structured logger (Python: `self.log`). - `skill_manager` — owning SkillManager (Python's `self.skill_manager`). - `agent_id` — UUID identifier from constructor or auto-generated. - `default_webhook_url` — base URL for SWAIG webhook fallbacks. - `native_functions` — names of built-in SWAIG functions to advertise. - `use_pom` — whether prompt-object-model rendering is enabled.
- [`skill_manager`](/reference/ruby/signal-wire/agent-base/skill-manager) — Python parity: - `logger` — agent-specific structured logger (Python: `self.log`). - `skill_manager` — owning SkillManager (Python's `self.skill_manager`). - `agent_id` — UUID identifier from constructor or auto-generated. - `default_webhook_url` — base URL for SWAIG webhook fallbacks. - `native_functions` — names of built-in SWAIG functions to advertise. - `use_pom` — whether prompt-object-model rendering is enabled.
- [`update_global_data`](/reference/ruby/signal-wire/agent-base/update-global-data)
- [`use_pom`](/reference/ruby/signal-wire/agent-base/use-pom) — Python parity: - `logger` — agent-specific structured logger (Python: `self.log`). - `skill_manager` — owning SkillManager (Python's `self.skill_manager`). - `agent_id` — UUID identifier from constructor or auto-generated. - `default_webhook_url` — base URL for SWAIG webhook fallbacks. - `native_functions` — names of built-in SWAIG functions to advertise. - `use_pom` — whether prompt-object-model rendering is enabled.
- [`validate_tool_token`](/reference/ruby/signal-wire/agent-base/validate-tool-token) — Validate a per-call SWAIG-function token. Returns false when the function is not registered, when the SessionManager rejects the token, or on any underlying exception.

## Classes

- [`AgentBodyLimitMiddleware`](/reference/ruby/signal-wire/agent-base/agent-body-limit-middleware)
- [`AgentSecurityHeadersMiddleware`](/reference/ruby/signal-wire/agent-base/agent-security-headers-middleware) — ================================================================== Rack Middleware ==================================================================
- [`AgentTimingSafeBasicAuth`](/reference/ruby/signal-wire/agent-base/agent-timing-safe-basic-auth)

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 41.
