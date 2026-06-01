---
slug: "/reference/dotnet/signal-wire.relay/call"
title: "Call"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Call"
  parent: "SignalWire.Relay"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `Call`

Represents a RELAY voice call.

Holds call-level state, dispatches server events to registered listeners
and to in-flight Action objects, and exposes every calling.\* RPC method
as a first-class C# method.

## Signature

```dotnet
public class Call
```

## Properties

| Name               | Type                                                                     | Required | Default | Description                                                                                                                                                                          |
| ------------------ | ------------------------------------------------------------------------ | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `Actions`          | `public Dictionary<string, Action> Actions { get; }`                     | yes      | —       | controlId => Action                                                                                                                                                                  |
| `CallId`           | `public string? CallId { get; set; }`                                    | yes      | —       | —                                                                                                                                                                                    |
| `Client`           | `public Client Client { get; }`                                          | yes      | —       | —                                                                                                                                                                                    |
| `Context`          | `public string? Context { get; set; }`                                   | yes      | —       | —                                                                                                                                                                                    |
| `Device`           | `public Dictionary<string, object?> Device { get; set; }`                | yes      | —       | —                                                                                                                                                                                    |
| `DialWinner`       | `public bool DialWinner { get; set; }`                                   | yes      | —       | —                                                                                                                                                                                    |
| `Direction`        | `public string? Direction { get; set; }`                                 | yes      | —       | —                                                                                                                                                                                    |
| `EndReason`        | `public string? EndReason { get; set; }`                                 | yes      | —       | —                                                                                                                                                                                    |
| `NodeId`           | `public string? NodeId { get; set; }`                                    | yes      | —       | —                                                                                                                                                                                    |
| `OnEventCallbacks` | `public List<Action<Event, Call>> OnEventCallbacks { get; }`             | yes      | —       | User-registered event callbacks (catch-all).                                                                                                                                         |
| `Peer`             | `public Dictionary<string, object?> Peer { get; set; }`                  | yes      | —       | —                                                                                                                                                                                    |
| `State`            | `public string State { get; set; }`                                      | yes      | —       | —                                                                                                                                                                                    |
| `Tag`              | `public string? Tag { get; set; }`                                       | yes      | —       | —                                                                                                                                                                                    |
| `TypedListeners`   | `public Dictionary<string, List<Action<Event>>> TypedListeners { get; }` | yes      | —       | Per-event-type listeners registered via <xref href="SignalWire.Relay.Call.On(System.String%2cSystem.Action%7bSignalWire.Relay.Event%7d)" data-throw-if-not-resolved="false"></xref>. |

## Methods

- [`AI(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/ai-dictionary-string-object)
- [`AiHoldAsync()`](/reference/dotnet/signal-wire.relay/call/ai-hold-async)
- [`AiMessageAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/ai-message-async-dictionary-string-object)
- [`AiUnholdAsync()`](/reference/dotnet/signal-wire.relay/call/ai-unhold-async)
- [`AmazonBedrockAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/amazon-bedrock-async-dictionary-string-object)
- [`AnswerAsync()`](/reference/dotnet/signal-wire.relay/call/answer-async)
- [`BindDigitAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/bind-digit-async-dictionary-string-object)
- [`Call(Dictionary<string, object?>, Client)`](/reference/dotnet/signal-wire.relay/call/call-dictionary-string-object-client)
- [`ClearDigitBindingsAsync()`](/reference/dotnet/signal-wire.relay/call/clear-digit-bindings-async)
- [`Collect(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/collect-dictionary-string-object)
- [`ConnectAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/connect-async-dictionary-string-object)
- [`DenoiseAsync()`](/reference/dotnet/signal-wire.relay/call/denoise-async)
- [`DenoiseStopAsync()`](/reference/dotnet/signal-wire.relay/call/denoise-stop-async)
- [`Detect(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/detect-dictionary-string-object)
- [`DisconnectAsync()`](/reference/dotnet/signal-wire.relay/call/disconnect-async)
- [`DispatchEvent(Event)`](/reference/dotnet/signal-wire.relay/call/dispatch-event-event) — Central event router invoked by the Client whenever a server event targets this call.
- [`EchoAsync()`](/reference/dotnet/signal-wire.relay/call/echo-async)
- [`HangupAsync(string)`](/reference/dotnet/signal-wire.relay/call/hangup-async-string)
- [`HoldAsync()`](/reference/dotnet/signal-wire.relay/call/hold-async)
- [`JoinConferenceAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/join-conference-async-dictionary-string-object)
- [`JoinRoomAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/join-room-async-dictionary-string-object)
- [`LeaveConferenceAsync()`](/reference/dotnet/signal-wire.relay/call/leave-conference-async)
- [`LeaveRoomAsync()`](/reference/dotnet/signal-wire.relay/call/leave-room-async)
- [`LiveTranscribeAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/live-transcribe-async-dictionary-string-object)
- [`LiveTranslateAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/live-translate-async-dictionary-string-object)
- [`On`](/reference/dotnet/signal-wire.relay/call/on) — Register a generic event listener on this call.
- [`PassAsync()`](/reference/dotnet/signal-wire.relay/call/pass-async)
- [`Pay(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/pay-dictionary-string-object)
- [`Play(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/play-dictionary-string-object)
- [`PlayAndCollect(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/play-and-collect-dictionary-string-object)
- [`QueueEnterAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/queue-enter-async-dictionary-string-object)
- [`QueueLeaveAsync()`](/reference/dotnet/signal-wire.relay/call/queue-leave-async)
- [`ReceiveFax(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/receive-fax-dictionary-string-object)
- [`Record(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/record-dictionary-string-object)
- [`ReferAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/refer-async-dictionary-string-object)
- [`ResolveAllActions()`](/reference/dotnet/signal-wire.relay/call/resolve-all-actions) — Mark every outstanding action as completed. Called when the call enters a terminal state (ended).
- [`SendDigitsAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/send-digits-async-dictionary-string-object)
- [`SendFax(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/send-fax-dictionary-string-object)
- [`Stream(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/stream-dictionary-string-object)
- [`Tap(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/tap-dictionary-string-object)
- [`Transcribe(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/transcribe-dictionary-string-object)
- [`TransferAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/transfer-async-dictionary-string-object)
- [`UnholdAsync()`](/reference/dotnet/signal-wire.relay/call/unhold-async)
- [`UserEventAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/call/user-event-async-dictionary-string-object)
