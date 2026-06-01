---
slug: "/reference/typescript/rest/namespaces/fabric/call-flows-resource/deploy-version"
title: "deployVersion"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.fabric.CallFlowsResource.deployVersion"
  parent: "rest.namespaces.fabric.CallFlowsResource"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts"
---
# `deployVersion`

Publish a new version of a call flow.

## Signature

```typescript
deployVersion(resourceId: string, body: any = {}): Promise<any>
```

## Parameters

| Name         | Type     | Required | Default | Description                                              |
| ------------ | -------- | -------- | ------- | -------------------------------------------------------- |
| `resourceId` | `string` | yes      | —       | Unique identifier of the call flow.                      |
| `body`       | `any`    | yes      | `{}`    | Version payload (schema and metadata). Defaults to `{}`. |

## Returns

`Promise<any>` — The newly-published version record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/fabric.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/fabric.ts)

Line 68.
