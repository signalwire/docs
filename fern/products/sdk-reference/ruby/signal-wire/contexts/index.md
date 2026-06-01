---
slug: "/reference/ruby/signal-wire/contexts"
title: "Contexts"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "module"
  language: "ruby"
  qualified_name: "SignalWire::Contexts"
  parent: "SignalWire"
  module: "SignalWire"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb"
  visibility: "public"
---
# `Contexts`

## Signature

```ruby
module Contexts
```

## Constants

| Name                         | Type                                                                             | Required | Default | Description                                                                                                                                                                                                                                                                                                              |
| ---------------------------- | -------------------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `MAX_CONTEXTS`               | `MAX_CONTEXTS = 50`                                                              | yes      | —       | —                                                                                                                                                                                                                                                                                                                        |
| `MAX_STEPS_PER_CONTEXT`      | `MAX_STEPS_PER_CONTEXT = 100`                                                    | yes      | —       | —                                                                                                                                                                                                                                                                                                                        |
| `RESERVED_NATIVE_TOOL_NAMES` | `RESERVED_NATIVE_TOOL_NAMES = %w[next_step change_context gather_submit].freeze` | yes      | —       | Reserved tool names auto-injected by the runtime when contexts/steps are present. User-defined SWAIG tools must not collide with these names. ContextBuilder#validate! rejects any agent that registers a user tool sharing one of these names — the runtime would never call the user tool because the native one wins. |

## Methods

- [`create_simple_context`](/reference/ruby/signal-wire/contexts/create-simple-context) — Helper to create a standalone context (not via ContextBuilder).

## Classes

- [`Context`](/reference/ruby/signal-wire/contexts/context) — Represents a single context containing multiple steps.
- [`ContextBuilder`](/reference/ruby/signal-wire/contexts/context-builder) — Builder for multi-step, multi-context AI agent workflows.
- [`GatherInfo`](/reference/ruby/signal-wire/contexts/gather-info) — Configuration for gathering information in a step via the C-side gather\_info system.
- [`GatherQuestion`](/reference/ruby/signal-wire/contexts/gather-question) — Represents a single question in a gather\_info configuration.
- [`Step`](/reference/ruby/signal-wire/contexts/step) — Represents a single step within a context.

## Source

[`lib/signalwire/contexts/context_builder.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb)

Line 9.
