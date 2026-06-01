---
slug: "/reference/ruby/signal-wire/agent-base/add-language"
title: "add_language"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase#add_language"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `add_language`

Add a language configuration.

Python parity: `add_language(name, code, voice, speech_fillers=None,
function_fillers=None, engine=None, model=None)`. Ruby supports
both the Python-style positional shape AND the original
`add_language(config)` hash form.

Voice argument can be either a simple voice id (`"en-US-Neural2-F"`)
or a combined `"engine.voice:model"` string
(`"elevenlabs.josh:eleven_turbo_v2_5"`); the combined form is
parsed into `engine`/`voice`/`model` keys when `engine`
and `model` aren't supplied explicitly.

## Signature

**Overload 1**

```ruby
add_language(config)
```

**Overload 2**

```ruby
add_language(name, code, voice, speech_fillers: nil,
```

## Parameters (Overload 1)

| Name     | Type   | Required | Default | Description               |
| -------- | ------ | -------- | ------- | ------------------------- |
| `config` | `Hash` | yes      | —       | preformed language config |

## Parameters (Overload 2)

| Name              | Type     | Required | Default | Description                             |
| ----------------- | -------- | -------- | ------- | --------------------------------------- |
| `name`            | `String` | yes      | —       | language name (e.g. `"English"`)        |
| `code`            | `String` | yes      | —       | BCP47 language code (e.g. `"en-US"`)    |
| `voice`           | `String` | yes      | —       | voice id or `engine.voice:model` string |
| `speech_fillers:` | —        | no       | `nil`   | —                                       |

## Throws

- `ArgumentError`

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 750.
