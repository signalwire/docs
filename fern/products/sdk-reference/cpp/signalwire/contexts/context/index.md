---
slug: "/reference/cpp/signalwire/contexts/context"
title: "Context"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::contexts::Context"
  parent: "signalwire::contexts"
  module: "signalwire.contexts"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp"
  visibility: "public"
---
# `Context`

## Signature

```cpp
class signalwire::contexts::Context
```

## Methods

- [`add_bullets`](/reference/cpp/signalwire/contexts/context/add-bullets) — Add a POM section with bullets to the context prompt.
- [`add_enter_filler`](/reference/cpp/signalwire/contexts/context/add-enter-filler) — Add enter filler for a specific language.
- [`add_exit_filler`](/reference/cpp/signalwire/contexts/context/add-exit-filler) — Add exit filler for a specific language.
- [`add_section`](/reference/cpp/signalwire/contexts/context/add-section) — Add a POM section to the context prompt.
- [`add_step`](/reference/cpp/signalwire/contexts/context/add-step) — Add a new step to this context (returns reference for chaining).
- [`add_system_bullets`](/reference/cpp/signalwire/contexts/context/add-system-bullets) — Add a POM section with bullets to the system prompt.
- [`add_system_section`](/reference/cpp/signalwire/contexts/context/add-system-section) — Add a POM section to the system prompt.
- [`Context`](/reference/cpp/signalwire/contexts/context/context)
- [`get_step`](/reference/cpp/signalwire/contexts/context/get-step) — Get an existing step by name.
- [`has_steps`](/reference/cpp/signalwire/contexts/context/has-steps)
- [`initial_step`](/reference/cpp/signalwire/contexts/context/initial-step)
- [`move_step`](/reference/cpp/signalwire/contexts/context/move-step) — Move a step to a specific position.
- [`name`](/reference/cpp/signalwire/contexts/context/name)
- [`remove_step`](/reference/cpp/signalwire/contexts/context/remove-step) — Remove a step.
- [`set_consolidate`](/reference/cpp/signalwire/contexts/context/set-consolidate) — Set consolidate.
- [`set_enter_fillers`](/reference/cpp/signalwire/contexts/context/set-enter-fillers) — Set enter fillers.
- [`set_exit_fillers`](/reference/cpp/signalwire/contexts/context/set-exit-fillers) — Set exit fillers.
- [`set_full_reset`](/reference/cpp/signalwire/contexts/context/set-full-reset) — Set full reset.
- [`set_initial_step`](/reference/cpp/signalwire/contexts/context/set-initial-step) — Set which step the context starts on when entered. By default, a context starts on its first step (index 0). Use this to skip a preamble step on re-entry via change\_context.
- [`set_isolated`](/reference/cpp/signalwire/contexts/context/set-isolated) — Mark this context as isolated — entering it wipes conversation history. When isolated=true and the context is entered via change\_context, the runtime wipes the conversation array. The model starts fresh with only the new context's system\_prompt + step instructions, with no memory of prior turns. EXCEPTION — reset overrides the wipe: If the context also has a reset configuration (via set\_consolidate or set\_full\_reset), the wipe is skipped in favor of the reset behavior. Use reset with consolidate=true to summarize prior history into a single message instead of dropping it entirely. Use cases: switching to a sensitive billing flow that should not see prior small-talk; handing off to a different agent persona; resetting after a long off-topic detour.
- [`set_post_prompt`](/reference/cpp/signalwire/contexts/context/set-post-prompt) — Set post prompt override.
- [`set_prompt`](/reference/cpp/signalwire/contexts/context/set-prompt) — Set prompt text directly.
- [`set_system_prompt`](/reference/cpp/signalwire/contexts/context/set-system-prompt) — Set system prompt (for context switching).
- [`set_user_prompt`](/reference/cpp/signalwire/contexts/context/set-user-prompt) — Set user prompt.
- [`set_valid_contexts`](/reference/cpp/signalwire/contexts/context/set-valid-contexts) — Set valid contexts for navigation.
- [`set_valid_steps`](/reference/cpp/signalwire/contexts/context/set-valid-steps) — Set valid steps for all steps in this context.
- [`step_order`](/reference/cpp/signalwire/contexts/context/step-order)
- [`steps`](/reference/cpp/signalwire/contexts/context/steps)
- [`to_json`](/reference/cpp/signalwire/contexts/context/to-json) — Serialize to JSON.
- [`valid_contexts`](/reference/cpp/signalwire/contexts/context/valid-contexts)

## Source

[`include/signalwire/contexts/contexts.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp)

Line 234.
