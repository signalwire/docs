---
slug: "/reference/ruby/signal-wire/agent-base/on-summary"
title: "on_summary"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase#on_summary"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `on_summary`

Python parity: `on_summary(self, summary, raw_data=None)` is a
virtual hook called when a post-prompt summary is received.
Ruby supports two equivalent shapes:

1. **Registration** (Ruby idiom) — pass a block to install a
   callback. The block receives `(summary, raw_data)` when a
   summary is delivered. `on_summary { |sum, raw| ... }`
2. **Override** (Python idiom) — subclass and override
   `on_summary(summary, raw_data = nil)`. Default
   implementation calls the registered block (if any) and
   otherwise no-ops.

## Signature

```ruby
def on_summary(summary = nil, raw_data = nil, &block)
```

## Parameters

| Name       | Type          | Required | Default | Description                |
| ---------- | ------------- | -------- | ------- | -------------------------- |
| `summary`  | `Hash \| nil` | no       | `nil`   | the post-prompt summary    |
| `raw_data` | `Hash \| nil` | no       | `nil`   | the complete raw POST data |
| `...block` | —             | no       | —       | —                          |

## Yields

- `summary, raw_data` — optional callback registration

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 1424.
