---
slug: "/reference/ruby/signal-wire/utils/schema-utils/validate-document"
title: "validate_document"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Utils::SchemaUtils#validate_document"
  parent: "SignalWire::Utils::SchemaUtils"
  module: "SignalWire.Utils.SchemaUtils"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/utils/schema_utils.rb"
  visibility: "public"
---
# `validate_document`

Validate a complete SWML document.
Mirrors Python's validate\_document(document). Returns
(false, \['Schema validator not initialized']) when no full
validator is wired in.

## Signature

```ruby
def validate_document(document)
```

## Parameters

| Name       | Type | Required | Default | Description |
| ---------- | ---- | -------- | ------- | ----------- |
| `document` | —    | yes      | —       | —           |

## Source

[`lib/signalwire/utils/schema_utils.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/utils/schema_utils.rb)

Line 148.
