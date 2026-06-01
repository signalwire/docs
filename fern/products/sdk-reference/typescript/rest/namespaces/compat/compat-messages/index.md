---
slug: "/reference/typescript/rest/namespaces/compat/compat-messages"
title: "CompatMessages"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatMessages"
  parent: "rest.namespaces.compat"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `CompatMessages`

Compat message management with media sub-resources.

## Signature

```typescript
class CompatMessages extends CrudResource
```

## Inheritance

**Extends:** `CrudResource`

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/compat/compat-messages/constructor)
- [`create`](/reference/typescript/rest/namespaces/compat/compat-messages/create) — Create a new resource.
- [`delete`](/reference/typescript/rest/namespaces/compat/compat-messages/delete) — Delete a resource by ID.
- [`deleteMedia`](/reference/typescript/rest/namespaces/compat/compat-messages/delete-media) — Delete a media attachment from a message.
- [`get`](/reference/typescript/rest/namespaces/compat/compat-messages/get) — Fetch a single resource by ID.
- [`getMedia`](/reference/typescript/rest/namespaces/compat/compat-messages/get-media) — Fetch a specific media attachment on a message.
- [`list`](/reference/typescript/rest/namespaces/compat/compat-messages/list) — List resources with optional query parameters.
- [`listMedia`](/reference/typescript/rest/namespaces/compat/compat-messages/list-media) — List media attachments for a message (MMS).
- [`update`](/reference/typescript/rest/namespaces/compat/compat-messages/update) — Update a message. LAML uses `POST` (not PATCH/PUT).

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 137.
