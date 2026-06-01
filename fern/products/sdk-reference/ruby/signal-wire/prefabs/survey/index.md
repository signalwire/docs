---
slug: "/reference/ruby/signal-wire/prefabs/survey"
title: "Survey"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Prefabs::Survey"
  parent: "SignalWire::Prefabs"
  module: "SignalWire.Prefabs"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/prefabs/survey.rb"
  visibility: "public"
---
# `Survey`

Prefab agent for conducting automated surveys.

agent = Survey.new(
survey\_name: 'Customer Satisfaction',
questions: \[
{ 'id' => 'satisfaction', 'text' => 'How satisfied were you?', 'type' => 'rating', 'scale' => 5 }
]
)

## Signature

```ruby
class Survey < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`global_data`](/reference/ruby/signal-wire/prefabs/survey/global-data)
- [`handle_start`](/reference/ruby/signal-wire/prefabs/survey/handle-start)
- [`handle_submit`](/reference/ruby/signal-wire/prefabs/survey/handle-submit)
- [`handle_summary`](/reference/ruby/signal-wire/prefabs/survey/handle-summary)
- [`initialize`](/reference/ruby/signal-wire/prefabs/survey/initialize)
- [`name`](/reference/ruby/signal-wire/prefabs/survey/name) — Returns the value of attribute name.
- [`prompt_sections`](/reference/ruby/signal-wire/prefabs/survey/prompt-sections)
- [`questions`](/reference/ruby/signal-wire/prefabs/survey/questions) — Returns the value of attribute questions.
- [`route`](/reference/ruby/signal-wire/prefabs/survey/route) — Returns the value of attribute route.
- [`survey_name`](/reference/ruby/signal-wire/prefabs/survey/survey-name) — Returns the value of attribute survey\_name.
- [`tools`](/reference/ruby/signal-wire/prefabs/survey/tools)

## Source

[`lib/signalwire/prefabs/survey.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/prefabs/survey.rb)

Line 21.
