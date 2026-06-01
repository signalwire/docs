---
slug: "/reference/typescript/web-service/web-service-options"
title: "WebServiceOptions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "WebService.WebServiceOptions"
  parent: "WebService"
  module: "WebService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/WebService.ts"
---
# `WebServiceOptions`

Configuration options for WebService.

## Signature

```typescript
interface WebServiceOptions
```

## Properties

| Name                      | Type                     | Required | Default | Description                                                                                                                                          |
| ------------------------- | ------------------------ | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `allowedExtensions`       | `string[]`               | no       | —       | Allowlist of file extensions (e.g. \['.html', '.css']). Default: all allowed.                                                                        |
| `basicAuth`               | `[string, string]`       | no       | —       | Basic auth credentials as \[username, password]. Default: none.                                                                                      |
| `blockedExtensions`       | `string[]`               | no       | —       | Blocklist of file extensions or names. Default: \['.env', '.git', '.gitignore', '.key', '.pem', '.crt', '.pyc', '**pycache**', '.DS\_Store', '.swp'] |
| `configFile`              | `string`                 | no       | —       | Path to a JSON config file. Default: none.                                                                                                           |
| `directories`             | `Record<string, string>` | no       | —       | Map of URL route prefixes to local directory paths. Default: {}.                                                                                     |
| `enableCors`              | `boolean`                | no       | —       | Enable CORS. Default: true.                                                                                                                          |
| `enableDirectoryBrowsing` | `boolean`                | no       | —       | Serve directory listings and fall back to index.html. Default: false.                                                                                |
| `maxFileSize`             | `number`                 | no       | —       | Maximum file size in bytes. Default: 104857600 (100 MB).                                                                                             |
| `port`                    | `number`                 | no       | —       | Port to bind to. Default: 8002.                                                                                                                      |
| `ssl`                     | `SslOptions`             | no       | —       | SSL/TLS configuration options.                                                                                                                       |

## Source

[`src/WebService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/WebService.ts)

Line 53.
