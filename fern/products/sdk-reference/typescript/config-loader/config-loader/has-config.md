---
slug: "/reference/typescript/config-loader/config-loader/has-config"
title: "hasConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ConfigLoader.ConfigLoader.hasConfig"
  parent: "ConfigLoader.ConfigLoader"
  module: "ConfigLoader"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts"
---
# `hasConfig`

Check if a configuration was loaded.

**Deliberate deviation from Python `has_config()`:** Python returns `True`
only when a file was loaded (`self._config is not None`). This TypeScript
implementation also returns `true` when data was loaded via
[loadFromObject](/reference/typescript/config-loader/config-loader/load-from-object), because `loadFromObject` is an extra TS-only method
with no Python equivalent. Treating object-loaded data as "configured" is
the correct semantic for the TS API surface.

If you need file-load-only detection, check `this.getFilePath() !== null`.

## Signature

```typescript
hasConfig(): boolean
```

## Returns

`boolean` — True if configuration data exists (from file or object).

## Source

[`src/ConfigLoader.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts)

Line 289.
