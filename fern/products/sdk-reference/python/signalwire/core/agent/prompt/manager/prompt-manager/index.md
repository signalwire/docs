---
slug: "/reference/python/signalwire/core/agent/prompt/manager/prompt-manager"
title: "PromptManager"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.agent.prompt.manager.PromptManager"
  parent: "signalwire.core.agent.prompt.manager"
  module: "signalwire.core.agent.prompt.manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent/prompt/manager.py"
---
# `PromptManager`

Manages prompt building and configuration.

## Signature

```python
class PromptManager
```

## Properties

| Name    | Type    | Required | Default | Description |
| ------- | ------- | -------- | ------- | ----------- |
| `agent` | `agent` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/init) — Initialize PromptManager with reference to parent agent.
- [`define_contexts`](/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/define-contexts) — Define contexts for the agent.
- [`get_contexts`](/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/get-contexts) — Get the contexts configuration.
- [`get_post_prompt`](/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/get-post-prompt) — Get the post-prompt text.
- [`get_prompt`](/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/get-prompt) — Get the prompt configuration.
- [`get_raw_prompt`](/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/get-raw-prompt) — Get the raw prompt text if set.
- [`prompt_add_section`](/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/prompt-add-section) — Add a section to the prompt.
- [`prompt_add_subsection`](/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/prompt-add-subsection) — Add a subsection to an existing section (creating parent if needed).
- [`prompt_add_to_section`](/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/prompt-add-to-section) — Add content to an existing section (creating it if needed).
- [`prompt_has_section`](/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/prompt-has-section) — Check if a section exists in the prompt.
- [`set_post_prompt`](/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/set-post-prompt) — Set the post-prompt text.
- [`set_prompt_pom`](/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/set-prompt-pom) — Set the prompt as a POM dictionary.
- [`set_prompt_text`](/reference/python/signalwire/core/agent/prompt/manager/prompt-manager/set-prompt-text) — Set the agent's prompt as raw text.

## Source

[`/src/signalwire/signalwire/core/agent/prompt/manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent/prompt/manager.py)

Line 20.
