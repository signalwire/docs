---
slug: "/reference/ruby/signal-wire/prefabs/info-gatherer"
title: "InfoGatherer"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Prefabs::InfoGatherer"
  parent: "SignalWire::Prefabs"
  module: "SignalWire.Prefabs"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/prefabs/info_gatherer.rb"
  visibility: "public"
---
# `InfoGatherer`

Prefab agent for collecting answers to a series of questions.

agent = InfoGatherer.new(
questions: \[
{ 'key\_name' => 'full\_name', 'question\_text' => 'What is your full name?' },
{ 'key\_name' => 'email',     'question\_text' => 'Email?', 'confirm' => true }
]
)

## Signature

```ruby
class InfoGatherer < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`global_data`](/reference/ruby/signal-wire/prefabs/info-gatherer/global-data) — Global data for initial state.
- [`handle_start`](/reference/ruby/signal-wire/prefabs/info-gatherer/handle-start) — Tool handler: start\_questions
- [`handle_submit`](/reference/ruby/signal-wire/prefabs/info-gatherer/handle-submit) — Tool handler: submit\_answer
- [`initialize`](/reference/ruby/signal-wire/prefabs/info-gatherer/initialize)
- [`name`](/reference/ruby/signal-wire/prefabs/info-gatherer/name) — Returns the value of attribute name.
- [`prompt_sections`](/reference/ruby/signal-wire/prefabs/info-gatherer/prompt-sections) — Build the prompt sections.
- [`questions`](/reference/ruby/signal-wire/prefabs/info-gatherer/questions) — Returns the value of attribute questions.
- [`route`](/reference/ruby/signal-wire/prefabs/info-gatherer/route) — Returns the value of attribute route.
- [`tools`](/reference/ruby/signal-wire/prefabs/info-gatherer/tools) — Tool definitions this prefab provides.

## Source

[`lib/signalwire/prefabs/info_gatherer.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/prefabs/info_gatherer.rb)

Line 21.
