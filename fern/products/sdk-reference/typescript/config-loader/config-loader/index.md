---
slug: "/reference/typescript/config-loader/config-loader"
title: "ConfigLoader"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "ConfigLoader.ConfigLoader"
  parent: "ConfigLoader"
  module: "ConfigLoader"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts"
---
# `ConfigLoader`

JSON configuration file loader with environment variable interpolation and dot-notation access.

## Signature

```typescript
class ConfigLoader
```

## Properties

| Name          | Type                          | Required | Default | Description                                                          |
| ------------- | ----------------------------- | -------- | ------- | -------------------------------------------------------------------- |
| `configPaths` | `get configPaths(): string[]` | yes      | —       | Get the ordered list of config file paths that were passed/searched. |

## Methods

- [`constructor`](/reference/typescript/config-loader/config-loader/constructor) — Create a new ConfigLoader, optionally loading a JSON file immediately.
- [`findConfigFile`](/reference/typescript/config-loader/config-loader/find-config-file) — Find a config file path without loading it.
- [`get`](/reference/typescript/config-loader/config-loader/get) — Retrieve a configuration value using a dot-notation path (e.g. `'server.port'`).
- [`getAll`](/reference/typescript/config-loader/config-loader/get-all) — Return a shallow copy of the entire configuration object.
- [`getConfig`](/reference/typescript/config-loader/config-loader/get-config) — Alias for [getAll](/reference/typescript/config-loader/config-loader/get-all) — matches the Python SDK's `get_config()` method name.
- [`getConfigFile`](/reference/typescript/config-loader/config-loader/get-config-file) — Alias for [getFilePath](/reference/typescript/config-loader/config-loader/get-file-path) — matches the Python SDK's `get_config_file()` method name.
- [`getFilePath`](/reference/typescript/config-loader/config-loader/get-file-path) — Return the absolute path of the loaded config file, if any.
- [`getSection`](/reference/typescript/config-loader/config-loader/get-section) — Get an entire configuration section with all environment variables substituted.
- [`has`](/reference/typescript/config-loader/config-loader/has) — Check whether a dot-notation path exists in the loaded configuration.
- [`hasConfig`](/reference/typescript/config-loader/config-loader/has-config) — Check if a configuration was loaded.
- [`interpolateEnvVars`](/reference/typescript/config-loader/config-loader/interpolate-env-vars) — Interpolate ${VAR|default} patterns in a raw string.
- [`load`](/reference/typescript/config-loader/config-loader/load) — Load configuration from a JSON file, performing `${VAR|default}` env var interpolation on the raw text.
- [`loadFromObject`](/reference/typescript/config-loader/config-loader/load-from-object) — Load configuration from a plain object instead of a file, useful for testing or programmatic setup.
- [`mergeWithEnv`](/reference/typescript/config-loader/config-loader/merge-with-env) — Merge configuration with environment variables that match a prefix.
- [`search`](/reference/typescript/config-loader/config-loader/search) — Search for a config file in standard locations.
- [`set`](/reference/typescript/config-loader/config-loader/set) — Set a configuration value at the given dot-notation path, creating intermediate objects as needed.
- [`substituteVars`](/reference/typescript/config-loader/config-loader/substitute-vars) — Recursively substitute `${VAR|default}` environment variables in any value.

## Source

[`src/ConfigLoader.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts)

Line 15.
