---
slug: "/reference/ruby/signal-wire/utils/url-validator"
title: "UrlValidator"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "module"
  language: "ruby"
  qualified_name: "SignalWire::Utils::UrlValidator"
  parent: "SignalWire::Utils"
  module: "SignalWire.Utils"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/utils/url_validator.rb"
  visibility: "public"
---
# `UrlValidator`

SSRF-prevention guard for user-supplied URLs.

Mirrors Python's signalwire.utils.url\_validator.validate\_url:
rejects non-http(s) schemes, missing hostnames, and any URL whose
hostname resolves to a private / loopback / link-local / cloud-
metadata IP.  When +allow\_private+ is true, OR the
+SWML\_ALLOW\_PRIVATE\_URLS+ env var is set to "1", "true" or "yes"
(case-insensitive), the IP-blocklist check is skipped.

The method UrlValidator.validate\_url projects onto the Python free
function signalwire.utils.url\_validator.validate\_url via
scripts/enumerate\_signatures.py.

## Signature

```ruby
module UrlValidator
```

## Constants

| Name               | Type                                                                                                  | Required | Default | Description                                                      |
| ------------------ | ----------------------------------------------------------------------------------------------------- | -------- | ------- | ---------------------------------------------------------------- |
| `BLOCKED_NETWORKS` | `BLOCKED_NETWORKS = %w[
  10.0.0.0/8
  172.16.0.0/12
  192.168.0.0/16
  127.0.0.0/8
  169.254.0.0/16` | yes      | —       | Cross-port SSRF block list.  Order matches the Python reference. |
| `LOG`              | `LOG = SignalWire::Logging.logger('signalwire.url_validator')`                                        | yes      | —       | —                                                                |

## Methods

- [`_resolver`](/reference/ruby/signal-wire/utils/url-validator/resolver) — Pluggable resolver hook. Tests inject a lambda to keep the suite hermetic; production calls Resolv.getaddresses. Underscore prefix keeps it out of the public surface inventory — the Python reference only exposes `validate_url` at this module level.
- [`_resolver=`](/reference/ruby/signal-wire/utils/url-validator/resolver__2)
- [`validate_url`](/reference/ruby/signal-wire/utils/url-validator/validate-url) — Validate that a URL is safe to fetch.

## Source

[`lib/signalwire/utils/url_validator.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/utils/url_validator.rb)

Line 28.
