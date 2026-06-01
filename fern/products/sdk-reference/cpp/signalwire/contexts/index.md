---
slug: "/reference/cpp/signalwire/contexts"
title: "contexts"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "module"
  language: "cpp"
  qualified_name: "signalwire::contexts"
  parent: "signalwire"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp"
---
# `contexts`

## Signature

```cpp
namespace signalwire::contexts
```

## Constants

| Name                    | Type                        | Required | Default | Description |
| ----------------------- | --------------------------- | -------- | ------- | ----------- |
| `MAX_CONTEXTS`          | `int MAX_CONTEXTS`          | yes      | —       | —           |
| `MAX_STEPS_PER_CONTEXT` | `int MAX_STEPS_PER_CONTEXT` | yes      | —       | —           |

## Functions

- [`reserved_native_tool_names`](/reference/cpp/signalwire/contexts/reserved-native-tool-names) — Reserved tool names auto-injected by the runtime when contexts/steps are present. User-defined SWAIG tools must not collide with these names: next\_step / change\_context are injected when valid\_steps or valid\_contexts is set so the model can navigate the flow. gather\_submit is injected while a step's gather\_info is collecting answers. ContextBuilder::validate() rejects any agent that registers a user tool sharing one of these names.

## Type Aliases

- [`json`](/reference/cpp/signalwire/contexts/json)

## Classes

- [`Context`](/reference/cpp/signalwire/contexts/context)
- [`ContextBuilder`](/reference/cpp/signalwire/contexts/context-builder) — Builder for multi-step, multi-context AI agent workflows. A ContextBuilder owns one or more Contexts; each Context owns an ordered list of Steps. Only one context and one step is active at a time. Per chat turn, the runtime injects the current step's instructions as a system message, then asks the LLM for a response.
- [`GatherInfo`](/reference/cpp/signalwire/contexts/gather-info)
- [`GatherQuestion`](/reference/cpp/signalwire/contexts/gather-question)
- [`Step`](/reference/cpp/signalwire/contexts/step)

## Source

[`include/signalwire/contexts/contexts.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp)

Line 14.
