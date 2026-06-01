---
slug: "/reference/typescript/rest/namespaces/queues/queues-resource"
title: "QueuesResource"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.queues.QueuesResource"
  parent: "rest.namespaces.queues"
  module: "rest.namespaces.queues"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/queues.ts"
---
# `QueuesResource`

Queue management with member operations.

Access via `client.queues.*`. Extends standard CRUD with member list/fetch.

## Signature

```typescript
class QueuesResource extends CrudResource
```

## Inheritance

**Extends:** `CrudResource`

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/queues/queues-resource/constructor)
- [`create`](/reference/typescript/rest/namespaces/queues/queues-resource/create) — Create a new resource.
- [`delete`](/reference/typescript/rest/namespaces/queues/queues-resource/delete) — Delete a resource by ID.
- [`get`](/reference/typescript/rest/namespaces/queues/queues-resource/get) — Fetch a single resource by ID.
- [`getMember`](/reference/typescript/rest/namespaces/queues/queues-resource/get-member) — Fetch a specific queue member by ID.
- [`getNextMember`](/reference/typescript/rest/namespaces/queues/queues-resource/get-next-member) — Get the next member to be served in a queue (FIFO head).
- [`list`](/reference/typescript/rest/namespaces/queues/queues-resource/list) — List resources with optional query parameters.
- [`listMembers`](/reference/typescript/rest/namespaces/queues/queues-resource/list-members) — List members in a queue.
- [`update`](/reference/typescript/rest/namespaces/queues/queues-resource/update) — Update a resource by ID.

## Source

[`src/rest/namespaces/queues.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/queues.ts)

Line 16.
