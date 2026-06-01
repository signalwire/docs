---
slug: "/reference/ruby/signal-wire/contexts/context-builder"
title: "ContextBuilder"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Contexts::ContextBuilder"
  parent: "SignalWire::Contexts"
  module: "SignalWire.Contexts"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb"
  visibility: "public"
---
# `ContextBuilder`

Builder for multi-step, multi-context AI agent workflows.

A ContextBuilder owns one or more Contexts; each Context owns an
ordered list of Steps. Only one context and one step is active at
a time. Per chat turn, the runtime injects the current step's
instructions as a system message, then asks the LLM for a
response.

\== Native tools auto-injected by the runtime

When a step (or its enclosing context) declares +valid\_steps+ or
+valid\_contexts+, the runtime auto-injects two native tools so
the model can navigate the flow:

- +next\_step(step: enum)+         — present when valid\_steps is set
- +change\_context(context: enum)+ — present when valid\_contexts is set

Their +enum+ schemas are rewritten on every turn to match
whatever valid\_steps / valid\_contexts apply to the current step.
You do NOT need to define these tools yourself; they appear
automatically.

A third native tool — +gather\_submit+ — is injected during
gather\_info questioning (see Step#set\_gather\_info /
Step#add\_gather\_question).

These three names — +next\_step+, +change\_context+,
+gather\_submit+ — are reserved. +validate!+ will reject any agent
that defines a SWAIG tool with one of these names. See
RESERVED\_NATIVE\_TOOL\_NAMES.

\== Function whitelisting (Step#set\_functions)

Each step may declare a +functions+ whitelist. The whitelist is
applied in-memory at the start of each LLM turn. CRITICALLY: if a
step does NOT declare a +functions+ field, it INHERITS the
previous step's active set. See Step#set\_functions for details
and examples.

## Signature

```ruby
class ContextBuilder < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`add_context`](/reference/ruby/signal-wire/contexts/context-builder/add-context) — Add a new context. Returns the Context object.
- [`attach_agent`](/reference/ruby/signal-wire/contexts/context-builder/attach-agent) — Attach an agent reference so +validate!+ can check user-defined tool names against RESERVED\_NATIVE\_TOOL\_NAMES. Called internally by AgentBase#define\_contexts.
- [`get_context`](/reference/ruby/signal-wire/contexts/context-builder/get-context) — Get an existing context by name. Returns Context or nil.
- [`initialize`](/reference/ruby/signal-wire/contexts/context-builder/initialize) — Python parity: `ContextBuilder.__init__(self, agent)` accepts an owning agent so `validate!` can introspect registered SWAIG tools when checking for reserved-name collisions. Ruby allows nil for standalone use (tests, idiom of building a builder before attaching).
- [`reset`](/reference/ruby/signal-wire/contexts/context-builder/reset) — Remove all contexts, returning the builder to its initial state. Use this in a dynamic config callback when you need to rebuild contexts from scratch for a specific request.
- [`to_h`](/reference/ruby/signal-wire/contexts/context-builder/to-h)
- [`validate!`](/reference/ruby/signal-wire/contexts/context-builder/validate) — Validate the full configuration. Raises ArgumentError on problems.

## Source

[`lib/signalwire/contexts/context_builder.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb)

Line 666.
