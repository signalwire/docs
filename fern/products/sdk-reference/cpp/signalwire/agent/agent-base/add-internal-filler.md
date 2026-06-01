---
slug: "/reference/cpp/signalwire/agent/agent-base/add-internal-filler"
title: "add_internal_filler"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::add_internal_filler"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `add_internal_filler`

Add internal fillers for a single language (legacy overload; stored under the given language key at the top level).

## Signature

**Overload 1**

```cpp
AgentBase & add_internal_filler(
    const std::string & lang,
    const std::vector< std::string > & fillers
)
```

**Overload 2**

```cpp
AgentBase & add_internal_filler(
    const std::string & function_name,
    const std::string & language_code,
    const std::vector< std::string > & fillers
)
```

## Parameters (Overload 1)

| Name      | Type                                 | Required | Default | Description |
| --------- | ------------------------------------ | -------- | ------- | ----------- |
| `lang`    | `const std::string &`                | yes      | —       | —           |
| `fillers` | `const std::vector< std::string > &` | yes      | —       | —           |

## Parameters (Overload 2)

| Name            | Type                                 | Required | Default | Description |
| --------------- | ------------------------------------ | -------- | ------- | ----------- |
| `function_name` | `const std::string &`                | yes      | —       | —           |
| `language_code` | `const std::string &`                | yes      | —       | —           |
| `fillers`       | `const std::vector< std::string > &` | yes      | —       | —           |

## Returns (Overload 1)

`AgentBase &`

## Returns (Overload 2)

`AgentBase &`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 358.
