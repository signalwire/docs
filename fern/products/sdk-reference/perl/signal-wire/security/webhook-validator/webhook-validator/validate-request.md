---
slug: "/reference/perl/signal-wire/security/webhook-validator/webhook-validator/validate-request"
title: "validate_request"
sdk_label: "Perl SDK"
icon: "perl"
lustri:
  auto_generated: true
  kind: "method"
  language: "perl"
  qualified_name: "SignalWire::Security::WebhookValidator::validate_request"
  parent: "SignalWire::Security::WebhookValidator"
  module: "SignalWire.Security.WebhookValidator"
  source_url: "https://github.com/signalwire/signalwire-perl/blob/main/lib/SignalWire/Security/WebhookValidator.pm"
  visibility: "public"
---
# `validate_request`

## Signature

```perl
sub validate_request($signing_key, $signature, $url, $params_or_raw_body)
```

## Parameters

| Name                 | Type | Required | Default | Description |
| -------------------- | ---- | -------- | ------- | ----------- |
| `signing_key`        | —    | yes      | —       | —           |
| `signature`          | —    | yes      | —       | —           |
| `url`                | —    | yes      | —       | —           |
| `params_or_raw_body` | —    | yes      | —       | —           |

## Source

[`lib/SignalWire/Security/WebhookValidator.pm`](https://github.com/signalwire/signalwire-perl/blob/main/lib/SignalWire/Security/WebhookValidator.pm)

Line 309.
