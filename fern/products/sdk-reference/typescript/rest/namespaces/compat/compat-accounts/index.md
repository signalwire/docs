---
slug: "/reference/typescript/rest/namespaces/compat/compat-accounts"
title: "CompatAccounts"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatAccounts"
  parent: "rest.namespaces.compat"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `CompatAccounts`

Compat account / subproject management (Twilio-compatible LAML).

## Signature

```typescript
class CompatAccounts extends BaseResource
```

## Inheritance

**Extends:** `BaseResource`

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/compat/compat-accounts/constructor)
- [`create`](/reference/typescript/rest/namespaces/compat/compat-accounts/create) — Create a new sub-account under the authenticated parent account.
- [`get`](/reference/typescript/rest/namespaces/compat/compat-accounts/get) — Fetch an account by SID.
- [`list`](/reference/typescript/rest/namespaces/compat/compat-accounts/list) — List accounts visible to the authenticated project.
- [`update`](/reference/typescript/rest/namespaces/compat/compat-accounts/update) — Update an account's attributes. LAML uses `POST` (not PATCH/PUT).

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 15.
