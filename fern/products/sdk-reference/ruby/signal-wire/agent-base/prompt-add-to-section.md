---
slug: "/reference/ruby/signal-wire/agent-base/prompt-add-to-section"
title: "prompt_add_to_section"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase#prompt_add_to_section"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `prompt_add_to_section`

Append content to an existing POM section, creating it if absent.

Python parity:
`prompt_add_to_section(title, body=None, bullet=None,
bullets=None)`. Supports appending body text, a single bullet,
or a list of bullets.

**Backwards compat:** the original Ruby signature was
`prompt_add_to_section(title, text)`. When called with two
positional arguments the second becomes `body`; this preserves
existing call sites while still supporting Python's keyword form.

## Signature

```ruby
def prompt_add_to_section(title, body_arg = nil, body: nil, bullet: nil, bullets: nil)
```

## Parameters

| Name       | Type     | Required | Default | Description   |
| ---------- | -------- | -------- | ------- | ------------- |
| `title`    | `String` | yes      | —       | section title |
| `body_arg` | —        | no       | `nil`   | —             |
| `body:`    | —        | no       | `nil`   | —             |
| `bullet:`  | —        | no       | `nil`   | —             |
| `bullets:` | —        | no       | `nil`   | —             |

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 309.
