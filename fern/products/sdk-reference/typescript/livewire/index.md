---
slug: "/reference/typescript/livewire"
title: "livewire"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `livewire`

## Signature

```typescript
module livewire
```

## Constants

| Name         | Type                                                                                                                                                                                                                                                                                               | Required | Default | Description                                                                                                                               |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `banner`     | `"\n    __    _            _       ___\n   / /   (_)   _____  \| \|     / (_)_______\n  / /   / / \| / / _ \\ \| \| /\| / / / ___/ _ \\\n / /___/ /\| \|/ /  __/ \| \|/ \|/ / / /  /  __/\n/_____/_/ \|___/\\___/  \|__/\|__/_/_/   \\___/\n\n LiveKit-compatible agents powered by SignalWire\n"` | yes      | —       | —                                                                                                                                         |
| `cli`        | `{ runApp: (options: any) => void }`                                                                                                                                                                                                                                                               | yes      | —       | LiveKit cli namespace equivalent.                                                                                                         |
| `globalNoop` | `NoopTracker`                                                                                                                                                                                                                                                                                      | yes      | —       | —                                                                                                                                         |
| `llm`        | `{ ChatContext: typeof ChatContext; handoff: (options: { agent: Agent; returns?: string }) => AgentHandoff; tool: (options: { description: string; execute: (params: P, context: { ctx: RunContext }) => any; parameters?: any }) => FunctionTool; ToolError: typeof ToolError }`                  | yes      | —       | LiveKit llm namespace equivalent.                                                                                                         |
| `tips`       | `string[]`                                                                                                                                                                                                                                                                                         | yes      | —       | Rotating "Did you know?" tips printed to stderr by the LiveWire banner. Exported for tests; reorder or extend to change what's displayed. |
| `voice`      | `{ Agent: typeof Agent; AgentSession: typeof AgentSession; AgentSessionEventTypes: Record<string, string> }`                                                                                                                                                                                       | yes      | —       | LiveKit voice namespace equivalent.                                                                                                       |

## Functions

- [`defineAgent`](/reference/typescript/livewire/define-agent) — Mirrors `@livekit/agents.defineAgent()`.
- [`handoff`](/reference/typescript/livewire/handoff) — Create an [AgentHandoff](/reference/typescript/livewire/agent-handoff) descriptor for multi-agent scenarios.
- [`printBanner`](/reference/typescript/livewire/print-banner) — Print the ASCII banner to stderr, using ANSI cyan when stderr is a TTY.
- [`printTip`](/reference/typescript/livewire/print-tip)
- [`runApp`](/reference/typescript/livewire/run-app) — Mirrors `cli.runApp()` from `@livekit/agents-js`.
- [`tool`](/reference/typescript/livewire/tool) — Create a tool definition — mirrors `llm.tool()` from `@livekit/agents-js`.

## Classes

- [`Agent`](/reference/typescript/livewire/agent) — Mirrors a LiveKit `voice.Agent` — holds instructions and tool definitions.
- [`AgentHandoff`](/reference/typescript/livewire/agent-handoff) — Signals a handoff to another agent in multi-agent scenarios.
- [`AgentServer`](/reference/typescript/livewire/agent-server) — Mirrors a LiveKit AgentServer -- registers entrypoints and starts.
- [`AgentSession`](/reference/typescript/livewire/agent-session) — Mirrors a LiveKit `AgentSession` — binds an [Agent](/reference/typescript/livewire/agent) to SignalWire.
- [`ChatContext`](/reference/typescript/livewire/chat-context) — Minimal `ChatContext` matching LiveKit's `ChatContext`.
- [`JobContext`](/reference/typescript/livewire/job-context) — Mirrors a LiveKit `JobContext` — provides room and connection info to the entry-point callback registered via [defineAgent](/reference/typescript/livewire/define-agent).
- [`JobProcess`](/reference/typescript/livewire/job-process) — Mirrors a LiveKit `JobProcess` — placeholder for prewarm / setup hooks.
- [`NoopTracker`](/reference/typescript/livewire/noop-tracker) — NoopTracker ensures each informational message is logged at most once, preventing spam when the same noop path is exercised repeatedly.
- [`Room`](/reference/typescript/livewire/room) — Stub `Room` — SignalWire does not use the LiveKit room abstraction.
- [`RunContext`](/reference/typescript/livewire/run-context) — Mirrors a LiveKit `RunContext` — passed to tool handlers so they can read the current session, call handle, and user data.
- [`ServerOptions`](/reference/typescript/livewire/server-options) — Stub class mirroring LiveKit's `ServerOptions`.
- [`StopResponse`](/reference/typescript/livewire/stop-response) — Signals that a tool should not trigger another LLM reply.
- [`ToolError`](/reference/typescript/livewire/tool-error) — Error thrown from a tool to signal failure back to the LLM.
- [`WorkerOptions`](/reference/typescript/livewire/worker-options) — Stub class mirroring LiveKit's `WorkerOptions`.

## Interfaces

- [`FunctionTool`](/reference/typescript/livewire/function-tool) — A tool definition that can be registered on an [Agent](/reference/typescript/livewire/agent).
- [`VoiceOptions`](/reference/typescript/livewire/voice-options) — Voice configuration options passed through to the SignalWire AI config.

## Modules

- [`inference`](/reference/typescript/livewire/inference) — Stub inference types matching LiveKit's `inference` namespace.
- [`plugins`](/reference/typescript/livewire/plugins) — Stub providers matching common LiveKit plugin packages.

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 1.
