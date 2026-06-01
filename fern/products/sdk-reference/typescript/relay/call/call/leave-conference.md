---
slug: "/reference/typescript/relay/call/call/leave-conference"
title: "leaveConference"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.leaveConference"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `leaveConference`

Leave an audio conference.

## Signature

```typescript
leaveConference(
  conferenceId: string,
  extra?: Record<string, unknown>
): Promise<Record<string, unknown>>
```

## Parameters

| Name           | Type                      | Required | Default | Description                                         |
| -------------- | ------------------------- | -------- | ------- | --------------------------------------------------- |
| `conferenceId` | `string`                  | yes      | —       | Identifier of the conference to leave.              |
| `extra`        | `Record<string, unknown>` | no       | —       | Optional additional params merged into the request. |

## Returns

`Promise<Record<string, unknown>>` — The platform's leave-conference response.

## Throws

- When the leave\_conference command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 873.
