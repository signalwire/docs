---
slug: "/reference/ruby/signal-wire/agent-base/set-internal-fillers"
title: "set_internal_fillers"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase#set_internal_fillers"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `set_internal_fillers`

Set internal fillers for native SWAIG functions.

Internal fillers are short phrases the AI agent speaks (via TTS)
while an internal/native function is running, so the caller
doesn't hear dead air during transitions or background work.

Supported function names (match the SWAIGInternalFiller schema):
+hangup+, +check\_time+, +wait\_for\_user+, +wait\_seconds+,
+adjust\_response\_latency+, +next\_step+, +change\_context+,
+get\_visual\_input+, +get\_ideal\_strategy+. See
SUPPORTED\_INTERNAL\_FILLER\_NAMES.

Notably NOT supported: +change\_step+, +gather\_submit+, or
arbitrary user-defined SWAIG function names. The runtime only
honors fillers for the names listed above; everything else is
silently ignored at the SWML level. This method warns at
registration time if you pass an unknown name so you catch the
typo early.

Expected format: +{ function\_name => { language\_code => \[phrases] } }+

## Signature

```ruby
def set_internal_fillers(fillers)
```

## Parameters

| Name      | Type | Required | Default | Description |
| --------- | ---- | -------- | ------- | ----------- |
| `fillers` | —    | yes      | —       | —           |

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 914.
