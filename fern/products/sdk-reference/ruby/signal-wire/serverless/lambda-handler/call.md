---
slug: "/reference/ruby/signal-wire/serverless/lambda-handler/call"
title: "call"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Serverless::LambdaHandler#call"
  parent: "SignalWire::Serverless::LambdaHandler"
  module: "SignalWire.Serverless.LambdaHandler"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/serverless/lambda_handler.rb"
  visibility: "public"
---
# `call`

Invoke the wrapped Rack application with a Lambda event.

## Signature

```ruby
def call(event, _context = nil)
```

## Parameters

| Name       | Type     | Required | Default | Description                  |
| ---------- | -------- | -------- | ------- | ---------------------------- |
| `event`    | `Hash`   | yes      | —       | the Lambda invocation event  |
| `_context` | `Object` | no       | `nil`   | the Lambda context (ignored) |

## Returns

`Hash` — a Lambda-shaped response hash

## Source

[`lib/signalwire/serverless/lambda_handler.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/serverless/lambda_handler.rb)

Line 53.
