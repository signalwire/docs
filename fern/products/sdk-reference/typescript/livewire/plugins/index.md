---
slug: "/reference/typescript/livewire/plugins"
title: "plugins"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "livewire.plugins"
  parent: "livewire"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `plugins`

Stub providers matching common LiveKit plugin packages.

None of these do anything — they exist so LiveKit code that imports and
constructs these classes still compiles and runs under SignalWire. The
first construction of each logs an advisory to stderr.

## Signature

```typescript
module plugins
```

## Classes

- [`CartesiaTTS`](/reference/typescript/livewire/plugins/cartesia-tts) — LiveKit Cartesia-TTS plugin stub. No-op on SignalWire.
- [`DeepgramSTT`](/reference/typescript/livewire/plugins/deepgram-stt) — LiveKit Deepgram-STT plugin stub. No-op on SignalWire.
- [`ElevenLabsTTS`](/reference/typescript/livewire/plugins/eleven-labs-tts) — LiveKit ElevenLabs-TTS plugin stub. No-op on SignalWire.
- [`OpenAILLM`](/reference/typescript/livewire/plugins/open-aillm) — LiveKit OpenAI-LLM plugin stub.
- [`SileroVAD`](/reference/typescript/livewire/plugins/silero-vad) — LiveKit Silero-VAD plugin stub. No-op on SignalWire.

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 1071.
