---
slug: "/reference/ruby/signal-wire/serverless/lambda-handler"
title: "LambdaHandler"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Serverless::LambdaHandler"
  parent: "SignalWire::Serverless"
  module: "SignalWire.Serverless"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/serverless/lambda_handler.rb"
  visibility: "public"
---
# `LambdaHandler`

Adapter that lets an AWS Lambda function invoke a Rack application.

Typical usage from a Lambda entrypoint file:

require 'signalwire'

AGENT = SignalWire::AgentBase.new(name: 'my-agent', route: '/')

# ...configure AGENT...

HANDLER = SignalWire::Serverless::LambdaHandler.new(AGENT.rack\_app)

def handler(event:, context:)
HANDLER.call(event, context)
end

The adapter accepts events from either Lambda Function URLs / API
Gateway HTTP API (payload format v2) or the classic API Gateway REST
API (payload format v1) and returns a response in the matching
shape. Any triple returned by the Rack app (status, headers, body)
is translated into the +{statusCode:, headers:, body:}+ shape
expected by Lambda.

The adapter never reaches out to the network and has no gem
dependencies beyond what the SignalWire SDK already requires, so it
can be bundled directly into a Lambda zip.

## Signature

```ruby
class LambdaHandler < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`call`](/reference/ruby/signal-wire/serverless/lambda-handler/call) — Invoke the wrapped Rack application with a Lambda event.
- [`for`](/reference/ruby/signal-wire/serverless/lambda-handler/for) — Class-level convenience so consumers can use +SignalWire::Serverless::LambdaHandler.for(agent)+ without duplicating +.rack\_app+ at the call site.
- [`initialize`](/reference/ruby/signal-wire/serverless/lambda-handler/initialize)

## Source

[`lib/signalwire/serverless/lambda_handler.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/serverless/lambda_handler.rb)

Line 40.
