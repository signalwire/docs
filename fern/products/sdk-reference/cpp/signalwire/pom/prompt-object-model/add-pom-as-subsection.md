---
slug: "/reference/cpp/signalwire/pom/prompt-object-model/add-pom-as-subsection"
title: "add_pom_as_subsection"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::pom::PromptObjectModel::add_pom_as_subsection"
  parent: "signalwire::pom::PromptObjectModel"
  module: "signalwire.pom"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp"
  visibility: "public"
---
# `add_pom_as_subsection`

Add every top-level section of pom\_to\_add as a subsection of the section identified by target\_title. Throws std::invalid\_argument when no matching section exists.

## Signature

**Overload 1**

```cpp
void add_pom_as_subsection(
    const std::string & target_title,
    const PromptObjectModel & pom_to_add
)
```

**Overload 2**

```cpp
void add_pom_as_subsection(
    Section & target,
    const PromptObjectModel & pom_to_add
)
```

## Parameters (Overload 1)

| Name           | Type                        | Required | Default | Description |
| -------------- | --------------------------- | -------- | ------- | ----------- |
| `target_title` | `const std::string &`       | yes      | —       | —           |
| `pom_to_add`   | `const PromptObjectModel &` | yes      | —       | —           |

## Parameters (Overload 2)

| Name         | Type                        | Required | Default | Description |
| ------------ | --------------------------- | -------- | ------- | ----------- |
| `target`     | `Section &`                 | yes      | —       | —           |
| `pom_to_add` | `const PromptObjectModel &` | yes      | —       | —           |

## Source

[`include/signalwire/pom/pom.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp)

Line 188.
