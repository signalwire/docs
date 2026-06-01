---
slug: "/reference/typescript/rest/namespaces/number-groups/number-groups-resource"
title: "NumberGroupsResource"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.number-groups.NumberGroupsResource"
  parent: "rest.namespaces.number-groups"
  module: "rest.namespaces.number-groups"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/number-groups.ts"
---
# `NumberGroupsResource`

Number group management with membership operations.

Access via `client.numberGroups.*`. Extends standard CRUD with membership helpers.

## Signature

```typescript
class NumberGroupsResource extends CrudResource
```

## Inheritance

**Extends:** `CrudResource`

## Methods

- [`addMembership`](/reference/typescript/rest/namespaces/number-groups/number-groups-resource/add-membership) — Add a phone number to a group.
- [`constructor`](/reference/typescript/rest/namespaces/number-groups/number-groups-resource/constructor)
- [`create`](/reference/typescript/rest/namespaces/number-groups/number-groups-resource/create) — Create a new resource.
- [`delete`](/reference/typescript/rest/namespaces/number-groups/number-groups-resource/delete) — Delete a resource by ID.
- [`deleteMembership`](/reference/typescript/rest/namespaces/number-groups/number-groups-resource/delete-membership) — Remove a number from a group by deleting its membership.
- [`get`](/reference/typescript/rest/namespaces/number-groups/number-groups-resource/get) — Fetch a single resource by ID.
- [`getMembership`](/reference/typescript/rest/namespaces/number-groups/number-groups-resource/get-membership) — Fetch a membership by ID.
- [`list`](/reference/typescript/rest/namespaces/number-groups/number-groups-resource/list) — List resources with optional query parameters.
- [`listMemberships`](/reference/typescript/rest/namespaces/number-groups/number-groups-resource/list-memberships) — List memberships (phone-number assignments) in a group.
- [`update`](/reference/typescript/rest/namespaces/number-groups/number-groups-resource/update) — Update a resource by ID.

## Source

[`src/rest/namespaces/number-groups.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/number-groups.ts)

Line 16.
