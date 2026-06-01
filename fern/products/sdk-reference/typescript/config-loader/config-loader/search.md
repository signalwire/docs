---
slug: "/reference/typescript/config-loader/config-loader/search"
title: "search"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ConfigLoader.ConfigLoader.search"
  parent: "ConfigLoader.ConfigLoader"
  module: "ConfigLoader"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts"
---
# `search`

Search for a config file in standard locations.

Default search paths: CWD, `./config`, `$HOME/.signalwire`,
`.swml/`, `$HOME/.swml/`, `/etc/swml/`.

**Modifiers:** `static`

## Signature

```typescript
search(
  filename: string,
  additionalPaths?: string[],
  serviceName?: string
): ConfigLoader | null
```

## Parameters

| Name              | Type       | Required | Default | Description                                                               |
| ----------------- | ---------- | -------- | ------- | ------------------------------------------------------------------------- |
| `filename`        | `string`   | yes      | —       | The config file name to search for.                                       |
| `additionalPaths` | `string[]` | no       | —       | Extra directories to search before the defaults.                          |
| `serviceName`     | `string`   | no       | —       | Optional service name; prepends service-specific filenames to the search. |

## Returns

`ConfigLoader | null` — A loaded ConfigLoader if found, or null if the file does not exist in any search path.

## Source

[`src/ConfigLoader.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts)

Line 88.
