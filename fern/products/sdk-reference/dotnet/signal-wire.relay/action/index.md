---
slug: "/reference/dotnet/signal-wire.relay/action"
title: "Action"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Action"
  parent: "SignalWire.Relay"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `Action`

Base class for all RELAY call actions (play, record, collect, etc.).

An Action is the client-side handle returned when you start an
asynchronous operation on a call. It accumulates events, tracks
state, and resolves once the operation reaches a terminal state.

Uses <xref href="System.Threading.Tasks.TaskCompletionSource" data-throw-if-not-resolved="false"></xref> for native async/await support.

## Signature

```dotnet
public class Action
```

## Properties

| Name        | Type                                                  | Required | Default | Description |
| ----------- | ----------------------------------------------------- | -------- | ------- | ----------- |
| `CallId`    | `public string CallId { get; }`                       | yes      | —       | —           |
| `Client`    | `protected object Client { get; }`                    | yes      | —       | —           |
| `Completed` | `public bool Completed { get; }`                      | yes      | —       | —           |
| `ControlId` | `public string ControlId { get; }`                    | yes      | —       | —           |
| `Events`    | `public List<Event> Events { get; }`                  | yes      | —       | —           |
| `IsDone`    | `public bool IsDone { get; }`                         | yes      | —       | —           |
| `NodeId`    | `public string NodeId { get; }`                       | yes      | —       | —           |
| `Payload`   | `public Dictionary<string, object?> Payload { get; }` | yes      | —       | —           |
| `Result`    | `public object? Result { get; }`                      | yes      | —       | —           |
| `State`     | `public string? State { get; protected set; }`        | yes      | —       | —           |

## Methods

- [`AcceptsTerminalEvent(string)`](/reference/dotnet/signal-wire.relay/action/accepts-terminal-event-string) — Subclasses may filter which event types can resolve this action via the standard terminal-state path. Default: any event type registered in <xref href="SignalWire.Relay.Constants.ActionTerminalStates" data-throw-if-not-resolved="false"></xref> may resolve. Override returns false to block resolution for a specific event type (e.g. CollectAction blocks <code>calling.call.play</code> so the play phase of <code>play\_and\_collect</code> doesn't resolve the collect side).
- [`Action(string, string, string, object)`](/reference/dotnet/signal-wire.relay/action/action-string-string-string-object)
- [`ExecuteSubcommand(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/action/execute-subcommand-string-dictionary-string-object) — Send a sub-command RPC through the client. The payload always includes control\_id, call\_id, and node\_id.
- [`GetCallId()`](/reference/dotnet/signal-wire.relay/action/get-call-id)
- [`GetControlId()`](/reference/dotnet/signal-wire.relay/action/get-control-id)
- [`GetNodeId()`](/reference/dotnet/signal-wire.relay/action/get-node-id)
- [`GetStopMethod()`](/reference/dotnet/signal-wire.relay/action/get-stop-method) — Return the RELAY RPC method that stops this action. Subclasses MUST override to return the correct method name.
- [`HandleEvent(Event)`](/reference/dotnet/signal-wire.relay/action/handle-event-event) — Append an incoming event and update local state / payload.
- [`OnCompleted`](/reference/dotnet/signal-wire.relay/action/on-completed) — Register a callback to fire when the action completes. If the action is already done the callback fires immediately.
- [`Resolve(object?)`](/reference/dotnet/signal-wire.relay/action/resolve-object) — Mark this action as completed. The optional result is stored and the onCompleted callback fires exactly once.
- [`Stop()`](/reference/dotnet/signal-wire.relay/action/stop) — Stop the running action by sending its stop sub-command.
- [`WaitAsync(int)`](/reference/dotnet/signal-wire.relay/action/wait-async-int) — Await until the action completes or the timeout elapses. Returns the resolved result, or null on timeout.
