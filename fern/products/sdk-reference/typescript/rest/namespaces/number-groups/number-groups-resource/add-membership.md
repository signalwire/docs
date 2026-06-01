---
slug: "/reference/typescript/rest/namespaces/number-groups/number-groups-resource/add-membership"
title: "addMembership"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.number-groups.NumberGroupsResource.addMembership"
  parent: "rest.namespaces.number-groups.NumberGroupsResource"
  module: "rest.namespaces.number-groups"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/number-groups.ts"
---
# `addMembership`

Add a phone number to a group.

## Signature

```typescript
addMembership(groupId: string, body: any): Promise<any>
```

## Parameters

| Name      | Type     | Required | Default | Description                                                  |
| --------- | -------- | -------- | ------- | ------------------------------------------------------------ |
| `groupId` | `string` | yes      | —       | Unique identifier of the number group.                       |
| `body`    | `any`    | yes      | —       | Membership payload (typically `{ phone_number_id: "..." }`). |

## Returns

`Promise<any>` — The newly-created membership record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/number-groups.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/number-groups.ts)

Line 43.
