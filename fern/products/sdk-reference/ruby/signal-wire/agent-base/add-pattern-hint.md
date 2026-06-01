---
slug: "/reference/ruby/signal-wire/agent-base/add-pattern-hint"
title: "add_pattern_hint"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase#add_pattern_hint"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `add_pattern_hint`

Add a complex (pattern-matched) hint.

Python parity:
`add_pattern_hint(hint, pattern, replace, ignore_case=False)`.
Ruby supports both the Python-style positional form and the
legacy keyword form (`add_pattern_hint(pattern, hint:, language:)`)
for backward compat.

## Signature

**Overload 1**

```ruby
add_pattern_hint(hint, pattern, replace, ignore_case: false)
```

**Overload 2**

```ruby
add_pattern_hint(pattern, hint:, language: 'en-US')
```

## Parameters (Overload 1)

| Name           | Type     | Required | Default | Description      |
| -------------- | -------- | -------- | ------- | ---------------- |
| `hint`         | `String` | yes      | —       | hint to match    |
| `pattern`      | `String` | yes      | —       | regex pattern    |
| `replace`      | `String` | yes      | —       | replacement text |
| `ignore_case:` | —        | no       | `false` | —                |

## Parameters (Overload 2)

| Name        | Type | Required | Default   | Description |
| ----------- | ---- | -------- | --------- | ----------- |
| `pattern`   | —    | yes      | —         | —           |
| `hint:`     | —    | yes      | —         | —           |
| `language:` | —    | no       | `'en-US'` | —           |

## Throws

- `ArgumentError`

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 682.
