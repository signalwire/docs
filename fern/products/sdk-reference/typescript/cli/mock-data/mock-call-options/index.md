---
slug: "/reference/typescript/cli/mock-data/mock-call-options"
title: "MockCallOptions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "cli.mock-data.MockCallOptions"
  parent: "cli.mock-data"
  module: "cli.mock-data"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/cli/mock-data.ts"
---
# `MockCallOptions`

Options for generating mock call data in CLI testing.

## Signature

```typescript
interface MockCallOptions
```

## Properties

| Name            | Type                      | Required | Default | Description                                               |
| --------------- | ------------------------- | -------- | ------- | --------------------------------------------------------- |
| `callDirection` | `"inbound" \| "outbound"` | no       | —       | Direction of the call.                                    |
| `callId`        | `string`                  | no       | —       | Override the auto-generated call ID.                      |
| `callState`     | `string`                  | no       | —       | Current call state (e.g. "active", "ringing", "hold").    |
| `callType`      | `"sip" \| "webrtc"`       | no       | —       | Call transport type.                                      |
| `fromNumber`    | `string`                  | no       | —       | Caller's phone number.                                    |
| `overrides`     | `Record<string, unknown>` | no       | —       | Additional key-value overrides merged into the post data. |
| `toExtension`   | `string`                  | no       | —       | Destination extension or agent name.                      |

## Source

[`src/cli/mock-data.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/cli/mock-data.ts)

Line 9.
