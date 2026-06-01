---
slug: "/reference/ruby/signal-wire/pom/prompt-object-model/find-section"
title: "find_section"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::POM::PromptObjectModel#find_section"
  parent: "SignalWire::POM::PromptObjectModel"
  module: "SignalWire.POM.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/pom/prompt_object_model.rb"
  visibility: "public"
---
# `find_section`

Find a section by title, recursing into subsections. Returns
+nil+ when the title is not present anywhere in the tree.

## Signature

```ruby
def find_section(title)
```

## Parameters

| Name    | Type | Required | Default | Description |
| ------- | ---- | -------- | ------- | ----------- |
| `title` | —    | yes      | —       | —           |

## Source

[`lib/signalwire/pom/prompt_object_model.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/pom/prompt_object_model.rb)

Line 141.
