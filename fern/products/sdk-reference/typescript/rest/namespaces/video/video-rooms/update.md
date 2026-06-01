---
slug: "/reference/typescript/rest/namespaces/video/video-rooms/update"
title: "update"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.video.VideoRooms.update"
  parent: "rest.namespaces.video.VideoRooms"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts"
---
# `update`

Update a resource by ID.

Uses HTTP `PATCH` by default; subclasses may set `_updateMethod = 'PUT'`
when the remote API requires a full-replacement semantics.

## Signature

```typescript
update(resourceId: string, body: any): Promise<any>
```

## Parameters

| Name         | Type     | Required | Default | Description                        |
| ------------ | -------- | -------- | ------- | ---------------------------------- |
| `resourceId` | `string` | yes      | —       | Unique identifier of the resource. |
| `body`       | `any`    | yes      | —       | Request body with updated fields.  |

## Returns

`Promise<any>` — The updated resource.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/base/CrudResource.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts)

Line 81.
