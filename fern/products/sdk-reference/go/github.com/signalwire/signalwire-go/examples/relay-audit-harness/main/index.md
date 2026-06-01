---
slug: "/reference/go/github.com/signalwire/signalwire-go/examples/relay-audit-harness/main"
title: "main"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/examples/relay_audit_harness"
  module: "github.com.signalwire.signalwire-go.examples.relay_audit_harness"
---
# `main`

Example: relay\_audit\_harness

Audit-only harness — runs a RelayClient against a local fixture that speaks JSON-RPC 2.0 + the SignalWire RELAY handshake. Used by porting-sdk/scripts/audit\_relay\_handshake.py to prove the Go RELAY client opens a real WebSocket, runs the connect handshake, subscribes to a context, and dispatches an inbound event end-to-end.

Contract (from porting-sdk SUBAGENT\_PLAYBOOK.md):

- Reads SIGNALWIRE\_RELAY\_HOST (e.g. "127.0.0.1:5050")
- Reads SIGNALWIRE\_RELAY\_SCHEME (e.g. "ws" — fixture serves plain WebSocket; the SDK honors this env var in its connect URL builder)
- Reads SIGNALWIRE\_PROJECT\_ID, SIGNALWIRE\_API\_TOKEN, SIGNALWIRE\_CONTEXTS
- Connects, subscribes, waits up to 5s for one inbound event
- When the event arrives, sends a JSON-RPC `signalwire.event` notification back so the fixture sees the dispatch ack
- Exits 0 on success, non-zero on error

Not for production use. The harness's whole purpose is to give the audit a small, fast binary to drive its fixture against.

## Signature

```go
package main
```
