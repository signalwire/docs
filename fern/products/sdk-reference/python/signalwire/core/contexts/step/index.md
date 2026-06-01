---
slug: "/reference/python/signalwire/core/contexts/step"
title: "Step"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.contexts.Step"
  parent: "signalwire.core.contexts"
  module: "signalwire.core.contexts"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py"
---
# `Step`

Represents a single step within a context

## Signature

```python
class Step
```

## Properties

| Name   | Type   | Required | Default | Description |
| ------ | ------ | -------- | ------- | ----------- |
| `name` | `name` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/core/contexts/step/init)
- [`add_bullets`](/reference/python/signalwire/core/contexts/step/add-bullets) — Add a POM section with bullet points
- [`add_gather_question`](/reference/python/signalwire/core/contexts/step/add-gather-question) — Add a question to this step's gather\_info configuration. set\_gather\_info() must be called before this method.
- [`add_section`](/reference/python/signalwire/core/contexts/step/add-section) — Add a POM section to the step
- [`clear_sections`](/reference/python/signalwire/core/contexts/step/clear-sections) — Remove all POM sections and direct text from this step, allowing it to be repopulated with new content.
- [`set_end`](/reference/python/signalwire/core/contexts/step/set-end) — Mark this step as terminal for the step flow.
- [`set_functions`](/reference/python/signalwire/core/contexts/step/set-functions) — Set which non-internal functions are callable while this step is active.
- [`set_gather_info`](/reference/python/signalwire/core/contexts/step/set-gather-info) — Enable info gathering for this step. Questions are presented one at a time via dynamic step instruction re-injection, producing zero tool\_call/tool\_result entries in LLM-visible history.
- [`set_reset_consolidate`](/reference/python/signalwire/core/contexts/step/set-reset-consolidate) — Set whether to consolidate conversation when this step switches contexts
- [`set_reset_full_reset`](/reference/python/signalwire/core/contexts/step/set-reset-full-reset) — Set whether to do full reset when this step switches contexts
- [`set_reset_system_prompt`](/reference/python/signalwire/core/contexts/step/set-reset-system-prompt) — Set system prompt for context switching when this step navigates to a context
- [`set_reset_user_prompt`](/reference/python/signalwire/core/contexts/step/set-reset-user-prompt) — Set user prompt for context switching when this step navigates to a context
- [`set_skip_to_next_step`](/reference/python/signalwire/core/contexts/step/set-skip-to-next-step) — Set whether to automatically advance to the next step
- [`set_skip_user_turn`](/reference/python/signalwire/core/contexts/step/set-skip-user-turn) — Set whether to skip waiting for user input after this step
- [`set_step_criteria`](/reference/python/signalwire/core/contexts/step/set-step-criteria) — Set the criteria for determining when this step is complete
- [`set_text`](/reference/python/signalwire/core/contexts/step/set-text) — Set the step's prompt text directly
- [`set_valid_contexts`](/reference/python/signalwire/core/contexts/step/set-valid-contexts) — Set which contexts can be navigated to from this step
- [`set_valid_steps`](/reference/python/signalwire/core/contexts/step/set-valid-steps) — Set which steps can be navigated to from this step
- [`to_dict`](/reference/python/signalwire/core/contexts/step/to-dict) — Convert step to dictionary for SWML generation

## Source

[`/src/signalwire/signalwire/core/contexts.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py)

Line 104.
