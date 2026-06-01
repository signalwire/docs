---
slug: "/reference/cpp/signalwire/swml/service/add-verb"
title: "add_verb"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Service::add_verb"
  parent: "signalwire::swml::Service"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp"
  visibility: "public"
---
# `add_verb`

## Signature

```cpp
Service & add_verb(
    const std::string & section,
    const std::string & verb_name,
    const json & params
)
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `section`   | `const std::string &` | yes      | —       | —           |
| `verb_name` | `const std::string &` | yes      | —       | —           |
| `params`    | `const json &`        | yes      | —       | —           |

## Returns

`Service &`

## Source

[`include/signalwire/swml/service.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp)

Line 131.
