---
slug: "/reference/cpp/signalwire/skills/info-gatherer-skill/setup"
title: "setup"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::skills::InfoGathererSkill::setup"
  parent: "signalwire::skills::InfoGathererSkill"
  module: "signalwire.skills"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/info_gatherer.cpp"
  visibility: "public"
---
# `setup`

Initialize the skill with given params. Return true on success.

**Modifiers:** `inline` `virtual`

## Signature

```cpp
bool setup(const json & params)
```

## Parameters

| Name     | Type           | Required | Default | Description |
| -------- | -------------- | -------- | ------- | ----------- |
| `params` | `const json &` | yes      | —       | —           |

## Returns

`bool`

## Source

[`src/skills/builtin/info_gatherer.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/info_gatherer.cpp)

Line 17.
