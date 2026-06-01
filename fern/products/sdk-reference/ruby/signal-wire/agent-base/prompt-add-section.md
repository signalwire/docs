---
slug: "/reference/ruby/signal-wire/agent-base/prompt-add-section"
title: "prompt_add_section"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase#prompt_add_section"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `prompt_add_section`

Add a POM section.

Python parity:
`prompt_add_section(title, body="", bullets=None,
numbered=False, numbered_bullets=False, subsections=None)`.

## Signature

```ruby
def prompt_add_section(title, body = nil, bullets: nil, numbered: false, numbered_bullets: false, subsections: nil)
```

## Parameters

| Name                | Type            | Required | Default | Description        |
| ------------------- | --------------- | -------- | ------- | ------------------ |
| `title`             | `String`        | yes      | —       | section title      |
| `body`              | `String \| nil` | no       | `nil`   | optional body text |
| `bullets:`          | —               | no       | `nil`   | —                  |
| `numbered:`         | —               | no       | `false` | —                  |
| `numbered_bullets:` | —               | no       | `false` | —                  |
| `subsections:`      | —               | no       | `nil`   | —                  |

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 269.
