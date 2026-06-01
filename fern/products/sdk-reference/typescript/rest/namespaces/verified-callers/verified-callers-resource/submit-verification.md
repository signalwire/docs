---
slug: "/reference/typescript/rest/namespaces/verified-callers/verified-callers-resource/submit-verification"
title: "submitVerification"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.verified-callers.VerifiedCallersResource.submitVerification"
  parent: "rest.namespaces.verified-callers.VerifiedCallersResource"
  module: "rest.namespaces.verified-callers"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/verified-callers.ts"
---
# `submitVerification`

Submit the verification code the caller received on the verification call.

## Signature

```typescript
submitVerification(callerId: string, body: any): Promise<any>
```

## Parameters

| Name       | Type     | Required | Default | Description                                                       |
| ---------- | -------- | -------- | ------- | ----------------------------------------------------------------- |
| `callerId` | `string` | yes      | —       | Unique identifier of the verified caller ID resource.             |
| `body`     | `any`    | yes      | —       | Verification payload (typically `{ verification_code: "1234" }`). |

## Returns

`Promise<any>` — The completed verification record.

## Throws

- On any non-2xx HTTP response (including a rejected code).

## Source

[`src/rest/namespaces/verified-callers.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/verified-callers.ts)

Line 43.
