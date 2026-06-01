---
slug: "/reference/cpp/signalwire/agent/agent-base/supported-internal-filler-names"
title: "supported_internal_filler_names"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::supported_internal_filler_names"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `supported_internal_filler_names`

The complete set of internal SWAIG function names that accept fillers, matching the SWAIGInternalFiller schema definition. Any name outside this set is silently ignored by the runtime — set\_internal\_fillers and add\_internal\_filler warn if you pass an unknown name.
Notable absences: change\_step, gather\_submit, and arbitrary user-defined SWAIG function names are NOT supported.

**Modifiers:** `static`

## Signature

```cpp
const std::set< std::string > & supported_internal_filler_names()
```

## Returns

`const std::set< std::string > &`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 330.
