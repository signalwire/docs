---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent-session"
title: "AgentSession"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.AgentSession"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `AgentSession`

AgentSession mirrors a LiveKit AgentSession — it binds an Agent to the SignalWire platform and manages the call lifecycle.

## Signature

```go
type AgentSession struct
```

## Methods

- [`GenerateReply`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent-session/generate-reply) — GenerateReply triggers the agent to speak. On SignalWire this is handled by the prompt; reply instructions are appended to the prompt.
- [`GetSwAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent-session/get-sw-agent) — GetSwAgent returns the underlying SignalWire AgentBase (for testing/advanced use).
- [`History`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent-session/history) — History returns the conversation turn history (read-only). Mirrors Python AgentSession.history property (line 497).
- [`Interrupt`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent-session/interrupt) — Interrupt interrupts current speech — noop on SignalWire (barge-in is automatic).
- [`Say`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent-session/say) — Say queues text to be spoken by the agent.
- [`SetUserdata`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent-session/set-userdata) — SetUserdata sets the session-level userdata. Mirrors Python AgentSession.userdata property setter (line 493).
- [`Start`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent-session/start) — Start binds the session to an agent and prepares the underlying SignalWire AgentBase for serving.
- [`UpdateAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent-session/update-agent) — UpdateAgent swaps in a new Agent mid-session. Mirrors Python AgentSession.update\_agent (line 528) which sets self.\_agent = agent and agent.session = self.
- [`UpdateInstructions`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent-session/update-instructions) — UpdateInstructions changes the agent's prompt mid-session.
- [`Userdata`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent-session/userdata) — Userdata returns the session-level userdata. Mirrors Python AgentSession.userdata property getter (line 489).

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 330.
