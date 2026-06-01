---
slug: "/reference/ruby/signal-wire/runtime/execution-mode"
title: "execution_mode"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Runtime.execution_mode"
  parent: "SignalWire::Runtime"
  module: "SignalWire.Runtime"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/runtime.rb"
  visibility: "public"
---
# `execution_mode`

Determine the current execution mode.

Returns one of:

- +:cgi+   - running under a CGI gateway (GATEWAY\_INTERFACE is set)
- +:lambda+ - running under AWS Lambda
- +:google\_cloud\_function+ - Google Cloud Functions / Cloud Run
- +:azure\_function+ - Azure Functions
- +:server+ - long-running HTTP server (the default)

Detection order matters: CGI is checked before Lambda because a
Lambda function invoked through an emulator that also sets
GATEWAY\_INTERFACE should still be treated as CGI.

## Signature

```ruby
def execution_mode
```

## Returns

`Symbol` — one of the values in {MODES}

## Source

[`lib/signalwire/runtime.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/runtime.rb)

Line 34.
