---
slug: "/reference/cpp/signalwire/skills/skill-base/get-param-or-env"
title: "get_param_or_env"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::skills::SkillBase::get_param_or_env"
  parent: "signalwire::skills::SkillBase"
  module: "signalwire.skills"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/skills/skill_base.hpp"
  visibility: "public"
---
# `get_param_or_env`

Get a string parameter with env var fallback.

**Modifiers:** `const` `inline`

## Signature

```cpp
std::string get_param_or_env(
    const json & params,
    const std::string & key,
    const std::string & env_var,
    const std::string & default_val = ""
) const
```

## Parameters

| Name          | Type                  | Required | Default | Description |
| ------------- | --------------------- | -------- | ------- | ----------- |
| `params`      | `const json &`        | yes      | —       | —           |
| `key`         | `const std::string &` | yes      | —       | —           |
| `env_var`     | `const std::string &` | yes      | —       | —           |
| `default_val` | `const std::string &` | no       | `""`    | —           |

## Returns

`std::string`

## Source

[`include/signalwire/skills/skill_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/skills/skill_base.hpp)

Line 102.
