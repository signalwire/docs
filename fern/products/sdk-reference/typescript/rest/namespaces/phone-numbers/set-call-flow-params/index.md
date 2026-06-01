---
slug: "/reference/typescript/rest/namespaces/phone-numbers/set-call-flow-params"
title: "SetCallFlowParams"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "rest.namespaces.phone-numbers.SetCallFlowParams"
  parent: "rest.namespaces.phone-numbers"
  module: "rest.namespaces.phone-numbers"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts"
---
# `SetCallFlowParams`

Parameters for [PhoneNumbersResource.setCallFlow](/reference/typescript/rest/namespaces/phone-numbers/phone-numbers-resource/set-call-flow).

## Signature

```typescript
interface SetCallFlowParams
```

## Properties

| Name      | Type     | Required | Default | Description                                                                                                                          |
| --------- | -------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `flowId`  | `string` | yes      | —       | Call Flow resource ID. Serialized as `call_flow_id`.                                                                                 |
| `version` | `string` | no       | —       | Optional pinned version — `"working_copy"` or `"current_deployed"` (server default when omitted). Serialized as `call_flow_version`. |

## Source

[`src/rest/namespaces/phone-numbers.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts)

Line 30.
