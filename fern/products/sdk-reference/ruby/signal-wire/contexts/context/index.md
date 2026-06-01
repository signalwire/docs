---
slug: "/reference/ruby/signal-wire/contexts/context"
title: "Context"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Contexts::Context"
  parent: "SignalWire::Contexts"
  module: "SignalWire.Contexts"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb"
  visibility: "public"
---
# `Context`

Represents a single context containing multiple steps.

## Signature

```ruby
class Context < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`_initial_step`](/reference/ruby/signal-wire/contexts/context/initial-step)
- [`_step_order`](/reference/ruby/signal-wire/contexts/context/step-order)
- [`add_bullets`](/reference/ruby/signal-wire/contexts/context/add-bullets) — Add a POM section with bullets to the context prompt.
- [`add_enter_filler`](/reference/ruby/signal-wire/contexts/context/add-enter-filler)
- [`add_exit_filler`](/reference/ruby/signal-wire/contexts/context/add-exit-filler)
- [`add_section`](/reference/ruby/signal-wire/contexts/context/add-section) — Add a POM section to the context prompt.
- [`add_step`](/reference/ruby/signal-wire/contexts/context/add-step) — Add a new step. Returns the new Step object (not self).
- [`add_system_bullets`](/reference/ruby/signal-wire/contexts/context/add-system-bullets) — Add a POM section with bullets to the system prompt.
- [`add_system_section`](/reference/ruby/signal-wire/contexts/context/add-system-section) — Add a POM section to the system prompt.
- [`get_step`](/reference/ruby/signal-wire/contexts/context/get-step) — Get an existing step by name. Returns Step or nil.
- [`initialize`](/reference/ruby/signal-wire/contexts/context/initialize)
- [`move_step`](/reference/ruby/signal-wire/contexts/context/move-step) — Move an existing step to a specific position. Returns self.
- [`name`](/reference/ruby/signal-wire/contexts/context/name) — Returns the value of attribute name.
- [`remove_step`](/reference/ruby/signal-wire/contexts/context/remove-step) — Remove a step by name. Returns self.
- [`set_consolidate`](/reference/ruby/signal-wire/contexts/context/set-consolidate)
- [`set_enter_fillers`](/reference/ruby/signal-wire/contexts/context/set-enter-fillers)
- [`set_exit_fillers`](/reference/ruby/signal-wire/contexts/context/set-exit-fillers)
- [`set_full_reset`](/reference/ruby/signal-wire/contexts/context/set-full-reset)
- [`set_initial_step`](/reference/ruby/signal-wire/contexts/context/set-initial-step) — Set which step the context starts on when entered.
- [`set_isolated`](/reference/ruby/signal-wire/contexts/context/set-isolated) — Mark this context as isolated — entering it wipes conversation history.
- [`set_post_prompt`](/reference/ruby/signal-wire/contexts/context/set-post-prompt)
- [`set_prompt`](/reference/ruby/signal-wire/contexts/context/set-prompt)
- [`set_system_prompt`](/reference/ruby/signal-wire/contexts/context/set-system-prompt)
- [`set_user_prompt`](/reference/ruby/signal-wire/contexts/context/set-user-prompt)
- [`set_valid_contexts`](/reference/ruby/signal-wire/contexts/context/set-valid-contexts)
- [`set_valid_steps`](/reference/ruby/signal-wire/contexts/context/set-valid-steps)
- [`to_h`](/reference/ruby/signal-wire/contexts/context/to-h)

## Source

[`lib/signalwire/contexts/context_builder.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb)

Line 342.
