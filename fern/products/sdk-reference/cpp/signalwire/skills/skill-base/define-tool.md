---
slug: "/reference/cpp/signalwire/skills/skill-base/define-tool"
title: "define_tool"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::skills::SkillBase::define_tool"
  parent: "signalwire::skills::SkillBase"
  module: "signalwire.skills"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/skills/skill_base.hpp"
  visibility: "public"
---
# `define_tool`

Define a tool (convenience for register\_tools implementations).

**Modifiers:** `inline`

## Signature

```cpp
swaig::ToolDefinition define_tool(
    const std::string & name,
    const std::string & description,
    const json & parameters,
    swaig::ToolHandler handler,
    bool secure = false
)
```

## Parameters

| Name          | Type                  | Required | Default | Description |
| ------------- | --------------------- | -------- | ------- | ----------- |
| `name`        | `const std::string &` | yes      | —       | —           |
| `description` | `const std::string &` | yes      | —       | —           |
| `parameters`  | `const json &`        | yes      | —       | —           |
| `handler`     | `swaig::ToolHandler`  | yes      | —       | —           |
| `secure`      | `bool`                | no       | `false` | —           |

## Returns

`swaig::ToolDefinition`

## Source

[`include/signalwire/skills/skill_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/skills/skill_base.hpp)

Line 77.
