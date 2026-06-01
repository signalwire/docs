---
slug: "/reference/ruby/signal-wire/swml/service/schema-path"
title: "schema_path"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::SWML::Service#schema_path"
  parent: "SignalWire::SWML::Service"
  module: "SignalWire.SWML.Service"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb"
  visibility: "public"
---
# `schema_path`

Python parity:

- `name`, `route`, `host`, `port` — surface from
  SWMLService.
- `schema_path` — path to the SWML schema file (or nil to use
  the gem-bundled default).
- `config_file` — optional TOML/YAML config file path.
- `schema_validation` — boolean flag mirroring Python's
  `self._schema_validation`. `SWML_SKIP_SCHEMA_VALIDATION=1`
  env var forces this to false.

## Signature

```ruby
attr_reader schema_path -> Object
```

## Source

[`lib/signalwire/swml/service.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb)

Line 23.
