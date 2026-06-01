---
slug: "/reference/typescript/rest/namespaces/fabric/generic-resources/assign-domain-application"
title: "assignDomainApplication"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric.GenericResources.assignDomainApplication"
  parent: "rest.namespaces.fabric.GenericResources"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts"
---
# `assignDomainApplication`

Assign a domain application to a fabric resource.

## Signature

```typescript
assignDomainApplication(resourceId: string, body: any): Promise<any>
```

## Parameters

| Name         | Type     | Required | Default | Description                        |
| ------------ | -------- | -------- | ------- | ---------------------------------- |
| `resourceId` | `string` | yes      | —       | Unique identifier of the resource. |
| `body`       | `any`    | yes      | —       | Domain application payload.        |

## Returns

`Promise<any>` — The domain-application assignment record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/fabric.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts)

Line 319.
