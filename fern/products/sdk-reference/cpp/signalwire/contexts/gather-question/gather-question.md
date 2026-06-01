---
slug: "/reference/cpp/signalwire/contexts/gather-question/gather-question"
title: "GatherQuestion"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::contexts::GatherQuestion::GatherQuestion"
  parent: "signalwire::contexts::GatherQuestion"
  module: "signalwire.contexts"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp"
  visibility: "public"
---
# `GatherQuestion`

## Signature

```cpp
void GatherQuestion(
    const std::string & key,
    const std::string & question,
    const std::string & type = "string",
    bool confirm = false,
    const std::string & prompt = "",
    const std::vector< std::string > & functions = {}
)
```

## Parameters

| Name        | Type                                 | Required | Default    | Description |
| ----------- | ------------------------------------ | -------- | ---------- | ----------- |
| `key`       | `const std::string &`                | yes      | —          | —           |
| `question`  | `const std::string &`                | yes      | —          | —           |
| `type`      | `const std::string &`                | no       | `"string"` | —           |
| `confirm`   | `bool`                               | no       | `false`    | —           |
| `prompt`    | `const std::string &`                | no       | `""`       | —           |
| `functions` | `const std::vector< std::string > &` | no       | `{}`       | —           |

## Source

[`include/signalwire/contexts/contexts.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp)

Line 37.
