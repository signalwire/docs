---
slug: "/reference/dotnet/signal-wire.relay/client"
title: "Client"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Client"
  parent: "SignalWire.Relay"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `Client`

RELAY Client -- manages the WebSocket connection to SignalWire, sends
JSON-RPC 2.0 requests, and dispatches inbound events to the correct
Call or Message objects.

Uses async/await with <xref href="System.Threading.Tasks.TaskCompletionSource" data-throw-if-not-resolved="false"></xref> for the
native C# async pattern instead of polling loops.

## Signature

```dotnet
public class Client
```

## Properties

| Name                 | Type                                                                                                      | Required | Default | Description                                                                                                                                                                                                                            |
| -------------------- | --------------------------------------------------------------------------------------------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Agent`              | `public string Agent { get; set; }`                                                                       | yes      | —       | —                                                                                                                                                                                                                                      |
| `AuthorizationState` | `public string? AuthorizationState { get; set; }`                                                         | yes      | —       | —                                                                                                                                                                                                                                      |
| `Calls`              | `public ConcurrentDictionary<string, Call> Calls { get; }`                                                | yes      | —       | callId => Call.                                                                                                                                                                                                                        |
| `Connected`          | `public bool Connected { get; set; }`                                                                     | yes      | —       | —                                                                                                                                                                                                                                      |
| `Contexts`           | `public List<string> Contexts { get; }`                                                                   | yes      | —       | —                                                                                                                                                                                                                                      |
| `Host`               | `public string Host { get; set; }`                                                                        | yes      | —       | —                                                                                                                                                                                                                                      |
| `InboundQueue`       | `public ConcurrentQueue<string> InboundQueue { get; }`                                                    | yes      | —       | Messages received from the transport layer. Test code can enqueue here.                                                                                                                                                                |
| `Messages`           | `public ConcurrentDictionary<string, Message> Messages { get; }`                                          | yes      | —       | messageId => Message.                                                                                                                                                                                                                  |
| `OnCallHandler`      | `public Func<Call, Event, Task>? OnCallHandler { get; set; }`                                             | yes      | —       | —                                                                                                                                                                                                                                      |
| `OnEventHandler`     | `public Func<Event, Dictionary<string, object?>, Task>? OnEventHandler { get; set; }`                     | yes      | —       | —                                                                                                                                                                                                                                      |
| `OnMessageHandler`   | `public Func<Message, Event, Task>? OnMessageHandler { get; set; }`                                       | yes      | —       | Inbound message handler. Mirrors Python's <code>@client.on\_message</code>: fires with a fully-formed <xref href="SignalWire.Relay.Message" data-throw-if-not-resolved="false"></xref> for every <code>messaging.receive</code> event. |
| `Pending`            | `public ConcurrentDictionary<string, TaskCompletionSource<Dictionary<string, object?>>> Pending { get; }` | yes      | —       | JSON-RPC id => pending request TCS.                                                                                                                                                                                                    |
| `PendingDials`       | `public ConcurrentDictionary<string, TaskCompletionSource<Call>> PendingDials { get; }`                   | yes      | —       | tag => pending dial TCS.                                                                                                                                                                                                               |
| `Project`            | `public string Project { get; }`                                                                          | yes      | —       | —                                                                                                                                                                                                                                      |
| `Protocol`           | `public string? Protocol { get; set; }`                                                                   | yes      | —       | —                                                                                                                                                                                                                                      |
| `Scheme`             | `public string Scheme { get; set; }`                                                                      | yes      | —       | —                                                                                                                                                                                                                                      |
| `SessionId`          | `public string? SessionId { get; set; }`                                                                  | yes      | —       | —                                                                                                                                                                                                                                      |
| `Token`              | `public string Token { get; }`                                                                            | yes      | —       | —                                                                                                                                                                                                                                      |

## Methods

- [`AuthenticateAsync()`](/reference/dotnet/signal-wire.relay/client/authenticate-async) — Send the signalwire.connect RPC to authenticate.
- [`BuildWebSocketUri()`](/reference/dotnet/signal-wire.relay/client/build-web-socket-uri) — Build the full WebSocket URL: <xref href="SignalWire.Relay.Client.Scheme" data-throw-if-not-resolved="false"></xref>://<xref href="SignalWire.Relay.Client.Host" data-throw-if-not-resolved="false"></xref>/api/relay/ws.
- [`Client(Dictionary<string, string>?)`](/reference/dotnet/signal-wire.relay/client/client-dictionary-string-string)
- [`ConnectAsync()`](/reference/dotnet/signal-wire.relay/client/connect-async) — Establish the WebSocket connection and authenticate. Opens a real WSS connection to the configured host, runs the JSON-RPC <code>signalwire.connect</code> handshake, and starts the reader loop that pumps inbound frames into <xref href="SignalWire.Relay.Client.HandleMessage(System.String)" data-throw-if-not-resolved="false"></xref>.
- [`DialAsync(Dictionary<string, object?>)`](/reference/dotnet/signal-wire.relay/client/dial-async-dictionary-string-object) — Originate an outbound call, awaiting until the dial resolves. Honours <code>params\_\["tag"]</code> when provided; otherwise a UUID is generated. Honours <code>params\_\["dial\_timeout"]</code> (seconds) for the resolve-or-throw deadline.
- [`Disconnect()`](/reference/dotnet/signal-wire.relay/client/disconnect) — Gracefully close the connection.
- [`ExecuteAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/client/execute-async-string-dictionary-string-object) — Send a JSON-RPC request and await the matching response. Returns the "result" portion of the response.
- [`GetCall(string)`](/reference/dotnet/signal-wire.relay/client/get-call-string)
- [`HandleEvent(Dictionary<string, object?>)`](/reference/dotnet/signal-wire.relay/client/handle-event-dictionary-string-object) — Route a signalwire.event payload to the appropriate handler.
- [`HandleMessage(string)`](/reference/dotnet/signal-wire.relay/client/handle-message-string) — Parse a raw JSON string from the server and route it.
- [`OnCall(Func<Call, Event, Task>)`](/reference/dotnet/signal-wire.relay/client/on-call-func-call-event-task) — Register a handler for inbound calls.
- [`OnMessage(Func<Message, Event, Task>)`](/reference/dotnet/signal-wire.relay/client/on-message-func-message-event-task) — Register a handler for inbound messages.
- [`ReadLoopAsync(CancellationToken)`](/reference/dotnet/signal-wire.relay/client/read-loop-async-cancellation-token) — Reader loop that pulls UTF-8 text frames off the socket and routes each completed message into <xref href="SignalWire.Relay.Client.HandleMessage(System.String)" data-throw-if-not-resolved="false"></xref>. Handles fragmented frames by accumulating them until <xref href="System.Net.WebSockets.ValueWebSocketReceiveResult.EndOfMessage" data-throw-if-not-resolved="false"></xref>.
- [`ReadOnce()`](/reference/dotnet/signal-wire.relay/client/read-once) — Read one queued message synchronously (test helper for harness use).
- [`ReceiveAsync(IEnumerable<string>)`](/reference/dotnet/signal-wire.relay/client/receive-async-i-enumerable-string) — Subscribe to one or more inbound contexts.
- [`ReconnectAsync()`](/reference/dotnet/signal-wire.relay/client/reconnect-async) — Reconnect with exponential back-off (1s to 30s cap).
- [`RunAsync()`](/reference/dotnet/signal-wire.relay/client/run-async) — Main event loop -- drains the inbound queue and processes messages until disconnect. Used by the test path that pushes JSON strings into <xref href="SignalWire.Relay.Client.InboundQueue" data-throw-if-not-resolved="false"></xref>; production reads come from the WebSocket reader started in <xref href="SignalWire.Relay.Client.ConnectAsync" data-throw-if-not-resolved="false"></xref>.
- [`Send(Dictionary<string, object?>)`](/reference/dotnet/signal-wire.relay/client/send-dictionary-string-object) — Encode and send a JSON message. Real production path writes to the WebSocket; tests override this to capture payloads in memory.
- [`SendAck(string)`](/reference/dotnet/signal-wire.relay/client/send-ack-string) — Send an acknowledgement (empty result) for a server-initiated request.
- [`SendMessageAsync(Dictionary<string, object?>)`](/reference/dotnet/signal-wire.relay/client/send-message-async-dictionary-string-object) — Send an outbound message.
- [`UnreceiveAsync(IEnumerable<string>)`](/reference/dotnet/signal-wire.relay/client/unreceive-async-i-enumerable-string) — Unsubscribe from one or more contexts.
