---
slug: "/reference/typescript/rest/namespaces/number-groups/number-groups-resource/get-membership"
title: "getMembership"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.number-groups.NumberGroupsResource.getMembership"
  parent: "rest.namespaces.number-groups.NumberGroupsResource"
  module: "rest.namespaces.number-groups"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/number-groups.ts"
---
# `getMembership`

Fetch a membership by ID.

## Signature

```typescript
getMembership(membershipId: string): Promise<any>
```

## Parameters

| Name           | Type     | Required | Default | Description                          |
| -------------- | -------- | -------- | ------- | ------------------------------------ |
| `membershipId` | `string` | yes      | —       | Unique identifier of the membership. |

## Returns

`Promise<any>` — The membership record.

## Throws

- On any non-2xx HTTP response (including `404`).

## Source

[`src/rest/namespaces/number-groups.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/number-groups.ts)

Line 54.
