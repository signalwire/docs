---
slug: "/reference/typescript/swaig-function/swaig-function/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwaigFunction.SwaigFunction.constructor"
  parent: "SwaigFunction.SwaigFunction"
  module: "SwaigFunction"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwaigFunction.ts"
---
# `constructor`

Create a new SwaigFunction.

## Signature

```typescript
constructor(opts: SwaigFunctionOptions): SwaigFunction
```

## Parameters

| Name   | Type                   | Required | Default | Description                                                                                                                                                                                                                                                                                                                                                                                      |
| ------ | ---------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `opts` | `SwaigFunctionOptions` | yes      | —       | Configuration options for the SWAIG function. Use `opts.extraFields` to pass any additional SWAIG-only fields (e.g. `meta_data_token`, `web_hook_auth_user`, `web_hook_auth_password`). This mirrors the Python constructor's `**extra_swaig_fields` kwargs: both are merged directly into the serialized SWAIG definition, so the wire format is identical — only the call-site syntax differs. |

## Returns

`SwaigFunction`

## Source

[`src/SwaigFunction.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwaigFunction.ts)

Line 138.
