---
slug: "/reference/typescript/rest/namespaces/sip-profile/sip-profile-resource/update"
title: "update"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.sip-profile.SipProfileResource.update"
  parent: "rest.namespaces.sip-profile.SipProfileResource"
  module: "rest.namespaces.sip-profile"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/sip-profile.ts"
---
# `update`

Update the project's SIP profile.

## Signature

```typescript
update(body: any): Promise<any>
```

## Parameters

| Name   | Type  | Required | Default | Description                                                  |
| ------ | ----- | -------- | ------- | ------------------------------------------------------------ |
| `body` | `any` | yes      | —       | Full SIP profile attributes (replace semantics — not patch). |

## Returns

`Promise<any>` — The updated SIP profile.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/sip-profile.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/sip-profile.ts)

Line 37.
