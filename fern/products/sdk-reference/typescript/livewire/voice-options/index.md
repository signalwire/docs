---
slug: "/reference/typescript/livewire/voice-options"
title: "VoiceOptions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "livewire.VoiceOptions"
  parent: "livewire"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `VoiceOptions`

Voice configuration options passed through to the SignalWire AI config.

## Signature

```typescript
interface VoiceOptions
```

## Properties

| Name       | Type     | Required | Default | Description                                              |
| ---------- | -------- | -------- | ------- | -------------------------------------------------------- |
| `engine`   | `string` | yes      | —       | TTS engine identifier (e.g. `"google"`, `"elevenlabs"`). |
| `language` | `string` | yes      | —       | BCP-47 language code (e.g. `"en-US"`).                   |
| `voice`    | `string` | yes      | —       | TTS voice identifier (e.g. `"en-US-Standard-A"`).        |

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 108.
