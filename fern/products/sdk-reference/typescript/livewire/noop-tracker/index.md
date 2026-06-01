---
slug: "/reference/typescript/livewire/noop-tracker"
title: "NoopTracker"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "livewire.NoopTracker"
  parent: "livewire"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `NoopTracker`

NoopTracker ensures each informational message is logged at most once,
preventing spam when the same noop path is exercised repeatedly.

## Signature

```typescript
class NoopTracker
```

## Methods

- [`constructor`](/reference/typescript/livewire/noop-tracker/constructor)
- [`hasLogged`](/reference/typescript/livewire/noop-tracker/has-logged) — Expose whether a key has been logged (for testing).
- [`once`](/reference/typescript/livewire/noop-tracker/once) — Log the given message the first time this key is seen.
- [`reset`](/reference/typescript/livewire/noop-tracker/reset) — Reset all tracked keys (for testing).

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 72.
