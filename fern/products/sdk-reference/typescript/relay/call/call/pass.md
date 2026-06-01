---
slug: "/reference/typescript/relay/call/call/pass"
title: "pass"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.pass"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `pass`

Decline control of an inbound call, returning it to routing.

Use instead of [answer](/reference/typescript/relay/call/call/answer) when you want the call to fall through to
the next matching route rather than be handled by this client.

## Signature

```typescript
pass(): Promise<Record<string, unknown>>
```

## Returns

`Promise<Record<string, unknown>>` — The platform's pass response.

## Throws

- When the pass command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 343.
