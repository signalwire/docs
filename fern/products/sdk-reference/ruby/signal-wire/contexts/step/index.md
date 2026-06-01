---
slug: "/reference/ruby/signal-wire/contexts/step"
title: "Step"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Contexts::Step"
  parent: "SignalWire::Contexts"
  module: "SignalWire.Contexts"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb"
  visibility: "public"
---
# `Step`

Represents a single step within a context.

All mutator methods return +self+ for fluent chaining.

## Signature

```ruby
class Step < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`add_bullets`](/reference/ruby/signal-wire/contexts/step/add-bullets) — Add a POM section with bullet points. Mutually exclusive with +set\_text+.
- [`add_gather_question`](/reference/ruby/signal-wire/contexts/step/add-gather-question) — Add a question to this step's gather\_info configuration. +set\_gather\_info+ must be called first.
- [`add_section`](/reference/ruby/signal-wire/contexts/step/add-section) — Add a POM section (title + body). Mutually exclusive with +set\_text+.
- [`clear_sections`](/reference/ruby/signal-wire/contexts/step/clear-sections) — Remove all POM sections and direct text.
- [`initialize`](/reference/ruby/signal-wire/contexts/step/initialize)
- [`name`](/reference/ruby/signal-wire/contexts/step/name) — Returns the value of attribute name.
- [`set_end`](/reference/ruby/signal-wire/contexts/step/set-end) — Mark this step as terminal for the step flow.
- [`set_functions`](/reference/ruby/signal-wire/contexts/step/set-functions) — Set which non-internal functions are callable while this step is active.
- [`set_gather_info`](/reference/ruby/signal-wire/contexts/step/set-gather-info) — Enable info gathering for this step. Returns +self+. After calling this, use +add\_gather\_question+ to define questions.
- [`set_reset_consolidate`](/reference/ruby/signal-wire/contexts/step/set-reset-consolidate)
- [`set_reset_full_reset`](/reference/ruby/signal-wire/contexts/step/set-reset-full-reset)
- [`set_reset_system_prompt`](/reference/ruby/signal-wire/contexts/step/set-reset-system-prompt)
- [`set_reset_user_prompt`](/reference/ruby/signal-wire/contexts/step/set-reset-user-prompt)
- [`set_skip_to_next_step`](/reference/ruby/signal-wire/contexts/step/set-skip-to-next-step)
- [`set_skip_user_turn`](/reference/ruby/signal-wire/contexts/step/set-skip-user-turn)
- [`set_step_criteria`](/reference/ruby/signal-wire/contexts/step/set-step-criteria)
- [`set_text`](/reference/ruby/signal-wire/contexts/step/set-text) — Set the step's prompt text directly. Mutually exclusive with POM sections.
- [`set_valid_contexts`](/reference/ruby/signal-wire/contexts/step/set-valid-contexts)
- [`set_valid_steps`](/reference/ruby/signal-wire/contexts/step/set-valid-steps)
- [`to_h`](/reference/ruby/signal-wire/contexts/step/to-h)

## Source

[`lib/signalwire/contexts/context_builder.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb)

Line 89.
