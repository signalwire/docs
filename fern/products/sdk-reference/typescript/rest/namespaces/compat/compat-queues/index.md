---
slug: "/reference/typescript/rest/namespaces/compat/compat-queues"
title: "CompatQueues"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatQueues"
  parent: "rest.namespaces.compat"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `CompatQueues`

Compat queue management with member operations.

## Signature

```typescript
class CompatQueues extends CrudResource
```

## Inheritance

**Extends:** `CrudResource`

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/compat/compat-queues/constructor)
- [`create`](/reference/typescript/rest/namespaces/compat/compat-queues/create) — Create a new resource.
- [`delete`](/reference/typescript/rest/namespaces/compat/compat-queues/delete) — Delete a resource by ID.
- [`dequeueMember`](/reference/typescript/rest/namespaces/compat/compat-queues/dequeue-member) — Dequeue a member — LAML's `POST` on a queued call redirects it to the given `Url` (typically to connect the caller to a queue consumer).
- [`get`](/reference/typescript/rest/namespaces/compat/compat-queues/get) — Fetch a single resource by ID.
- [`getMember`](/reference/typescript/rest/namespaces/compat/compat-queues/get-member) — Fetch a specific member (by call SID) currently waiting in a queue.
- [`list`](/reference/typescript/rest/namespaces/compat/compat-queues/list) — List resources with optional query parameters.
- [`listMembers`](/reference/typescript/rest/namespaces/compat/compat-queues/list-members) — List members (calls) currently waiting in a queue.
- [`update`](/reference/typescript/rest/namespaces/compat/compat-queues/update) — Update a queue. LAML uses `POST` (not PATCH/PUT).

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 574.
