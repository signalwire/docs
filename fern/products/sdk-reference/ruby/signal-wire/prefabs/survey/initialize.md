---
slug: "/reference/ruby/signal-wire/prefabs/survey/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Prefabs::Survey#initialize"
  parent: "SignalWire::Prefabs::Survey"
  module: "SignalWire.Prefabs.Survey"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/prefabs/survey.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(survey_name:, questions:, introduction: nil, conclusion: nil, name: 'survey', route: '/survey', **_opts)
```

## Parameters

| Name            | Type | Required | Default     | Description |
| --------------- | ---- | -------- | ----------- | ----------- |
| `survey_name:`  | —    | yes      | —           | —           |
| `questions:`    | —    | yes      | —           | —           |
| `introduction:` | —    | no       | `nil`       | —           |
| `conclusion:`   | —    | no       | `nil`       | —           |
| `name:`         | —    | no       | `'survey'`  | —           |
| `route:`        | —    | no       | `'/survey'` | —           |
| `..._opts`      | —    | no       | —           | —           |

## Returns

`Survey` — a new instance of Survey

## Throws

- `ArgumentError`

## Source

[`lib/signalwire/prefabs/survey.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/prefabs/survey.rb)

Line 24.
