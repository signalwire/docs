---
slug: "/reference/cpp/signalwire/agent/agent-base"
title: "AgentBase"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase"
  parent: "signalwire::agent"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `AgentBase`

## Signature

```cpp
class signalwire::agent::AgentBase : signalwire::swml::Service
```

## Inheritance

**Extends:** [signalwire::swml::Service](/reference/cpp/signalwire/swml/service)

## Methods

- [`~AgentBase`](/reference/cpp/signalwire/agent/agent-base/agent-base__2)
- [`add_answer_verb`](/reference/cpp/signalwire/agent/agent-base/add-answer-verb)
- [`add_context`](/reference/cpp/signalwire/agent/agent-base/add-context)
- [`add_function_include`](/reference/cpp/signalwire/agent/agent-base/add-function-include)
- [`add_hint`](/reference/cpp/signalwire/agent/agent-base/add-hint)
- [`add_hints`](/reference/cpp/signalwire/agent/agent-base/add-hints)
- [`add_internal_filler`](/reference/cpp/signalwire/agent/agent-base/add-internal-filler) — Add internal fillers for a single language (legacy overload; stored under the given language key at the top level).
- [`add_language`](/reference/cpp/signalwire/agent/agent-base/add-language)
- [`add_mcp_server`](/reference/cpp/signalwire/agent/agent-base/add-mcp-server)
- [`add_pattern_hint`](/reference/cpp/signalwire/agent/agent-base/add-pattern-hint)
- [`add_post_ai_verb`](/reference/cpp/signalwire/agent/agent-base/add-post-ai-verb)
- [`add_post_answer_verb`](/reference/cpp/signalwire/agent/agent-base/add-post-answer-verb)
- [`add_pre_answer_verb`](/reference/cpp/signalwire/agent/agent-base/add-pre-answer-verb)
- [`add_pronunciation`](/reference/cpp/signalwire/agent/agent-base/add-pronunciation)
- [`add_security_headers`](/reference/cpp/signalwire/agent/agent-base/add-security-headers)
- [`add_skill`](/reference/cpp/signalwire/agent/agent-base/add-skill)
- [`add_swaig_query_param`](/reference/cpp/signalwire/agent/agent-base/add-swaig-query-param)
- [`AgentBase`](/reference/cpp/signalwire/agent/agent-base/agent-base)
- [`auth_password`](/reference/cpp/signalwire/agent/agent-base/auth-password)
- [`auth_username`](/reference/cpp/signalwire/agent/agent-base/auth-username)
- [`auto_map_sip_usernames`](/reference/cpp/signalwire/agent/agent-base/auto-map-sip-usernames)
- [`build_ai_verb`](/reference/cpp/signalwire/agent/agent-base/build-ai-verb)
- [`build_mcp_tool_list`](/reference/cpp/signalwire/agent/agent-base/build-mcp-tool-list)
- [`build_prompt`](/reference/cpp/signalwire/agent/agent-base/build-prompt)
- [`build_swaig_functions`](/reference/cpp/signalwire/agent/agent-base/build-swaig-functions)
- [`build_webhook_url`](/reference/cpp/signalwire/agent/agent-base/build-webhook-url)
- [`clear_post_ai_verbs`](/reference/cpp/signalwire/agent/agent-base/clear-post-ai-verbs)
- [`clear_post_answer_verbs`](/reference/cpp/signalwire/agent/agent-base/clear-post-answer-verbs)
- [`clear_pre_answer_verbs`](/reference/cpp/signalwire/agent/agent-base/clear-pre-answer-verbs)
- [`clear_swaig_query_params`](/reference/cpp/signalwire/agent/agent-base/clear-swaig-query-params)
- [`clone`](/reference/cpp/signalwire/agent/agent-base/clone)
- [`create_tool_token`](/reference/cpp/signalwire/agent/agent-base/create-tool-token) — Mint a per-call SWAIG-function token via the agent's SessionManager. Python parity: state\_mixin.StateMixin.\_create\_tool\_token — delegates to SessionManager::create\_token and returns an empty string on any thrown exception (Python catches all exceptions and returns "" on error).
- [`define_contexts`](/reference/cpp/signalwire/agent/agent-base/define-contexts)
- [`define_tool`](/reference/cpp/signalwire/agent/agent-base/define-tool) — Register a SWAIG tool (function) that the AI can invoke during a call.
- [`detect_proxy_url`](/reference/cpp/signalwire/agent/agent-base/detect-proxy-url)
- [`enable_debug_events`](/reference/cpp/signalwire/agent/agent-base/enable-debug-events)
- [`enable_debug_routes`](/reference/cpp/signalwire/agent/agent-base/enable-debug-routes)
- [`enable_mcp_server`](/reference/cpp/signalwire/agent/agent-base/enable-mcp-server)
- [`enable_sip_routing`](/reference/cpp/signalwire/agent/agent-base/enable-sip-routing)
- [`get_contexts`](/reference/cpp/signalwire/agent/agent-base/get-contexts) — Returns the contexts dictionary as a serialised JSON object, or std::nullopt when no contexts have been defined yet. Mirrors Python's PromptManager.get\_contexts which returns the contexts dict or None.
- [`get_language_params`](/reference/cpp/signalwire/agent/agent-base/get-language-params) — Read the per-language params dict for a previously-added language. Returns std::nullopt when the code is unknown or when params were never set on that language — no exception path, mirroring Python's None return. Python parity: AIConfigMixin.get\_language\_params (029ca6f).
- [`get_post_prompt`](/reference/cpp/signalwire/agent/agent-base/get-post-prompt) — Returns the post-prompt text whatever set\_post\_prompt stored, or std::nullopt when no post-prompt has been set. Mirrors Python's PromptManager.get\_post\_prompt / PromptMixin.get\_post\_prompt — used by SWML rendering when a post-prompt is configured.
- [`get_prompt`](/reference/cpp/signalwire/agent/agent-base/get-prompt)
- [`get_raw_prompt`](/reference/cpp/signalwire/agent/agent-base/get-raw-prompt) — Returns the raw prompt text whatever set\_prompt\_text stored, or std::nullopt when no raw prompt has been set. Distinct from get\_prompt which renders the POM array when use\_pom is true. Mirrors Python's PromptManager.get\_raw\_prompt.
- [`handle_mcp_request`](/reference/cpp/signalwire/agent/agent-base/handle-mcp-request)
- [`handle_post_prompt_request`](/reference/cpp/signalwire/agent/agent-base/handle-post-prompt-request)
- [`handle_swaig_request`](/reference/cpp/signalwire/agent/agent-base/handle-swaig-request)
- [`handle_swml_request`](/reference/cpp/signalwire/agent/agent-base/handle-swml-request)
- [`has_contexts`](/reference/cpp/signalwire/agent/agent-base/has-contexts)
- [`has_skill`](/reference/cpp/signalwire/agent/agent-base/has-skill)
- [`init_auth`](/reference/cpp/signalwire/agent/agent-base/init-auth)
- [`is_mcp_server_enabled`](/reference/cpp/signalwire/agent/agent-base/is-mcp-server-enabled)
- [`list_skills`](/reference/cpp/signalwire/agent/agent-base/list-skills)
- [`list_tools`](/reference/cpp/signalwire/agent/agent-base/list-tools)
- [`manual_set_proxy_url`](/reference/cpp/signalwire/agent/agent-base/manual-set-proxy-url)
- [`mcp_servers`](/reference/cpp/signalwire/agent/agent-base/mcp-servers)
- [`on_debug_event`](/reference/cpp/signalwire/agent/agent-base/on-debug-event)
- [`on_function_call`](/reference/cpp/signalwire/agent/agent-base/on-function-call) — Dispatch a function call to the registered handler. Returns a FunctionResult; if the function isn't registered, returns a FunctionResult with a "Function not found" response.
- [`on_summary`](/reference/cpp/signalwire/agent/agent-base/on-summary)
- [`operator=`](/reference/cpp/signalwire/agent/agent-base/operator)
- [`pom`](/reference/cpp/signalwire/agent/agent-base/pom) — Read-only snapshot of the agent's POM as a PromptObjectModel. Python parity: agent.pom instance attribute (agent\_base.py line 209). Returns std::nullopt when use\_pom is false (mirroring Python's self.pom = None); otherwise returns a freshly built signalwire::pom::PromptObjectModel whose sections are deep-copied from the agent's internal section/ subsection structures so callers cannot mutate them in-place.
- [`prompt_add_section`](/reference/cpp/signalwire/agent/agent-base/prompt-add-section)
- [`prompt_add_subsection`](/reference/cpp/signalwire/agent/agent-base/prompt-add-subsection)
- [`prompt_add_to_section`](/reference/cpp/signalwire/agent/agent-base/prompt-add-to-section)
- [`prompt_has_section`](/reference/cpp/signalwire/agent/agent-base/prompt-has-section)
- [`register_sip_username`](/reference/cpp/signalwire/agent/agent-base/register-sip-username)
- [`register_swaig_function`](/reference/cpp/signalwire/agent/agent-base/register-swaig-function)
- [`remove_skill`](/reference/cpp/signalwire/agent/agent-base/remove-skill)
- [`render_swml`](/reference/cpp/signalwire/agent/agent-base/render-swml)
- [`render_swml_for_request`](/reference/cpp/signalwire/agent/agent-base/render-swml-for-request)
- [`render_swml_internal`](/reference/cpp/signalwire/agent/agent-base/render-swml-internal)
- [`reset_contexts`](/reference/cpp/signalwire/agent/agent-base/reset-contexts) — Remove all contexts, returning the agent to a no-contexts state. Convenience wrapper around define\_contexts().reset().
- [`run`](/reference/cpp/signalwire/agent/agent-base/run)
- [`serve`](/reference/cpp/signalwire/agent/agent-base/serve)
- [`session_manager`](/reference/cpp/signalwire/agent/agent-base/session-manager)
- [`set_auth`](/reference/cpp/signalwire/agent/agent-base/set-auth)
- [`set_dynamic_config_callback`](/reference/cpp/signalwire/agent/agent-base/set-dynamic-config-callback)
- [`set_function_includes`](/reference/cpp/signalwire/agent/agent-base/set-function-includes)
- [`set_global_data`](/reference/cpp/signalwire/agent/agent-base/set-global-data)
- [`set_internal_fillers`](/reference/cpp/signalwire/agent/agent-base/set-internal-fillers) — Set internal fillers for native SWAIG functions. Internal fillers are short phrases the AI agent speaks (via TTS) while an internal/native function is running, so the caller doesn't hear dead air during transitions or background work. Supported function names (match the SWAIGInternalFiller schema): hangup, check\_time, wait\_for\_user, wait\_seconds, adjust\_response\_latency, next\_step, change\_context, get\_visual\_input, get\_ideal\_strategy. See supported\_internal\_filler\_names(). Notably NOT supported: change\_step, gather\_submit, or arbitrary user-defined SWAIG function names. The runtime only honors fillers for the names listed above; everything else is silently ignored at the SWML level. This method warns at registration time if you pass an unknown name so you catch the typo early. Expected JSON shape: {"function\_name": {"language\_code": \["phrase1", ...]}, ...}
- [`set_language_params`](/reference/cpp/signalwire/agent/agent-base/set-language-params) — Set (or replace) the per-language params dict on an already-added language. Useful when language entries are built via add\_language() first and engine-specific tuning is added later (e.g. from a config loader). Passing an empty object removes the params key (treated as unset). No-op if code isn't found among previously-added languages. Python parity: AIConfigMixin.set\_language\_params (029ca6f).
- [`set_languages`](/reference/cpp/signalwire/agent/agent-base/set-languages)
- [`set_name`](/reference/cpp/signalwire/agent/agent-base/set-name)
- [`set_native_functions`](/reference/cpp/signalwire/agent/agent-base/set-native-functions)
- [`set_param`](/reference/cpp/signalwire/agent/agent-base/set-param)
- [`set_params`](/reference/cpp/signalwire/agent/agent-base/set-params)
- [`set_post_prompt`](/reference/cpp/signalwire/agent/agent-base/set-post-prompt)
- [`set_post_prompt_llm_params`](/reference/cpp/signalwire/agent/agent-base/set-post-prompt-llm-params)
- [`set_post_prompt_url`](/reference/cpp/signalwire/agent/agent-base/set-post-prompt-url)
- [`set_post_prompt_url_direct`](/reference/cpp/signalwire/agent/agent-base/set-post-prompt-url-direct)
- [`set_prompt_llm_params`](/reference/cpp/signalwire/agent/agent-base/set-prompt-llm-params)
- [`set_prompt_pom`](/reference/cpp/signalwire/agent/agent-base/set-prompt-pom) — Sets the prompt as a list of POM section JSON objects. Each section supports keys "title", "body", "bullets", "numbered", "numbered\_bullets", and "subsections". Switches the agent to POM mode. Mirrors Python's PromptManager.set\_prompt\_pom.
- [`set_prompt_text`](/reference/cpp/signalwire/agent/agent-base/set-prompt-text)
- [`set_pronunciations`](/reference/cpp/signalwire/agent/agent-base/set-pronunciations)
- [`set_signing_key`](/reference/cpp/signalwire/agent/agent-base/set-signing-key) — Set the SignalWire Signing Key (Dashboard → API Credentials). Pass the empty string to clear and revert to env-fallback behavior.
- [`set_use_pom`](/reference/cpp/signalwire/agent/agent-base/set-use-pom)
- [`set_webhook_url`](/reference/cpp/signalwire/agent/agent-base/set-webhook-url)
- [`setup_routes`](/reference/cpp/signalwire/agent/agent-base/setup-routes)
- [`signing_key`](/reference/cpp/signalwire/agent/agent-base/signing-key) — Read the resolved signing key (constructor / set\_signing\_key / SIGNALWIRE\_SIGNING\_KEY env), or std::nullopt when unset. The returned value is the secret — never log it.
- [`stop`](/reference/cpp/signalwire/agent/agent-base/stop)
- [`supported_internal_filler_names`](/reference/cpp/signalwire/agent/agent-base/supported-internal-filler-names) — The complete set of internal SWAIG function names that accept fillers, matching the SWAIGInternalFiller schema definition. Any name outside this set is silently ignored by the runtime — set\_internal\_fillers and add\_internal\_filler warn if you pass an unknown name. Notable absences: change\_step, gather\_submit, and arbitrary user-defined SWAIG function names are NOT supported.
- [`trust_proxy_for_signature`](/reference/cpp/signalwire/agent/agent-base/trust-proxy-for-signature) — If true, X-Forwarded-Proto / X-Forwarded-Host are honored by the webhook middleware when reconstructing the URL. Default false — proxy headers are spoofable so opt in only when the reverse-proxy is trusted.
- [`update_global_data`](/reference/cpp/signalwire/agent/agent-base/update-global-data)
- [`validate_auth`](/reference/cpp/signalwire/agent/agent-base/validate-auth)
- [`validate_tool_token`](/reference/cpp/signalwire/agent/agent-base/validate-tool-token) — Validate a per-call SWAIG-function token. Returns false when the function is not registered, when the SessionManager rejects the token, or on any underlying exception. Python parity: state\_mixin.StateMixin.validate\_tool\_token — rejects unknown function names up-front and swallows exceptions.

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 112.
