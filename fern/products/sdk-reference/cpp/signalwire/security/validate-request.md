---
slug: "/reference/cpp/signalwire/security/validate-request"
title: "ValidateRequest"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "function"
  language: "cpp"
  qualified_name: "signalwire::security::ValidateRequest"
  parent: "signalwire::security"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/security/webhook_validator.cpp"
  visibility: "public"
---
# `ValidateRequest`

Legacy @signalwire/compatibility-api drop-in entry point.
If params\_or\_raw\_body holds a std::string, delegates to ValidateWebhookSignature (Scheme A then Scheme B with parsed form).
If it holds a FormParams, treats it as pre-parsed form params and runs Scheme B directly (with URL port normalization).

std::invalid\_argument

when signing\_key is empty.

## Signature

```cpp
bool ValidateRequest(
    std::string_view signing_key,
    std::string_view signature,
    std::string_view url,
    const ParamsOrBody & params_or_raw_body
)
```

## Parameters

| Name                 | Type                   | Required | Default | Description |
| -------------------- | ---------------------- | -------- | ------- | ----------- |
| `signing_key`        | `std::string_view`     | yes      | —       | —           |
| `signature`          | `std::string_view`     | yes      | —       | —           |
| `url`                | `std::string_view`     | yes      | —       | —           |
| `params_or_raw_body` | `const ParamsOrBody &` | yes      | —       | —           |

## Returns

`bool`

## Throws

- `std::invalid_argument` — when signing\_key is empty.

## Source

[`src/security/webhook_validator.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/security/webhook_validator.cpp)

Line 457.
