---
slug: "/reference/python/signalwire/core/contexts/context"
title: "Context"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.contexts.Context"
  parent: "signalwire.core.contexts"
  module: "signalwire.core.contexts"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py"
---
# `Context`

A single context containing an ordered list of steps.

## Conversation history across context switches

By default (`isolated=False`), switching from one context to another
via `change_context` PRESERVES the entire conversation history. The
user's prior turns and the model's prior responses remain visible
on the next LLM call. The only thing that changes is which step
instructions get injected.

A common confusion: "the AI re-asked for information the user already
gave." If you see this, history loss is almost never the cause —
history is preserved unless you set `isolated=True`. The real cause
is usually one of:

- The destination step's `text` literally tells the model to ask
  ("Ask the user for their account number"). The model follows
  instructions; rephrase to "Confirm the user's account number"
  or have the step instructions check global\_data first.
- The relevant info was never extracted into global\_data, so
  ${var} expansion has nothing to inject and the step prompt
  looks generic. Add a webhook that captures the field.
- You explicitly called `set_isolated(True)` on the destination
  context. Isolated contexts wipe the conversation array on entry.
  Pair with `set_consolidate(True)` if you want a summary instead.

See Context.set\_isolated() for the wipe semantics, and the SDK's
FunctionResult.swml\_change\_step / swml\_change\_context docstrings
for how to communicate transition intent through tool response text
and global\_data.

## Signature

```python
class Context
```

## Properties

| Name   | Type   | Required | Default | Description |
| ------ | ------ | -------- | ------- | ----------- |
| `name` | `name` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/core/contexts/context/init)
- [`add_bullets`](/reference/python/signalwire/core/contexts/context/add-bullets) — Add a POM section with bullet points to the context prompt
- [`add_enter_filler`](/reference/python/signalwire/core/contexts/context/add-enter-filler) — Add enter fillers for a specific language
- [`add_exit_filler`](/reference/python/signalwire/core/contexts/context/add-exit-filler) — Add exit fillers for a specific language
- [`add_section`](/reference/python/signalwire/core/contexts/context/add-section) — Add a POM section to the context prompt
- [`add_step`](/reference/python/signalwire/core/contexts/context/add-step) — Add a new step to this context.
- [`add_system_bullets`](/reference/python/signalwire/core/contexts/context/add-system-bullets) — Add a POM section with bullet points to the system prompt
- [`add_system_section`](/reference/python/signalwire/core/contexts/context/add-system-section) — Add a POM section to the system prompt
- [`get_step`](/reference/python/signalwire/core/contexts/context/get-step) — Get an existing step by name for inspection or modification.
- [`move_step`](/reference/python/signalwire/core/contexts/context/move-step) — Move an existing step to a specific position in the step order.
- [`remove_step`](/reference/python/signalwire/core/contexts/context/remove-step) — Remove a step from this context entirely.
- [`set_consolidate`](/reference/python/signalwire/core/contexts/context/set-consolidate) — Set whether to consolidate conversation history when entering this context
- [`set_enter_fillers`](/reference/python/signalwire/core/contexts/context/set-enter-fillers) — Set fillers that the AI says when entering this context
- [`set_exit_fillers`](/reference/python/signalwire/core/contexts/context/set-exit-fillers) — Set fillers that the AI says when exiting this context
- [`set_full_reset`](/reference/python/signalwire/core/contexts/context/set-full-reset) — Set whether to do full reset when entering this context
- [`set_initial_step`](/reference/python/signalwire/core/contexts/context/set-initial-step) — Set which step the context starts on when entered.
- [`set_isolated`](/reference/python/signalwire/core/contexts/context/set-isolated) — Mark this context as isolated — entering it wipes conversation history.
- [`set_post_prompt`](/reference/python/signalwire/core/contexts/context/set-post-prompt) — Set post prompt override for this context
- [`set_prompt`](/reference/python/signalwire/core/contexts/context/set-prompt) — Set the context's prompt text directly
- [`set_system_prompt`](/reference/python/signalwire/core/contexts/context/set-system-prompt) — Set system prompt for context switching (triggers context reset)
- [`set_user_prompt`](/reference/python/signalwire/core/contexts/context/set-user-prompt) — Set user prompt to inject when entering this context
- [`set_valid_contexts`](/reference/python/signalwire/core/contexts/context/set-valid-contexts) — Set which contexts can be navigated to from this context
- [`set_valid_steps`](/reference/python/signalwire/core/contexts/context/set-valid-steps) — Set which steps can be navigated to from any step in this context
- [`to_dict`](/reference/python/signalwire/core/contexts/context/to-dict) — Convert context to dictionary for SWML generation

## Source

[`/src/signalwire/signalwire/core/contexts.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py)

Line 538.
