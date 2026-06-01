---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/validate-basic-auth"
title: "validateBasicAuth"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.validateBasicAuth"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `validateBasicAuth`

Override to add custom basic-auth validation logic beyond credential matching.

## Signature

```typescript
validateBasicAuth(
  _username: string,
  _password: string
): boolean | Promise<boolean>
```

## Parameters

| Name        | Type     | Required | Default | Description                    |
| ----------- | -------- | -------- | ------- | ------------------------------ |
| `_username` | `string` | yes      | —       | The username from the request. |
| `_password` | `string` | yes      | —       | The password from the request. |

## Returns

`boolean | Promise<boolean>` — True if the credentials are valid; false to reject the request.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1961.
