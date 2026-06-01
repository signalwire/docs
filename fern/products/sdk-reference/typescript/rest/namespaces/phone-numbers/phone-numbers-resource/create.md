---
slug: "/reference/typescript/rest/namespaces/phone-numbers/phone-numbers-resource/create"
title: "create"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.phone-numbers.PhoneNumbersResource.create"
  parent: "rest.namespaces.phone-numbers.PhoneNumbersResource"
  module: "rest.namespaces.phone-numbers"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts"
---
# `create`

Purchase / create a phone number resource in this project.
Body is optional to match Python's `**kwargs` call convention.

## Signature

```typescript
create(body: any = {}): Promise<any>
```

## Parameters

| Name   | Type  | Required | Default | Description                                                                          |
| ------ | ----- | -------- | ------- | ------------------------------------------------------------------------------------ |
| `body` | `any` | yes      | `{}`    | Phone-number creation payload (platform-shaped JSON). Defaults to `{}` when omitted. |

## Returns

`Promise<any>` — The newly-created phone-number resource.

## Throws

- On any non-2xx HTTP response.

## Examples

```typescript
const num = await client.phoneNumbers.create({ number: '+15551234567' });
```

## Source

[`src/rest/namespaces/phone-numbers.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts)

Line 95.
