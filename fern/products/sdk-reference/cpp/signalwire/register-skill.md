---
slug: "/reference/cpp/signalwire/register-skill"
title: "register_skill"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "function"
  language: "cpp"
  qualified_name: "signalwire::register_skill"
  parent: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/signalwire.cpp"
  visibility: "public"
---
# `register_skill`

Register a custom skill class with the global skill registry.
Mirrors Python's signalwire.register\_skill(skill\_class). Delegates to skills::SkillRegistry::register\_skill. The skill's name comes from the supplied skills::SkillBase factory (which instantiates a SkillBase to read its skill\_name() accessor).

## Signature

```cpp
void register_skill(skills::SkillFactory factory)
```

## Parameters

| Name      | Type                   | Required | Default | Description |
| --------- | ---------------------- | -------- | ------- | ----------- |
| `factory` | `skills::SkillFactory` | yes      | —       | —           |

## Source

[`src/signalwire.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/signalwire.cpp)

Line 79.
