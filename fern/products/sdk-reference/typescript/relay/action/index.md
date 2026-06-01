---
slug: "/reference/typescript/relay/action"
title: "Action"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "relay.Action"
  module: "relay"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts"
---
# `Action`

## Signature

```typescript
module Action
```

## Classes

- [`Action`](/reference/typescript/relay/action/action) — Async handle for a controllable call operation (play, record, tap, detect, etc.).
- [`AIAction`](/reference/typescript/relay/action/ai-action) — Async handle for a `calling.call.ai` action (on-call AI agent session).
- [`CollectAction`](/reference/typescript/relay/action/collect-action) — Async handle for a `play_and_collect` action (combined playback + input collection).
- [`DetectAction`](/reference/typescript/relay/action/detect-action) — Async handle for a `calling.call.detect` action (machine / fax / digit).
- [`FaxAction`](/reference/typescript/relay/action/fax-action) — Async handle for a `send_fax` or `receive_fax` action.
- [`PayAction`](/reference/typescript/relay/action/pay-action) — Async handle for a `calling.call.pay` action (PCI-compliant payment collection).
- [`PlayAction`](/reference/typescript/relay/action/play-action) — Async handle for a `calling.call.play` action — controls playback in progress.
- [`RecordAction`](/reference/typescript/relay/action/record-action) — Async handle for a `calling.call.record` action — controls recording in progress.
- [`StandaloneCollectAction`](/reference/typescript/relay/action/standalone-collect-action) — Async handle for a bare `calling.call.collect` action (no accompanying play).
- [`StreamAction`](/reference/typescript/relay/action/stream-action) — Async handle for a `calling.call.stream` action (outbound media stream).
- [`TapAction`](/reference/typescript/relay/action/tap-action) — Async handle for a `calling.call.tap` action (media mirroring).
- [`TranscribeAction`](/reference/typescript/relay/action/transcribe-action) — Async handle for a `calling.call.transcribe` action (real-time transcription).

## Interfaces

- [`CallLike`](/reference/typescript/relay/action/call-like) — Structural subset of [Call](/reference/typescript/relay/call) that an Action needs — avoids a circular import between `Call.ts` and `Action.ts`.

## Source

[`src/relay/Action.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts)

Line 1.
