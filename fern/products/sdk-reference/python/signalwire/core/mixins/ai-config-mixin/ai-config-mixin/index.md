---
slug: "/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin"
title: "AIConfigMixin"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.mixins.ai_config_mixin.AIConfigMixin"
  parent: "signalwire.core.mixins.ai_config_mixin"
  module: "signalwire.core.mixins.ai_config_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py"
---
# `AIConfigMixin`

Mixin class containing all AI configuration methods for AgentBase

## Signature

```python
class AIConfigMixin
```

## Properties

| Name                              | Type                              | Required | Default | Description |
| --------------------------------- | --------------------------------- | -------- | ------- | ----------- |
| `SUPPORTED_INTERNAL_FILLER_NAMES` | `SUPPORTED_INTERNAL_FILLER_NAMES` | yes      | —       | —           |

## Methods

- [`add_function_include`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/add-function-include) — Add a remote function include to the SWAIG configuration
- [`add_hint`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/add-hint) — Add a simple string hint to help the AI agent understand certain words better
- [`add_hints`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/add-hints) — Add multiple string hints
- [`add_internal_filler`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/add-internal-filler) — Add internal fillers for a single internal function and language.
- [`add_language`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/add-language) — Add a language configuration to support multilingual conversations
- [`add_mcp_server`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/add-mcp-server) — Add an external MCP server for tool discovery and invocation.
- [`add_pattern_hint`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/add-pattern-hint) — Add a complex hint with pattern matching
- [`add_pronunciation`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/add-pronunciation) — Add a pronunciation rule to help the AI speak certain words correctly
- [`enable_debug_events`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/enable-debug-events) — Enable debug event webhook for this agent.
- [`enable_mcp_server`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/enable-mcp-server) — Expose this agent's @tool functions as an MCP server endpoint.
- [`get_language_params`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/get-language-params) — Read the per-language `params` dict for a previously-added language.
- [`set_function_includes`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/set-function-includes) — Set the complete list of function includes
- [`set_global_data`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/set-global-data) — Merge data into the global data available to the AI throughout the conversation.
- [`set_internal_fillers`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/set-internal-fillers) — Set internal fillers for native SWAIG functions.
- [`set_language_params`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/set-language-params) — Set (or replace) the per-language `params` dict on an already-added language. Useful when language entries are built up via add\_language() first and engine-specific tuning is added later (e.g., from a config loader). Returns self for chaining.
- [`set_languages`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/set-languages) — Set all language configurations at once
- [`set_native_functions`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/set-native-functions) — Set the list of native functions to enable
- [`set_param`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/set-param) — Set a single AI parameter
- [`set_params`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/set-params) — Set multiple AI parameters at once
- [`set_post_prompt_llm_params`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/set-post-prompt-llm-params) — Set LLM parameters for the post-prompt.
- [`set_prompt_llm_params`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/set-prompt-llm-params) — Set LLM parameters for the main prompt.
- [`set_pronunciations`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/set-pronunciations) — Set all pronunciation rules at once
- [`update_global_data`](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/update-global-data) — Update the global data with new values

## Source

[`/src/signalwire/signalwire/core/mixins/ai_config_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py)

Line 14.
