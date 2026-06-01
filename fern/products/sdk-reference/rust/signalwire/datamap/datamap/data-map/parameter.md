---
slug: "/reference/rust/signalwire/datamap/datamap/data-map/parameter"
title: "parameter"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::datamap::datamap::DataMap::parameter"
  parent: "signalwire::datamap::datamap::DataMap"
  module: "datamap.datamap"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/datamap/datamap.rs"
  visibility: "public"
---
# `parameter`

Add a parameter definition — the `description` is **LLM-FACING**.

Each parameter description is rendered into the OpenAI tool
schema under `parameters.properties.<name>.description` and
sent to the model. The model uses it to decide HOW to fill in
the argument from user speech. It is prompt engineering, not
developer FYI.

# Bad vs good

```text
BAD : .parameter("city", "string", "the city", ...)
GOOD: .parameter("city", "string",
        "The name of the city to get weather for, e.g. "
        "'San Francisco'. Ask the user if they did not "
        "provide one. Include the state or country if the "
        "city name is ambiguous.", ...)
```

## Signature

```rust
fn parameter(
    &mut self,
    name: &str,
    param_type: &str,
    description: &str,
    required: bool,
    enum_values: ?<&str>
) -> &mut Self
```

## Parameters

| Name          | Type      | Required | Default | Description |
| ------------- | --------- | -------- | ------- | ----------- |
| `name`        | `&str`    | yes      | —       | —           |
| `param_type`  | `&str`    | yes      | —       | —           |
| `description` | `&str`    | yes      | —       | —           |
| `required`    | `bool`    | yes      | —       | —           |
| `enum_values` | `?<&str>` | yes      | —       | —           |

## Returns

`&mut Self`

## Examples

```rust
BAD : .parameter("city", "string", "the city", ...)
GOOD: .parameter("city", "string",
        "The name of the city to get weather for, e.g. "
        "'San Francisco'. Ask the user if they did not "
        "provide one. Include the state or country if the "
        "city name is ambiguous.", ...)
```

## Source

[`src/datamap/datamap.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/datamap/datamap.rs)

Line 89.
