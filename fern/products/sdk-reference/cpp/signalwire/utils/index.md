---
slug: "/reference/cpp/signalwire/utils"
title: "utils"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "module"
  language: "cpp"
  qualified_name: "signalwire::utils"
  parent: "signalwire"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/schema_utils.hpp"
---
# `utils`

## Signature

```cpp
namespace signalwire::utils
```

## Functions

- [`is_serverless_mode`](/reference/cpp/signalwire/utils/is-serverless-mode) — Cross-language SDK contract: signalwire.utils.is\_serverless\_mode returns true whenever the SDK is running inside any short-lived / event-driven invocation environment (anything other than "server"). Mirrors signalwire.utils.is\_serverless\_mode in the Python reference. true unless the detected mode is "server".

## Type Aliases

- [`json`](/reference/cpp/signalwire/utils/json)

## Classes

- [`SchemaUtils`](/reference/cpp/signalwire/utils/schema-utils) — SchemaUtils — C++ port of signalwire.utils.schema\_utils.SchemaUtils.
- [`SchemaValidationError`](/reference/cpp/signalwire/utils/schema-validation-error) — SchemaValidationError — C++ port of signalwire.utils.schema\_utils.SchemaValidationError.
- [`VerbInfo`](/reference/cpp/signalwire/utils/verb-info) — Verb metadata extracted from the schema.

## Modules

- [`@146215307143357101017345154053367162354204145374`](/reference/cpp/signalwire/utils/146215307143357101017345154053367162354204145374)
- [`url_validator`](/reference/cpp/signalwire/utils/url-validator)

## Source

[`include/signalwire/utils/schema_utils.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/schema_utils.hpp)

Line 28.
