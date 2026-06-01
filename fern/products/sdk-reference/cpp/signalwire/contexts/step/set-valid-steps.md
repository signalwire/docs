---
slug: "/reference/cpp/signalwire/contexts/step/set-valid-steps"
title: "set_valid_steps"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::contexts::Step::set_valid_steps"
  parent: "signalwire::contexts::Step"
  module: "signalwire.contexts"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp"
  visibility: "public"
---
# `set_valid_steps`

Set which steps can be navigated to from this step.

## Signature

```cpp
Step & set_valid_steps(const std::vector< std::string > & steps)
```

## Parameters

| Name    | Type                                 | Required | Default | Description |
| ------- | ------------------------------------ | -------- | ------- | ----------- |
| `steps` | `const std::vector< std::string > &` | yes      | —       | —           |

## Returns

`Step &`

## Source

[`include/signalwire/contexts/contexts.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp)

Line 136.
