---
slug: "/reference/ruby/signal-wire/rest/namespaces/cxml-webhooks-resource"
title: "CxmlWebhooksResource"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::REST::Namespaces::CxmlWebhooksResource"
  parent: "SignalWire::REST::Namespaces"
  module: "SignalWire.REST.Namespaces"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/fabric.rb"
  visibility: "public"
---
# `CxmlWebhooksResource`

cXML webhooks -- auto-materialized by +phone\_numbers.set\_cxml\_webhook+.

## Signature

```ruby
class CxmlWebhooksResource < SignalWire::REST::Namespaces::AutoMaterializedWebhook
```

## Inheritance

**Extends:** [SignalWire::REST::Namespaces::AutoMaterializedWebhook](/reference/ruby/signal-wire/rest/namespaces/auto-materialized-webhook)

## Constants

| Name               | Type                                                                 | Required | Default | Description |
| ------------------ | -------------------------------------------------------------------- | -------- | ------- | ----------- |
| `AUTO_HELPER_NAME` | `AUTO_HELPER_NAME = 'phone_numbers.set_cxml_webhook(sid, url: ...)'` | yes      | —       | —           |

## Source

[`lib/signalwire/rest/namespaces/fabric.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/fabric.rb)

Line 54.
