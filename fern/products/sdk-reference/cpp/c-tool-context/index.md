---
slug: "/reference/cpp/c-tool-context"
title: "CToolContext"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "CToolContext"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/c_api/signalwire_c.cpp"
  visibility: "public"
---
# `CToolContext`

## Signature

```cpp
struct CToolContext
```

## Properties

| Name        | Type                        | Required | Default | Description |
| ----------- | --------------------------- | -------- | ------- | ----------- |
| `handler`   | `sw_tool_handler_t handler` | yes      | —       | —           |
| `user_data` | `void * user_data`          | yes      | —       | —           |

## Source

[`src/c_api/signalwire_c.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/c_api/signalwire_c.cpp)

Line 83.
