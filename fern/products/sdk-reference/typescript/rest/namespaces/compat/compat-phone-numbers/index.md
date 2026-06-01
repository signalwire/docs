---
slug: "/reference/typescript/rest/namespaces/compat/compat-phone-numbers"
title: "CompatPhoneNumbers"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatPhoneNumbers"
  parent: "rest.namespaces.compat"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `CompatPhoneNumbers`

Compat phone number management with searching, purchasing, and import.

## Signature

```typescript
class CompatPhoneNumbers extends BaseResource
```

## Inheritance

**Extends:** `BaseResource`

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/compat/compat-phone-numbers/constructor)
- [`delete`](/reference/typescript/rest/namespaces/compat/compat-phone-numbers/delete) — Release an owned phone number (delete).
- [`get`](/reference/typescript/rest/namespaces/compat/compat-phone-numbers/get) — Fetch an owned phone number by SID.
- [`importNumber`](/reference/typescript/rest/namespaces/compat/compat-phone-numbers/import-number) — Import an externally-hosted phone number into the account (LAML `/ImportedPhoneNumbers`).
- [`list`](/reference/typescript/rest/namespaces/compat/compat-phone-numbers/list) — List owned incoming phone numbers in the account.
- [`listAvailableCountries`](/reference/typescript/rest/namespaces/compat/compat-phone-numbers/list-available-countries) — List countries in which numbers are available for purchase.
- [`purchase`](/reference/typescript/rest/namespaces/compat/compat-phone-numbers/purchase) — Purchase a phone number (LAML `POST /IncomingPhoneNumbers`).
- [`searchLocal`](/reference/typescript/rest/namespaces/compat/compat-phone-numbers/search-local) — Search for available local phone numbers in a country.
- [`searchTollFree`](/reference/typescript/rest/namespaces/compat/compat-phone-numbers/search-toll-free) — Search for available toll-free phone numbers in a country.
- [`update`](/reference/typescript/rest/namespaces/compat/compat-phone-numbers/update) — Update an owned phone number (webhook URLs, friendly name, etc.). LAML uses `POST`.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 419.
