---
slug: "/reference/typescript/rest/namespaces/fabric/call-flows-resource/list-addresses"
title: "listAddresses"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric.CallFlowsResource.listAddresses"
  parent: "rest.namespaces.fabric.CallFlowsResource"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts"
---
# `listAddresses`

List addresses attached to a call flow resource.

## Signature

```typescript
listAddresses(resourceId: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name         | Type          | Required | Default | Description                                    |
| ------------ | ------------- | -------- | ------- | ---------------------------------------------- |
| `resourceId` | `string`      | yes      | —       | Unique identifier of the call flow.            |
| `params`     | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of addresses.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/fabric.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts)

Line 42.
