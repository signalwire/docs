---
slug: "/reference/ruby/signal-wire/serverless/lambda-handler/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Serverless::LambdaHandler#initialize"
  parent: "SignalWire::Serverless::LambdaHandler"
  module: "SignalWire.Serverless.LambdaHandler"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/serverless/lambda_handler.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(app)
```

## Parameters

| Name  | Type    | Required | Default | Description                   |
| ----- | ------- | -------- | ------- | ----------------------------- |
| `app` | `#call` | yes      | —       | a Rack-compatible application |

## Returns

`LambdaHandler` — a new instance of LambdaHandler

## Throws

- `ArgumentError`

## Source

[`lib/signalwire/serverless/lambda_handler.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/serverless/lambda_handler.rb)

Line 42.
