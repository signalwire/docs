---
slug: "/reference/cpp/signalwire/skills/skill-registry/add-skill-directory"
title: "add_skill_directory"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::skills::SkillRegistry::add_skill_directory"
  parent: "signalwire::skills::SkillRegistry"
  module: "signalwire.skills"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/skills/skill_registry.hpp"
  visibility: "public"
---
# `add_skill_directory`

Add a directory to search for skills.
Mirrors Python's signalwire.skills.registry.SkillRegistry.add\_skill\_directory: validate that the path exists and is a directory, then append it (de-duplicated) to external\_paths\_. Throws std::invalid\_argument (the C++ analog of Python's ValueError) for invalid input — the path doesn't exist or isn't a directory.

**Modifiers:** `inline`

## Signature

```cpp
void add_skill_directory(const std::string & path)
```

## Parameters

| Name   | Type                  | Required | Default | Description |
| ------ | --------------------- | -------- | ------- | ----------- |
| `path` | `const std::string &` | yes      | —       | —           |

## Source

[`include/signalwire/skills/skill_registry.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/skills/skill_registry.hpp)

Line 65.
