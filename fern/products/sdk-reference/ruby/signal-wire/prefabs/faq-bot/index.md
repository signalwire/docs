---
slug: "/reference/ruby/signal-wire/prefabs/faq-bot"
title: "FaqBot"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Prefabs::FaqBot"
  parent: "SignalWire::Prefabs"
  module: "SignalWire.Prefabs"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/prefabs/faq_bot.rb"
  visibility: "public"
---
# `FaqBot`

Prefab agent for answering frequently asked questions.

agent = FaqBot.new(
faqs: \[
{ 'question' => 'What is SignalWire?', 'answer' => 'A cloud communications platform.' }
]
)

## Signature

```ruby
class FaqBot < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`faqs`](/reference/ruby/signal-wire/prefabs/faq-bot/faqs) — Returns the value of attribute faqs.
- [`global_data`](/reference/ruby/signal-wire/prefabs/faq-bot/global-data)
- [`handle_search`](/reference/ruby/signal-wire/prefabs/faq-bot/handle-search)
- [`initialize`](/reference/ruby/signal-wire/prefabs/faq-bot/initialize)
- [`name`](/reference/ruby/signal-wire/prefabs/faq-bot/name) — Returns the value of attribute name.
- [`prompt_sections`](/reference/ruby/signal-wire/prefabs/faq-bot/prompt-sections)
- [`route`](/reference/ruby/signal-wire/prefabs/faq-bot/route) — Returns the value of attribute route.
- [`tools`](/reference/ruby/signal-wire/prefabs/faq-bot/tools)

## Source

[`lib/signalwire/prefabs/faq_bot.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/prefabs/faq_bot.rb)

Line 20.
