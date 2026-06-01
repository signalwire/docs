---
slug: "/reference/cpp/signalwire/contexts/reserved-native-tool-names"
title: "reserved_native_tool_names"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "function"
  language: "cpp"
  qualified_name: "signalwire::contexts::reserved_native_tool_names"
  parent: "signalwire::contexts"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/contexts/contexts.cpp"
  visibility: "public"
---
# `reserved_native_tool_names`

Reserved tool names auto-injected by the runtime when contexts/steps are present. User-defined SWAIG tools must not collide with these names:
next\_step / change\_context are injected when valid\_steps or valid\_contexts is set so the model can navigate the flow.
gather\_submit is injected while a step's gather\_info is collecting answers. ContextBuilder::validate() rejects any agent that registers a user tool sharing one of these names.

## Signature

```cpp
const std::set< std::string > & reserved_native_tool_names()
```

## Returns

`const std::set< std::string > &`

## Source

[`src/contexts/contexts.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/contexts/contexts.cpp)

Line 10.
