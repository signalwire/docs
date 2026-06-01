---
slug: "/reference/typescript/web-service/web-service"
title: "WebService"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "WebService.WebService"
  parent: "WebService"
  module: "WebService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/WebService.ts"
---
# `WebService`

Static file serving service with HTTP API.

Provides configurable static file hosting with per-route directory mounting,
extension filtering, file size limits, HTTP Basic Auth, CORS, directory
browsing, and optional SSL/TLS. Mirrors the Python SDK's `WebService` class.

Useful when an agent or prefab needs to serve supporting assets — prompts, audio
files, images — from the same process without running a separate nginx / CDN.

## Signature

```typescript
class WebService
```

## Examples

```typescript
import { WebService } from '@signalwire/sdk';

const web = new WebService({
  port: 8080,
  directories: { '/audio': './public/audio' },
  allowedExtensions: ['.mp3', '.wav'],
});

await web.serve();
// GET http://host:8080/audio/greeting.mp3
```

## Properties

| Name                      | Type                         | Required | Default | Description                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| ------------------------- | ---------------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `allowedExtensions`       | `string[] \| null`           | yes      | —       | Allowlist of file extensions, or null to allow all (subject to blocklist).                                                                                                                                                                                                                                                                                                                                                                         |
| `blockedExtensions`       | `string[]`                   | yes      | —       | Blocklist of file extensions and file names.                                                                                                                                                                                                                                                                                                                                                                                                       |
| `directories`             | `Record<string, string>`     | yes      | —       | Map of URL route prefixes to local directory paths.                                                                                                                                                                                                                                                                                                                                                                                                |
| `enableCors`              | `boolean`                    | yes      | —       | Whether CORS is enabled.                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `enableDirectoryBrowsing` | `boolean`                    | yes      | —       | Whether directory listings are enabled.                                                                                                                                                                                                                                                                                                                                                                                                            |
| `maxFileSize`             | `number`                     | yes      | —       | Maximum file size in bytes that will be served.                                                                                                                                                                                                                                                                                                                                                                                                    |
| `port`                    | `number`                     | yes      | —       | Port the service binds to.                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `sslConfig`               | `get sslConfig(): SslConfig` | yes      | —       | The SSL/TLS configuration for this service. Mirrors the Python SDK's `security` attribute (`SecurityConfig`), which exposes SSL settings for post-construction inspection.  In the Python SDK `SecurityConfig` also covers CORS origins, HSTS, allowed hosts, and rate limiting; in this SDK those concerns are configured via their own constructor options (`enableCors`, `ssl`, etc.) and Hono middleware rather than a single combined object. |

## Methods

- [`addDirectory`](/reference/typescript/web-service/web-service/add-directory) — Add a new directory to serve at a URL route prefix.
- [`constructor`](/reference/typescript/web-service/web-service/constructor) — Create a WebService.
- [`getApp`](/reference/typescript/web-service/web-service/get-app) — Get the Hono application for mounting or testing.
- [`removeDirectory`](/reference/typescript/web-service/web-service/remove-directory) — Remove a previously added directory route from the bookkeeping map.
- [`start`](/reference/typescript/web-service/web-service/start) — Start the HTTP(S) service.
- [`stop`](/reference/typescript/web-service/web-service/stop) — Stop the service and release resources.

## Source

[`src/WebService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/WebService.ts)

Line 120.
