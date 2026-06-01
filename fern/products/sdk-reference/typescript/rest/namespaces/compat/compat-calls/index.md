---
slug: "/reference/typescript/rest/namespaces/compat/compat-calls"
title: "CompatCalls"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatCalls"
  parent: "rest.namespaces.compat"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `CompatCalls`

Compat call management with recording and stream sub-resources.

## Signature

```typescript
class CompatCalls extends CrudResource
```

## Inheritance

**Extends:** `CrudResource`

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/compat/compat-calls/constructor)
- [`create`](/reference/typescript/rest/namespaces/compat/compat-calls/create) — Create a new resource.
- [`delete`](/reference/typescript/rest/namespaces/compat/compat-calls/delete) — Delete a resource by ID.
- [`get`](/reference/typescript/rest/namespaces/compat/compat-calls/get) — Fetch a single resource by ID.
- [`list`](/reference/typescript/rest/namespaces/compat/compat-calls/list) — List resources with optional query parameters.
- [`startRecording`](/reference/typescript/rest/namespaces/compat/compat-calls/start-recording) — Start recording an active call.
- [`startStream`](/reference/typescript/rest/namespaces/compat/compat-calls/start-stream) — Start a media stream on an active call (WebSocket media forwarding).
- [`stopStream`](/reference/typescript/rest/namespaces/compat/compat-calls/stop-stream) — Stop an active media stream on a call.
- [`update`](/reference/typescript/rest/namespaces/compat/compat-calls/update) — Update an in-progress or past call. LAML uses `POST` (not PATCH/PUT).
- [`updateRecording`](/reference/typescript/rest/namespaces/compat/compat-calls/update-recording) — Update an active recording (e.g. `Status=paused` / `Status=stopped`).

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 67.
