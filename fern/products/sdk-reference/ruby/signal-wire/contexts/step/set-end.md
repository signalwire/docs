---
slug: "/reference/ruby/signal-wire/contexts/step/set-end"
title: "set_end"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Contexts::Step#set_end"
  parent: "SignalWire::Contexts::Step"
  module: "SignalWire.Contexts.Step"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb"
  visibility: "public"
---
# `set_end`

Mark this step as terminal for the step flow.

IMPORTANT: +is\_end+ = true does NOT end the conversation or hang
up the call. It exits step mode entirely after this step
executes — clearing the steps list, current step index,
valid\_steps, and valid\_contexts. The agent keeps running, but
operates only under the base system prompt and the
context-level prompt; no more step instructions are injected
and no more +next\_step+ tool is offered.

To actually end the call, call a hangup tool or define a
hangup hook.

## Signature

```ruby
def set_end(is_end)
```

## Parameters

| Name     | Type | Required | Default | Description |
| -------- | ---- | -------- | ------- | ----------- |
| `is_end` | —    | yes      | —       | —           |

## Source

[`lib/signalwire/contexts/context_builder.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb)

Line 201.
