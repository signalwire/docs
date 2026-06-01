---
slug: "/reference/cpp/signalwire/relay/action/set-resolve-on-result"
title: "set_resolve_on_result"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::Action::set_resolve_on_result"
  parent: "signalwire::relay::Action"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp"
  visibility: "public"
---
# `set_resolve_on_result`

Collect actions resolve when an event carries a result payload. A play(finished) earlier in the timeline does NOT resolve a CollectAction — see Python's CollectAction terminal-event logic.

**Modifiers:** `inline`

## Signature

```cpp
void set_resolve_on_result(bool flag)
```

## Parameters

| Name   | Type   | Required | Default | Description |
| ------ | ------ | -------- | ------- | ----------- |
| `flag` | `bool` | yes      | —       | —           |

## Source

[`include/signalwire/relay/action.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp)

Line 79.
