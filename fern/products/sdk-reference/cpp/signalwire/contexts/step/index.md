---
slug: "/reference/cpp/signalwire/contexts/step"
title: "Step"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::contexts::Step"
  parent: "signalwire::contexts"
  module: "signalwire.contexts"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp"
  visibility: "public"
---
# `Step`

## Signature

```cpp
class signalwire::contexts::Step
```

## Methods

- [`add_bullets`](/reference/cpp/signalwire/contexts/step/add-bullets) — Add a POM section with bullet points.
- [`add_gather_question`](/reference/cpp/signalwire/contexts/step/add-gather-question) — Add a gather question (set\_gather\_info must be called first). IMPORTANT — gather mode locks function access: While the model is asking gather questions, the runtime forcibly deactivates ALL of the step's other functions. The only callable tools during a gather question are:
- [`add_section`](/reference/cpp/signalwire/contexts/step/add-section) — Add a POM section to the step.
- [`clear_sections`](/reference/cpp/signalwire/contexts/step/clear-sections) — Clear all sections and text.
- [`gather_info`](/reference/cpp/signalwire/contexts/step/gather-info)
- [`name`](/reference/cpp/signalwire/contexts/step/name)
- [`set_end`](/reference/cpp/signalwire/contexts/step/set-end) — Mark this step as terminal for the step flow. IMPORTANT: end=true does NOT end the conversation or hang up the call. It exits step mode entirely after this step executes — clearing the steps list, current step index, valid\_steps, and valid\_contexts. The agent keeps running, but operates only under the base system prompt and the context-level prompt; no more step instructions are injected and no more next\_step tool is offered. To actually end the call, call a hangup tool or define a hangup hook.
- [`set_functions`](/reference/cpp/signalwire/contexts/step/set-functions) — Set which non-internal functions are callable while this step is active. IMPORTANT — inheritance behavior: If you do NOT call this method, the step inherits whichever function set was active on the previous step (or the previous context's last step). The server-side runtime only resets the active set when a step explicitly declares its functions field. This is the most common source of bugs in multi-step agents: forgetting set\_functions on a later step lets the previous step's tools leak through. Best practice is to call set\_functions explicitly on every step that should differ from the previous one. Keep the per-step active set small: LLM tool selection accuracy degrades noticeably past ~7-8 simultaneously-active tools per call. Use per-step whitelisting to partition large tool collections. Internal functions (e.g. gather\_submit, hangup hook) are ALWAYS protected and cannot be deactivated by this whitelist. The native navigation tools next\_step and change\_context are injected automatically when set\_valid\_steps / set\_valid\_contexts is used; they are not affected by this list.
- [`set_gather_info`](/reference/cpp/signalwire/contexts/step/set-gather-info) — Enable info gathering on this step.
- [`set_reset_consolidate`](/reference/cpp/signalwire/contexts/step/set-reset-consolidate)
- [`set_reset_full_reset`](/reference/cpp/signalwire/contexts/step/set-reset-full-reset)
- [`set_reset_system_prompt`](/reference/cpp/signalwire/contexts/step/set-reset-system-prompt) — Set reset parameters for context switching.
- [`set_reset_user_prompt`](/reference/cpp/signalwire/contexts/step/set-reset-user-prompt)
- [`set_skip_to_next_step`](/reference/cpp/signalwire/contexts/step/set-skip-to-next-step) — Set whether to auto-advance to the next step.
- [`set_skip_user_turn`](/reference/cpp/signalwire/contexts/step/set-skip-user-turn) — Set whether to skip waiting for user input.
- [`set_step_criteria`](/reference/cpp/signalwire/contexts/step/set-step-criteria) — Set step completion criteria.
- [`set_text`](/reference/cpp/signalwire/contexts/step/set-text) — Set the step's prompt text directly.
- [`set_valid_contexts`](/reference/cpp/signalwire/contexts/step/set-valid-contexts) — Set which contexts can be navigated to from this step.
- [`set_valid_steps`](/reference/cpp/signalwire/contexts/step/set-valid-steps) — Set which steps can be navigated to from this step.
- [`Step`](/reference/cpp/signalwire/contexts/step/step)
- [`to_json`](/reference/cpp/signalwire/contexts/step/to-json) — Serialize to JSON.
- [`valid_contexts`](/reference/cpp/signalwire/contexts/step/valid-contexts)
- [`valid_steps`](/reference/cpp/signalwire/contexts/step/valid-steps)

## Source

[`include/signalwire/contexts/contexts.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp)

Line 87.
