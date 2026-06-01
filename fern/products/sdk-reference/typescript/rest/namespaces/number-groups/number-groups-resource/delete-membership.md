---
slug: "/reference/typescript/rest/namespaces/number-groups/number-groups-resource/delete-membership"
title: "deleteMembership"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.number-groups.NumberGroupsResource.deleteMembership"
  parent: "rest.namespaces.number-groups.NumberGroupsResource"
  module: "rest.namespaces.number-groups"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/number-groups.ts"
---
# `deleteMembership`

Remove a number from a group by deleting its membership.

## Signature

```typescript
deleteMembership(membershipId: string): Promise<any>
```

## Parameters

| Name           | Type     | Required | Default | Description                          |
| -------------- | -------- | -------- | ------- | ------------------------------------ |
| `membershipId` | `string` | yes      | —       | Unique identifier of the membership. |

## Returns

`Promise<any>` — The platform's delete response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/number-groups.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/number-groups.ts)

Line 65.
