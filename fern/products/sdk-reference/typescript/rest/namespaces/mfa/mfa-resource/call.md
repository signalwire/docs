---
slug: "/reference/typescript/rest/namespaces/mfa/mfa-resource/call"
title: "call"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.mfa.MfaResource.call"
  parent: "rest.namespaces.mfa.MfaResource"
  module: "rest.namespaces.mfa"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/mfa.ts"
---
# `call`

Initiate MFA by placing a phone call that reads out a one-time code.

## Signature

```typescript
call(body: any): Promise<any>
```

## Parameters

| Name   | Type  | Required | Default | Description                                               |
| ------ | ----- | -------- | ------- | --------------------------------------------------------- |
| `body` | `any` | yes      | —       | MFA request payload (typically `{ to: "+15551234567" }`). |

## Returns

`Promise<any>` — The MFA request record; its `id` is used by [verify](/reference/typescript/rest/namespaces/mfa/mfa-resource/verify).

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/mfa.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/mfa.ts)

Line 46.
