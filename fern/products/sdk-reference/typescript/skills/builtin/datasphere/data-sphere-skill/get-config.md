---
slug: "/reference/typescript/skills/builtin/datasphere/data-sphere-skill/get-config"
title: "getConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.datasphere.DataSphereSkill.getConfig"
  parent: "skills.builtin.datasphere.DataSphereSkill"
  module: "skills.builtin.datasphere"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `getConfig`

Get a configuration value by key, falling back to a default if not set.

## Signature

```typescript
getConfig<T>(key: string, defaultValue?: T): T
```

## Type Parameters

| Name | Type | Required | Default   | Description |
| ---- | ---- | -------- | --------- | ----------- |
| `T`  | —    | yes      | `unknown` | —           |

## Parameters

| Name           | Type     | Required | Default | Description                                |
| -------------- | -------- | -------- | ------- | ------------------------------------------ |
| `key`          | `string` | yes      | —       | The configuration key to look up.          |
| `defaultValue` | `T`      | no       | —       | Value to return if the key is not present. |

## Returns

`T` — The configuration value cast to type T, or the default value.

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 524.
