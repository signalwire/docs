---
slug: "/reference/python/signalwire/core/mixins/prompt-mixin/prompt-mixin"
title: "PromptMixin"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.mixins.prompt_mixin.PromptMixin"
  parent: "signalwire.core.mixins.prompt_mixin"
  module: "signalwire.core.mixins.prompt_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/prompt_mixin.py"
---
# `PromptMixin`

Mixin class containing all prompt-related methods for AgentBase

## Signature

```python
class PromptMixin
```

## Properties

| Name       | Type             | Required | Default | Description                           |
| ---------- | ---------------- | -------- | ------- | ------------------------------------- |
| `contexts` | `ContextBuilder` | yes      | —       | Get the ContextBuilder for this agent |

## Methods

- [`define_contexts`](/reference/python/signalwire/core/mixins/prompt-mixin/prompt-mixin/define-contexts) — Define contexts and steps for this agent (alternative to POM/prompt)
- [`get_post_prompt`](/reference/python/signalwire/core/mixins/prompt-mixin/prompt-mixin/get-post-prompt) — Get the post-prompt for the agent
- [`get_prompt`](/reference/python/signalwire/core/mixins/prompt-mixin/prompt-mixin/get-prompt) — Get the prompt for the agent
- [`prompt_add_section`](/reference/python/signalwire/core/mixins/prompt-mixin/prompt-mixin/prompt-add-section) — Add a section to the prompt
- [`prompt_add_subsection`](/reference/python/signalwire/core/mixins/prompt-mixin/prompt-mixin/prompt-add-subsection) — Add a subsection to an existing section (creating parent if needed)
- [`prompt_add_to_section`](/reference/python/signalwire/core/mixins/prompt-mixin/prompt-mixin/prompt-add-to-section) — Add content to an existing section (creating it if needed)
- [`prompt_has_section`](/reference/python/signalwire/core/mixins/prompt-mixin/prompt-mixin/prompt-has-section) — Check if a section exists in the prompt
- [`reset_contexts`](/reference/python/signalwire/core/mixins/prompt-mixin/prompt-mixin/reset-contexts) — Remove all contexts, returning the agent to a no-contexts state.
- [`set_post_prompt`](/reference/python/signalwire/core/mixins/prompt-mixin/prompt-mixin/set-post-prompt) — Set the post-prompt text for summary generation
- [`set_prompt_pom`](/reference/python/signalwire/core/mixins/prompt-mixin/prompt-mixin/set-prompt-pom) — Set the prompt as a POM dictionary
- [`set_prompt_text`](/reference/python/signalwire/core/mixins/prompt-mixin/prompt-mixin/set-prompt-text) — Set the prompt as raw text instead of using POM

## Source

[`/src/signalwire/signalwire/core/mixins/prompt_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/prompt_mixin.py)

Line 19.
