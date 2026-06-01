---
slug: "/reference/ruby/signal-wire/utils/url-validator/validate-url"
title: "validate_url"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Utils::UrlValidator.validate_url"
  parent: "SignalWire::Utils::UrlValidator"
  module: "SignalWire.Utils.UrlValidator"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/utils/url_validator.rb"
  visibility: "public"
---
# `validate_url`

Validate that a URL is safe to fetch.

## Signature

```ruby
def validate_url(url, allow_private = false)
```

## Parameters

| Name            | Type      | Required | Default | Description                              |
| --------------- | --------- | -------- | ------- | ---------------------------------------- |
| `url`           | `String`  | yes      | —       | URL to validate                          |
| `allow_private` | `Boolean` | no       | `false` | when true, bypass the IP-blocklist check |

## Returns

`Boolean` — true if the URL is safe to fetch

## Source

[`lib/signalwire/utils/url_validator.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/utils/url_validator.rb)

Line 61.
