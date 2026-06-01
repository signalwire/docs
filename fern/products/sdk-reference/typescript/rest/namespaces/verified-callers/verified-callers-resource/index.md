---
slug: "/reference/typescript/rest/namespaces/verified-callers/verified-callers-resource"
title: "VerifiedCallersResource"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.verified-callers.VerifiedCallersResource"
  parent: "rest.namespaces.verified-callers"
  module: "rest.namespaces.verified-callers"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/verified-callers.ts"
---
# `VerifiedCallersResource`

Verified caller ID management with verification flow.

Access via `client.verifiedCallers.*`. Extends standard CRUD with
`redialVerification()` and `submitVerification()` for the two-step
phone-number verification handshake.

## Signature

```typescript
class VerifiedCallersResource extends CrudResource
```

## Inheritance

**Extends:** `CrudResource`

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/verified-callers/verified-callers-resource/constructor)
- [`create`](/reference/typescript/rest/namespaces/verified-callers/verified-callers-resource/create) — Create a new resource.
- [`delete`](/reference/typescript/rest/namespaces/verified-callers/verified-callers-resource/delete) — Delete a resource by ID.
- [`get`](/reference/typescript/rest/namespaces/verified-callers/verified-callers-resource/get) — Fetch a single resource by ID.
- [`list`](/reference/typescript/rest/namespaces/verified-callers/verified-callers-resource/list) — List resources with optional query parameters.
- [`redialVerification`](/reference/typescript/rest/namespaces/verified-callers/verified-callers-resource/redial-verification) — Redial the verification call, starting the handshake over from scratch.
- [`submitVerification`](/reference/typescript/rest/namespaces/verified-callers/verified-callers-resource/submit-verification) — Submit the verification code the caller received on the verification call.
- [`update`](/reference/typescript/rest/namespaces/verified-callers/verified-callers-resource/update) — Update a resource by ID.

## Source

[`src/rest/namespaces/verified-callers.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/verified-callers.ts)

Line 17.
