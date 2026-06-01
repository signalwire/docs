---
slug: "/reference/perl/signal-wire/agent/agent-base/agent-base"
title: "AgentBase"
sdk_label: "Perl SDK"
icon: "perl"
lustri:
  auto_generated: true
  kind: "module"
  language: "perl"
  qualified_name: "SignalWire::Agent::AgentBase"
  module: "SignalWire.Agent.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-perl/blob/main/lib/SignalWire/Agent/AgentBase.pm"
---
# `AgentBase`

## Signature

```perl
package SignalWire::Agent::AgentBase
```

## Inheritance

**Extends:** [SignalWire::SWML::Service](/reference/perl/signal-wire/swml/service/service)

## Methods

- [`add_function_include`](/reference/perl/signal-wire/agent/agent-base/agent-base/add-function-include)
- [`add_hint`](/reference/perl/signal-wire/agent/agent-base/agent-base/add-hint)
- [`add_hints`](/reference/perl/signal-wire/agent/agent-base/agent-base/add-hints)
- [`add_internal_filler`](/reference/perl/signal-wire/agent/agent-base/agent-base/add-internal-filler)
- [`add_language`](/reference/perl/signal-wire/agent/agent-base/agent-base/add-language)
- [`add_mcp_server`](/reference/perl/signal-wire/agent/agent-base/agent-base/add-mcp-server)
- [`add_pattern_hint`](/reference/perl/signal-wire/agent/agent-base/agent-base/add-pattern-hint)
- [`add_post_ai_verb`](/reference/perl/signal-wire/agent/agent-base/agent-base/add-post-ai-verb)
- [`add_post_answer_verb`](/reference/perl/signal-wire/agent/agent-base/agent-base/add-post-answer-verb)
- [`add_pre_answer_verb`](/reference/perl/signal-wire/agent/agent-base/agent-base/add-pre-answer-verb)
- [`add_pronunciation`](/reference/perl/signal-wire/agent/agent-base/agent-base/add-pronunciation)
- [`add_skill`](/reference/perl/signal-wire/agent/agent-base/agent-base/add-skill)
- [`add_swaig_query_params`](/reference/perl/signal-wire/agent/agent-base/agent-base/add-swaig-query-params)
- [`BUILD`](/reference/perl/signal-wire/agent/agent-base/agent-base/build)
- [`clear_post_ai_verbs`](/reference/perl/signal-wire/agent/agent-base/agent-base/clear-post-ai-verbs)
- [`clear_post_answer_verbs`](/reference/perl/signal-wire/agent/agent-base/agent-base/clear-post-answer-verbs)
- [`clear_pre_answer_verbs`](/reference/perl/signal-wire/agent/agent-base/agent-base/clear-pre-answer-verbs)
- [`clear_swaig_query_params`](/reference/perl/signal-wire/agent/agent-base/agent-base/clear-swaig-query-params)
- [`contexts`](/reference/perl/signal-wire/agent/agent-base/agent-base/contexts)
- [`create_tool_token`](/reference/perl/signal-wire/agent/agent-base/agent-base/create-tool-token)
- [`define_contexts`](/reference/perl/signal-wire/agent/agent-base/agent-base/define-contexts)
- [`enable_debug_events`](/reference/perl/signal-wire/agent/agent-base/agent-base/enable-debug-events)
- [`enable_mcp_server`](/reference/perl/signal-wire/agent/agent-base/agent-base/enable-mcp-server)
- [`extract_sip_username`](/reference/perl/signal-wire/agent/agent-base/agent-base/extract-sip-username)
- [`get_contexts`](/reference/perl/signal-wire/agent/agent-base/agent-base/get-contexts)
- [`get_full_url`](/reference/perl/signal-wire/agent/agent-base/agent-base/get-full-url)
- [`get_language_params`](/reference/perl/signal-wire/agent/agent-base/agent-base/get-language-params)
- [`get_post_prompt`](/reference/perl/signal-wire/agent/agent-base/agent-base/get-post-prompt)
- [`get_prompt`](/reference/perl/signal-wire/agent/agent-base/agent-base/get-prompt)
- [`get_raw_prompt`](/reference/perl/signal-wire/agent/agent-base/agent-base/get-raw-prompt)
- [`has_skill`](/reference/perl/signal-wire/agent/agent-base/agent-base/has-skill)
- [`list_skills`](/reference/perl/signal-wire/agent/agent-base/agent-base/list-skills)
- [`list_tool_names`](/reference/perl/signal-wire/agent/agent-base/agent-base/list-tool-names)
- [`manual_set_proxy_url`](/reference/perl/signal-wire/agent/agent-base/agent-base/manual-set-proxy-url)
- [`on_debug_event`](/reference/perl/signal-wire/agent/agent-base/agent-base/on-debug-event)
- [`on_summary`](/reference/perl/signal-wire/agent/agent-base/agent-base/on-summary)
- [`pom`](/reference/perl/signal-wire/agent/agent-base/agent-base/pom)
- [`prompt_add_section`](/reference/perl/signal-wire/agent/agent-base/agent-base/prompt-add-section)
- [`prompt_add_subsection`](/reference/perl/signal-wire/agent/agent-base/agent-base/prompt-add-subsection)
- [`prompt_add_to_section`](/reference/perl/signal-wire/agent/agent-base/agent-base/prompt-add-to-section)
- [`prompt_has_section`](/reference/perl/signal-wire/agent/agent-base/agent-base/prompt-has-section)
- [`psgi_app`](/reference/perl/signal-wire/agent/agent-base/agent-base/psgi-app)
- [`remove_skill`](/reference/perl/signal-wire/agent/agent-base/agent-base/remove-skill)
- [`render_swml`](/reference/perl/signal-wire/agent/agent-base/agent-base/render-swml)
- [`reset_contexts`](/reference/perl/signal-wire/agent/agent-base/agent-base/reset-contexts)
- [`run`](/reference/perl/signal-wire/agent/agent-base/agent-base/run)
- [`serve`](/reference/perl/signal-wire/agent/agent-base/agent-base/serve)
- [`set_answer_config`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-answer-config)
- [`set_dynamic_config_callback`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-dynamic-config-callback)
- [`set_function_includes`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-function-includes)
- [`set_global_data`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-global-data)
- [`set_internal_fillers`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-internal-fillers)
- [`set_language_params`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-language-params)
- [`set_languages`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-languages)
- [`set_native_functions`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-native-functions)
- [`set_param`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-param)
- [`set_params`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-params)
- [`set_post_prompt`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-post-prompt)
- [`set_post_prompt_llm_params`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-post-prompt-llm-params)
- [`set_post_prompt_url`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-post-prompt-url)
- [`set_prompt_llm_params`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-prompt-llm-params)
- [`set_prompt_pom`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-prompt-pom)
- [`set_prompt_text`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-prompt-text)
- [`set_pronunciations`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-pronunciations)
- [`set_web_hook_url`](/reference/perl/signal-wire/agent/agent-base/agent-base/set-web-hook-url)
- [`update_global_data`](/reference/perl/signal-wire/agent/agent-base/agent-base/update-global-data)
- [`validate_tool_token`](/reference/perl/signal-wire/agent/agent-base/agent-base/validate-tool-token)

## Source

[`lib/SignalWire/Agent/AgentBase.pm`](https://github.com/signalwire/signalwire-perl/blob/main/lib/SignalWire/Agent/AgentBase.pm)

Line 1.
