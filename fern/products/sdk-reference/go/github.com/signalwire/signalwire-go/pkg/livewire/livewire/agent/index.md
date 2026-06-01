---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent"
title: "Agent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.Agent"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `Agent`

Agent mirrors a LiveKit Agent — it holds instructions and tool definitions.

## Signature

```go
type Agent struct
```

## Methods

- [`FunctionTool`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent/function-tool) — FunctionTool registers a named tool on the agent. The handler must be
- [`Instructions`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent/instructions) — Instructions returns the agent's current instructions string. Mirrors Python Agent.instructions (public read/write attribute, line 290).
- [`OnEnter`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent/on-enter) — OnEnter registers a callback to be invoked when the agent enters a session. Mirrors Python Agent.on\_enter lifecycle hook (line 346). Returns the Agent for method chaining.
- [`OnExit`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent/on-exit) — OnExit registers a callback to be invoked when the agent exits a session. Mirrors Python Agent.on\_exit lifecycle hook (line 350). Returns the Agent for method chaining.
- [`OnUserTurnCompleted`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent/on-user-turn-completed) — OnUserTurnCompleted registers a callback invoked when the user finishes speaking. The two arguments mirror Python's turn\_ctx and new\_message parameters (line 354), typed as any to avoid a LiveKit dependency. Returns the Agent for method chaining.
- [`Session`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent/session) — Session returns the AgentSession currently bound to this agent, or nil if the agent has not been started. Mirrors Python Agent.session property (lines 334–340).
- [`UpdateTools`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent/update-tools) — UpdateTools replaces the agent's tool list. Mirrors Python Agent.update\_tools (livewire/**init**.py:394) which accepts List\[Any] and stores self.\_tools = list(tools). In Go, the parameter is \[]any to keep the unexported toolDef out of the public signature (the original typed \[]toolDef made the method uncallable from external packages). Elements that aren't recognized tools are silently skipped, matching Python's permissive storage semantics. Returns the Agent for method chaining.

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 124.
