---
slug: "/reference/typescript/rest/namespaces/calling/calling-namespace/collect-start-input-timers"
title: "collectStartInputTimers"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.calling.CallingNamespace.collectStartInputTimers"
  parent: "rest.namespaces.calling.CallingNamespace"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts"
---
# `collectStartInputTimers`

Start input timers for a collect operation (useful when `initial_timeout`
should be reset after media finishes playing).

## Signature

```typescript
collectStartInputTimers(callId: string, params: any = {}): Promise<any>
```

## Parameters

| Name     | Type     | Required | Default | Description                                  |
| -------- | -------- | -------- | ------- | -------------------------------------------- |
| `callId` | `string` | yes      | —       | Target call's ID.                            |
| `params` | `any`    | yes      | `{}`    | Must include `control_id`. Defaults to `{}`. |

## Returns

`Promise<any>` — The platform's response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/calling.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts)

Line 267.
