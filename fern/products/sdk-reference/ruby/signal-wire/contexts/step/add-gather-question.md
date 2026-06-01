---
slug: "/reference/ruby/signal-wire/contexts/step/add-gather-question"
title: "add_gather_question"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Contexts::Step#add_gather_question"
  parent: "SignalWire::Contexts::Step"
  module: "SignalWire.Contexts.Step"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb"
  visibility: "public"
---
# `add_gather_question`

Add a question to this step's gather\_info configuration.
+set\_gather\_info+ must be called first.

IMPORTANT — gather mode locks function access:
While the model is asking gather questions, the runtime
forcibly deactivates ALL of the step's other functions. The
only callable tools during a gather question are:

```
- +gather_submit+ (the native answer-submission tool)
- Whatever names you pass in this question's +functions:+
  option
```

+next\_step+ and +change\_context+ are also filtered out — the
model cannot navigate away until the gather completes. This
is by design: it forces a tight ask → submit → next-question
loop.

If a question needs to call out to a tool (e.g. validate an
email, geocode a ZIP), pass that tool name in this question's
+functions:+ option. Functions listed here are active ONLY for
this question.
Python parity: `add_gather_question(key, question, type='string',
confirm=False, prompt=None, functions=None)`. Ruby exposes the
same parameter set as keyword args.

## Signature

```ruby
def add_gather_question(key:, question:, type: 'string', confirm: false, prompt: nil, functions: nil)
```

## Parameters

| Name         | Type | Required | Default    | Description |
| ------------ | ---- | -------- | ---------- | ----------- |
| `key:`       | —    | yes      | —          | —           |
| `question:`  | —    | yes      | —          | —           |
| `type:`      | —    | no       | `'string'` | —           |
| `confirm:`   | —    | no       | `false`    | —           |
| `prompt:`    | —    | no       | `nil`      | —           |
| `functions:` | —    | no       | `nil`      | —           |

## Throws

- `ArgumentError`

## Source

[`lib/signalwire/contexts/context_builder.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/contexts/context_builder.rb)

Line 251.
