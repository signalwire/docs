---
slug: "/reference/ruby/signal-wire/runtime"
title: "Runtime"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "module"
  language: "ruby"
  qualified_name: "SignalWire::Runtime"
  parent: "SignalWire"
  module: "SignalWire"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/runtime.rb"
  visibility: "public"
---
# `Runtime`

Runtime environment detection.

Detects the execution environment (plain server, AWS Lambda, CGI,
Google Cloud Functions, Azure Functions) by inspecting well-known
environment variables set by each platform.

This is the Ruby counterpart to the Python SDK's
+signalwire.core.logging\_config.get\_execution\_mode+.

## Signature

```ruby
module Runtime
```

## Constants

| Name    | Type                                                                                | Required | Default | Description |
| ------- | ----------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `MODES` | `MODES = %i[server lambda cgi google_cloud_function azure_function unknown].freeze` | yes      | —       | —           |

## Methods

- [`execution_mode`](/reference/ruby/signal-wire/runtime/execution-mode) — Determine the current execution mode.
- [`lambda_base_url`](/reference/ruby/signal-wire/runtime/lambda-base-url) — Construct the base URL for the current Lambda function.
- [`lambda?`](/reference/ruby/signal-wire/runtime/lambda) — True when the SDK is running inside AWS Lambda.
- [`serverless?`](/reference/ruby/signal-wire/runtime/serverless) — True when the SDK is running inside any serverless platform.

## Source

[`lib/signalwire/runtime.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/runtime.rb)

Line 17.
