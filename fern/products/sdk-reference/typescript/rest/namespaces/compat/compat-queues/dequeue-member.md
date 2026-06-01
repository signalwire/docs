---
slug: "/reference/typescript/rest/namespaces/compat/compat-queues/dequeue-member"
title: "dequeueMember"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatQueues.dequeueMember"
  parent: "rest.namespaces.compat.CompatQueues"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `dequeueMember`

Dequeue a member — LAML's `POST` on a queued call redirects it to the
given `Url` (typically to connect the caller to a queue consumer).

## Signature

```typescript
dequeueMember(queueSid: string, callSid: string, body: any = {}): Promise<any>
```

## Parameters

| Name       | Type     | Required | Default | Description                                                       |
| ---------- | -------- | -------- | ------- | ----------------------------------------------------------------- |
| `queueSid` | `string` | yes      | —       | Queue SID.                                                        |
| `callSid`  | `string` | yes      | —       | Call SID of the queued member.                                    |
| `body`     | `any`    | yes      | `{}`    | LAML-form payload (commonly `{ Url, Method }`). Defaults to `{}`. |

## Returns

`Promise<any>` — The updated queue-member record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 626.
