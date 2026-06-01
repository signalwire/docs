---
slug: "/reference/typescript/rest/namespaces/compat/compat-messages/update"
title: "update"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatMessages.update"
  parent: "rest.namespaces.compat.CompatMessages"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `update`

Update a message. LAML uses `POST` (not PATCH/PUT).

## Signature

```typescript
update(sid: string, body: any = {}): Promise<any>
```

## Parameters

| Name   | Type     | Required | Default | Description                                 |
| ------ | -------- | -------- | ------- | ------------------------------------------- |
| `sid`  | `string` | yes      | —       | Message SID (e.g. `"SM..."` / `"MM..."`).   |
| `body` | `any`    | yes      | `{}`    | LAML-form update payload. Defaults to `{}`. |

## Returns

`Promise<any>` — The updated message record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 150.
