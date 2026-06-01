---
slug: "/reference/ruby/signal-wire/prefabs/faq-bot/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Prefabs::FaqBot#initialize"
  parent: "SignalWire::Prefabs::FaqBot"
  module: "SignalWire.Prefabs.FaqBot"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/prefabs/faq_bot.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(faqs:, suggest_related: true, persona: nil, name: 'faq_bot', route: '/faq', **_opts)
```

## Parameters

| Name               | Type | Required | Default     | Description |
| ------------------ | ---- | -------- | ----------- | ----------- |
| `faqs:`            | —    | yes      | —           | —           |
| `suggest_related:` | —    | no       | `true`      | —           |
| `persona:`         | —    | no       | `nil`       | —           |
| `name:`            | —    | no       | `'faq_bot'` | —           |
| `route:`           | —    | no       | `'/faq'`    | —           |
| `..._opts`         | —    | no       | —           | —           |

## Returns

`FaqBot` — a new instance of FaqBot

## Throws

- `ArgumentError`

## Source

[`lib/signalwire/prefabs/faq_bot.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/prefabs/faq_bot.rb)

Line 23.
