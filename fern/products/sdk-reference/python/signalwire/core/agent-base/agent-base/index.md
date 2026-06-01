---
slug: "/reference/python/signalwire/core/agent-base/agent-base"
title: "AgentBase"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.agent_base.AgentBase"
  parent: "signalwire.core.agent_base"
  module: "signalwire.core.agent_base"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py"
---
# `AgentBase`

Base class for all SignalWire AI Agents.

This class extends SWMLService and provides enhanced functionality for building agents including:

- Prompt building and customization
- SWML rendering
- SWAIG function definition and execution
- Web service for serving SWML and handling webhooks
- Security and session management

Subclassing options:

1. Simple override of get\_prompt() for raw text
2. Using prompt\_\* methods for structured prompts
3. Declarative PROMPT\_SECTIONS class attribute

## Signature

```python
class AgentBase(AuthMixin, WebMixin, SWMLService, PromptMixin, SkillMixin, AIConfigMixin, ServerlessMixin, StateMixin, MCPServerMixin)
```

## Inheritance

**Extends:** [AuthMixin](/reference/python/signalwire/core/mixins/auth-mixin/auth-mixin), [WebMixin](/reference/python/signalwire/core/mixins/web-mixin/web-mixin), [SWMLService](/reference/python/signalwire/core/swml-service/swml-service), [PromptMixin](/reference/python/signalwire/core/mixins/prompt-mixin/prompt-mixin), [SkillMixin](/reference/python/signalwire/core/mixins/skill-mixin/skill-mixin), [AIConfigMixin](/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin), [ServerlessMixin](/reference/python/signalwire/core/mixins/serverless-mixin/serverless-mixin), [StateMixin](/reference/python/signalwire/core/mixins/state-mixin/state-mixin), [MCPServerMixin](/reference/python/signalwire/core/mixins/mcp-server-mixin/mcp-server-mixin)

## Properties

| Name               | Type               | Required | Default | Description |
| ------------------ | ------------------ | -------- | ------- | ----------- |
| `agent_id`         | `agent_id`         | yes      | —       | —           |
| `log`              | `log`              | yes      | —       | —           |
| `native_functions` | `native_functions` | yes      | —       | —           |
| `pom`              | `pom`              | yes      | —       | —           |
| `PROMPT_SECTIONS`  | `PROMPT_SECTIONS`  | yes      | —       | —           |
| `signing_key`      | `signing_key`      | yes      | —       | —           |
| `skill_manager`    | `skill_manager`    | yes      | —       | —           |
| `tool`             | `tool`             | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/core/agent-base/agent-base/init) — Initialize a new agent
- [`add_answer_verb`](/reference/python/signalwire/core/agent-base/agent-base/add-answer-verb) — Configure the answer verb.
- [`add_post_ai_verb`](/reference/python/signalwire/core/agent-base/agent-base/add-post-ai-verb) — Add a verb to run after the AI conversation ends.
- [`add_post_answer_verb`](/reference/python/signalwire/core/agent-base/agent-base/add-post-answer-verb) — Add a verb to run after the call is answered but before the AI starts.
- [`add_pre_answer_verb`](/reference/python/signalwire/core/agent-base/agent-base/add-pre-answer-verb) — Add a verb to run before the call is answered.
- [`add_swaig_query_params`](/reference/python/signalwire/core/agent-base/agent-base/add-swaig-query-params) — Add query parameters that will be included in all SWAIG webhook URLs
- [`auto_map_sip_usernames`](/reference/python/signalwire/core/agent-base/agent-base/auto-map-sip-usernames) — Automatically register common SIP usernames based on this agent's name and route
- [`clear_post_ai_verbs`](/reference/python/signalwire/core/agent-base/agent-base/clear-post-ai-verbs) — Remove all post-AI verbs.
- [`clear_post_answer_verbs`](/reference/python/signalwire/core/agent-base/agent-base/clear-post-answer-verbs) — Remove all post-answer verbs.
- [`clear_pre_answer_verbs`](/reference/python/signalwire/core/agent-base/agent-base/clear-pre-answer-verbs) — Remove all pre-answer verbs.
- [`clear_swaig_query_params`](/reference/python/signalwire/core/agent-base/agent-base/clear-swaig-query-params) — Clear all SWAIG query parameters
- [`enable_sip_routing`](/reference/python/signalwire/core/agent-base/agent-base/enable-sip-routing) — Enable SIP-based routing for this agent
- [`get_full_url`](/reference/python/signalwire/core/agent-base/agent-base/get-full-url) — Get the full URL for this agent's endpoint
- [`get_name`](/reference/python/signalwire/core/agent-base/agent-base/get-name) — Get agent name
- [`on_debug_event`](/reference/python/signalwire/core/agent-base/agent-base/on-debug-event) — Register a handler for debug webhook events.
- [`on_summary`](/reference/python/signalwire/core/agent-base/agent-base/on-summary) — Called when a post-prompt summary is received
- [`register_sip_username`](/reference/python/signalwire/core/agent-base/agent-base/register-sip-username) — Register a SIP username that should be routed to this agent
- [`set_post_prompt_url`](/reference/python/signalwire/core/agent-base/agent-base/set-post-prompt-url) — Override the default post\_prompt\_url with a supplied URL string
- [`set_web_hook_url`](/reference/python/signalwire/core/agent-base/agent-base/set-web-hook-url) — Override the default web\_hook\_url with a supplied URL string

## Source

[`/src/signalwire/signalwire/core/agent_base.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py)

Line 78.
