---
slug: "/reference/rust/signalwire/agent/agent-base/agent-base"
title: "AgentBase"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::agent::agent_base::AgentBase"
  parent: "signalwire::agent::agent_base"
  module: "agent.agent_base"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs"
  visibility: "public"
---
# `AgentBase`

Core agent that extends `Service` with AI-specific capabilities.

Manages prompt configuration, tool registration, SWML rendering,
and HTTP request handling for AI agent endpoints.

AgentBase implements `Deref<Target = Service>` (Rust's idiomatic
equivalent of inheritance) so `Service` methods like `set_route`,
`define_tool`, `on_function_call`, etc. are usable on `AgentBase`
instances directly without needing forwarding wrappers.

## Signature

```rust
struct AgentBase { /* fields */ }
```

## Inheritance

**Implements:** `Clone`, `Deref`, `DerefMut`

## Constants

| Name                              | Type | Required | Default | Description                                                                                                                                                                                                                                                                                                                                                                                                                 |
| --------------------------------- | ---- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SUPPORTED_INTERNAL_FILLER_NAMES` | —    | yes      | —       | The complete set of internal SWAIG function names that accept fillers, matching the SWAIGInternalFiller schema definition. Any name outside this set is silently ignored by the runtime — \[`Self::set_internal_fillers_map`] and \[`Self::add_internal_filler_for`] warn if you pass an unknown name. Notable absences: `change_step`, `gather_submit`, and arbitrary user-defined SWAIG function names are NOT supported. |

## Methods

- [`add_function_include`](/reference/rust/signalwire/agent/agent-base/agent-base/add-function-include)
- [`add_hint`](/reference/rust/signalwire/agent/agent-base/agent-base/add-hint)
- [`add_hints`](/reference/rust/signalwire/agent/agent-base/agent-base/add-hints)
- [`add_internal_filler`](/reference/rust/signalwire/agent/agent-base/agent-base/add-internal-filler)
- [`add_internal_filler_for`](/reference/rust/signalwire/agent/agent-base/agent-base/add-internal-filler-for) — Add internal fillers for a single internal function and language.
- [`add_language`](/reference/rust/signalwire/agent/agent-base/agent-base/add-language)
- [`add_pattern_hint`](/reference/rust/signalwire/agent/agent-base/agent-base/add-pattern-hint)
- [`add_post_ai_verb`](/reference/rust/signalwire/agent/agent-base/agent-base/add-post-ai-verb)
- [`add_post_answer_verb`](/reference/rust/signalwire/agent/agent-base/agent-base/add-post-answer-verb)
- [`add_pre_answer_verb`](/reference/rust/signalwire/agent/agent-base/agent-base/add-pre-answer-verb)
- [`add_pronunciation`](/reference/rust/signalwire/agent/agent-base/agent-base/add-pronunciation)
- [`add_skill`](/reference/rust/signalwire/agent/agent-base/agent-base/add-skill)
- [`add_swaig_query_params`](/reference/rust/signalwire/agent/agent-base/agent-base/add-swaig-query-params)
- [`build_ai_verb`](/reference/rust/signalwire/agent/agent-base/agent-base/build-ai-verb) — Build the AI verb configuration block.
- [`clear_post_ai_verbs`](/reference/rust/signalwire/agent/agent-base/agent-base/clear-post-ai-verbs)
- [`clear_post_answer_verbs`](/reference/rust/signalwire/agent/agent-base/agent-base/clear-post-answer-verbs)
- [`clear_pre_answer_verbs`](/reference/rust/signalwire/agent/agent-base/agent-base/clear-pre-answer-verbs)
- [`clear_swaig_query_params`](/reference/rust/signalwire/agent/agent-base/agent-base/clear-swaig-query-params)
- [`clone`](/reference/rust/signalwire/agent/agent-base/agent-base/clone)
- [`clone_for_request`](/reference/rust/signalwire/agent/agent-base/agent-base/clone-for-request) — Create a deep copy of this agent for per-request customisation.
- [`create_tool_token`](/reference/rust/signalwire/agent/agent-base/agent-base/create-tool-token) — Mint a per-call SWAIG-function token via the agent's SessionManager.
- [`define_contexts`](/reference/rust/signalwire/agent/agent-base/agent-base/define-contexts) — Return the ContextBuilder, creating it lazily on first access.
- [`define_tools`](/reference/rust/signalwire/agent/agent-base/agent-base/define-tools) — Register a SWAIG tool (function) that the AI can invoke during a call.
- [`deref`](/reference/rust/signalwire/agent/agent-base/agent-base/deref)
- [`deref_mut`](/reference/rust/signalwire/agent/agent-base/agent-base/deref-mut)
- [`enable_debug_events`](/reference/rust/signalwire/agent/agent-base/agent-base/enable-debug-events)
- [`enable_sip_routing`](/reference/rust/signalwire/agent/agent-base/agent-base/enable-sip-routing)
- [`get_basic_auth_credentials`](/reference/rust/signalwire/agent/agent-base/agent-base/get-basic-auth-credentials) — Return `(user, password)` for the agent's basic auth.
- [`get_contexts`](/reference/rust/signalwire/agent/agent-base/agent-base/get-contexts) — Returns the contexts dictionary as a serialised `Value::Object`, or `None` when no contexts have been defined yet.
- [`get_language_params`](/reference/rust/signalwire/agent/agent-base/agent-base/get-language-params) — Read the per-language `params` dict for a previously-added language. Mirrors Python's `AIConfigMixin.get_language_params`.
- [`get_post_prompt`](/reference/rust/signalwire/agent/agent-base/agent-base/get-post-prompt) — Returns the post-prompt text whatever `set_post_prompt` stored, or `None` when no post-prompt has been set.
- [`get_prompt`](/reference/rust/signalwire/agent/agent-base/agent-base/get-prompt) — Return the prompt payload: POM array if enabled and populated, otherwise raw text.
- [`get_raw_prompt`](/reference/rust/signalwire/agent/agent-base/agent-base/get-raw-prompt) — Returns the raw prompt text whatever `set_prompt_text` stored, or `None` when no raw prompt has been set. Distinct from `get_prompt` which may return the POM array when `use_pom` is `true`.
- [`handle_request`](/reference/rust/signalwire/agent/agent-base/agent-base/handle-request) — Handle an HTTP request. Overrides the service handler with agent-specific logic for SWML, SWAIG dispatch, and post-prompt callbacks.
- [`has_skill`](/reference/rust/signalwire/agent/agent-base/agent-base/has-skill)
- [`list_skills`](/reference/rust/signalwire/agent/agent-base/agent-base/list-skills)
- [`list_tool_names`](/reference/rust/signalwire/agent/agent-base/agent-base/list-tool-names) — Return the names of every registered SWAIG tool in insertion order.
- [`manual_set_proxy_url`](/reference/rust/signalwire/agent/agent-base/agent-base/manual-set-proxy-url)
- [`new`](/reference/rust/signalwire/agent/agent-base/agent-base/new)
- [`on_debug_event`](/reference/rust/signalwire/agent/agent-base/agent-base/on-debug-event)
- [`on_summary`](/reference/rust/signalwire/agent/agent-base/agent-base/on-summary)
- [`pom`](/reference/rust/signalwire/agent/agent-base/agent-base/pom) — Read-only snapshot of the agent's POM as a typed \[`PromptObjectModel`].
- [`prompt_add_section`](/reference/rust/signalwire/agent/agent-base/agent-base/prompt-add-section) — Add a top-level POM section with an optional body and bullets.
- [`prompt_add_subsection`](/reference/rust/signalwire/agent/agent-base/agent-base/prompt-add-subsection) — Add a subsection nested under an existing parent section.
- [`prompt_add_to_section`](/reference/rust/signalwire/agent/agent-base/agent-base/prompt-add-to-section) — Append body text and/or bullets to an existing section.
- [`prompt_has_section`](/reference/rust/signalwire/agent/agent-base/agent-base/prompt-has-section) — Check whether a POM section with the given title exists.
- [`refresh_context_tools`](/reference/rust/signalwire/agent/agent-base/agent-base/refresh-context-tools) — Refresh the ContextBuilder's tool-name supplier with the current list of registered SWAIG tools. Call this if you define new tools after the first `define_contexts()` call and want the next `validate()` to see them.
- [`register_sip_username`](/reference/rust/signalwire/agent/agent-base/agent-base/register-sip-username)
- [`remove_skill`](/reference/rust/signalwire/agent/agent-base/agent-base/remove-skill)
- [`render_swml`](/reference/rust/signalwire/agent/agent-base/agent-base/render-swml) — Build the complete SWML document for a request.
- [`reset_contexts`](/reference/rust/signalwire/agent/agent-base/agent-base/reset-contexts) — Remove all contexts, returning the agent to a no-contexts state. This is a convenience wrapper around `define_contexts().reset()`. Use it in a dynamic config callback when you need to rebuild contexts from scratch for a specific request.
- [`run`](/reference/rust/signalwire/agent/agent-base/agent-base/run) — Start a blocking HTTP server on the configured host:port.
- [`service`](/reference/rust/signalwire/agent/agent-base/agent-base/service) — Access the underlying service.
- [`service_mut`](/reference/rust/signalwire/agent/agent-base/agent-base/service-mut) — Access the underlying service mutably.
- [`set_dynamic_config_callback`](/reference/rust/signalwire/agent/agent-base/agent-base/set-dynamic-config-callback)
- [`set_function_includes`](/reference/rust/signalwire/agent/agent-base/agent-base/set-function-includes)
- [`set_global_data`](/reference/rust/signalwire/agent/agent-base/agent-base/set-global-data)
- [`set_internal_fillers`](/reference/rust/signalwire/agent/agent-base/agent-base/set-internal-fillers)
- [`set_internal_fillers_map`](/reference/rust/signalwire/agent/agent-base/agent-base/set-internal-fillers-map) — Set internal fillers for native SWAIG functions (structured form).
- [`set_language_params`](/reference/rust/signalwire/agent/agent-base/agent-base/set-language-params) — Set (or replace) the per-language `params` dict on an already-added language. Mirrors Python's `AIConfigMixin.set_language_params` — engine-specific tuning (voice stability/similarity, model knobs, etc.) can be attached after the language entry was created.
- [`set_languages`](/reference/rust/signalwire/agent/agent-base/agent-base/set-languages)
- [`set_native_functions`](/reference/rust/signalwire/agent/agent-base/agent-base/set-native-functions)
- [`set_param`](/reference/rust/signalwire/agent/agent-base/agent-base/set-param)
- [`set_params`](/reference/rust/signalwire/agent/agent-base/agent-base/set-params)
- [`set_post_prompt`](/reference/rust/signalwire/agent/agent-base/agent-base/set-post-prompt)
- [`set_post_prompt_llm_params`](/reference/rust/signalwire/agent/agent-base/agent-base/set-post-prompt-llm-params)
- [`set_post_prompt_url`](/reference/rust/signalwire/agent/agent-base/agent-base/set-post-prompt-url)
- [`set_prompt_llm_params`](/reference/rust/signalwire/agent/agent-base/agent-base/set-prompt-llm-params)
- [`set_prompt_pom`](/reference/rust/signalwire/agent/agent-base/agent-base/set-prompt-pom) — Sets the prompt as a list of POM section objects. Each section supports keys "title", "body", "bullets", "numbered", "numbered\_bullets", and "subsections". Switches the agent to POM mode.
- [`set_prompt_text`](/reference/rust/signalwire/agent/agent-base/agent-base/set-prompt-text)
- [`set_pronunciations`](/reference/rust/signalwire/agent/agent-base/agent-base/set-pronunciations)
- [`set_signing_key`](/reference/rust/signalwire/agent/agent-base/agent-base/set-signing-key) — Set or clear the signing key after construction. Useful for tests and dynamic-config flows. Pass an empty string or `None`-equivalent to disable.
- [`set_webhook_url`](/reference/rust/signalwire/agent/agent-base/agent-base/set-webhook-url)
- [`signing_key`](/reference/rust/signalwire/agent/agent-base/agent-base/signing-key) — Return the signing key resolved from `AgentOptions::signing_key` or the `SIGNALWIRE_SIGNING_KEY` environment variable. `None` means signature validation is disabled.
- [`update_global_data`](/reference/rust/signalwire/agent/agent-base/agent-base/update-global-data)
- [`validate_tool_token`](/reference/rust/signalwire/agent/agent-base/agent-base/validate-tool-token) — Validate a per-call SWAIG-function token. Returns `false` when the function is not registered or when the SessionManager rejects the token.

## Type Aliases

- [`Target`](/reference/rust/signalwire/agent/agent-base/agent-base/target)

## Source

[`src/agent/agent_base.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs)

Line 82.
