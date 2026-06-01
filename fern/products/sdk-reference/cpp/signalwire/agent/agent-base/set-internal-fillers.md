---
slug: "/reference/cpp/signalwire/agent/agent-base/set-internal-fillers"
title: "set_internal_fillers"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::set_internal_fillers"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `set_internal_fillers`

Set internal fillers for native SWAIG functions.
Internal fillers are short phrases the AI agent speaks (via TTS) while an internal/native function is running, so the caller doesn't hear dead air during transitions or background work.
Supported function names (match the SWAIGInternalFiller schema): hangup, check\_time, wait\_for\_user, wait\_seconds, adjust\_response\_latency, next\_step, change\_context, get\_visual\_input, get\_ideal\_strategy. See supported\_internal\_filler\_names().
Notably NOT supported: change\_step, gather\_submit, or arbitrary user-defined SWAIG function names. The runtime only honors fillers for the names listed above; everything else is silently ignored at the SWML level. This method warns at registration time if you pass an unknown name so you catch the typo early.
Expected JSON shape: {"function\_name": {"language\_code": \["phrase1", ...]}, ...}

## Signature

```cpp
AgentBase & set_internal_fillers(const json & fillers)
```

## Parameters

| Name      | Type           | Required | Default | Description |
| --------- | -------------- | -------- | ------- | ----------- |
| `fillers` | `const json &` | yes      | —       | —           |

## Returns

`AgentBase &`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 354.
