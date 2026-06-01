---
slug: "/reference/typescript/swml-service/swml-service/get-basic-auth-credentials"
title: "getBasicAuthCredentials"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLService.SWMLService.getBasicAuthCredentials"
  parent: "SWMLService.SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `getBasicAuthCredentials`

Get the basic-auth credentials used by this service.
Mirrors Python's `get_basic_auth_credentials()`.

## Signature

**Overload 1**

```typescript
getBasicAuthCredentials(includeSource?: false): [string, string]
```

**Overload 2**

```typescript
getBasicAuthCredentials(
  includeSource: true
): [string, string, "provided" | "environment" | "generated"]
```

## Parameters (Overload 1)

| Name            | Type    | Required | Default | Description                                                              |
| --------------- | ------- | -------- | ------- | ------------------------------------------------------------------------ |
| `includeSource` | `false` | no       | —       | When true, a third element indicating the credential source is appended. |

## Parameters (Overload 2)

| Name            | Type   | Required | Default | Description                                                              |
| --------------- | ------ | -------- | ------- | ------------------------------------------------------------------------ |
| `includeSource` | `true` | yes      | —       | When true, a third element indicating the credential source is appended. |

## Returns (Overload 1)

`[string, string]` — A tuple of \[username, password] or \[username, password, source].

## Returns (Overload 2)

`[string, string, "provided" | "environment" | "generated"]` — A tuple of \[username, password] or \[username, password, source].

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 863.
