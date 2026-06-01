---
slug: "/reference/ruby/signal-wire/utils/url-validator/resolver"
title: "_resolver"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Utils::UrlValidator._resolver"
  parent: "SignalWire::Utils::UrlValidator"
  module: "SignalWire.Utils.UrlValidator"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/utils/url_validator.rb"
  visibility: "public"
---
# `_resolver`

Pluggable resolver hook. Tests inject a lambda to keep the suite
hermetic; production calls Resolv.getaddresses. Underscore prefix
keeps it out of the public surface inventory — the Python
reference only exposes `validate_url` at this module level.

## Signature

```ruby
def _resolver
```

## Source

[`lib/signalwire/utils/url_validator.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/utils/url_validator.rb)

Line 48.
