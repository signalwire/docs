---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client"
title: "Client"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Client"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go"
---
# `Client`

Client is the main RELAY WebSocket client that manages a persistent connection to SignalWire, handles Blade/JSON-RPC 2.0 authentication, event dispatch, and exposes high-level Dial/SendMessage methods.

## Signature

```go
type Client struct
```

## Methods

- [`Authenticate`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/authenticate) — Authenticate runs the signalwire.connect handshake and stores the server-issued protocol string. Mirrors Python's RelayClient.connect() auth phase. Use Connect first to establish the WebSocket; this call reads the auth response synchronously (the read loop has not yet started so no other reader is contending for the socket).
- [`AuthorizationState`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/authorization-state) — AuthorizationState returns the most recent encrypted authorization state blob received via signalwire.authorization.state events. Mirrors Python's RelayClient.\_authorization\_state used during reconnection (relay/client.py:174). Empty until the server pushes such an event.
- [`Connect`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/connect) — Connect establishes the WebSocket connection to SignalWire. This is the public equivalent of the internal connect() method, mirroring Python's async connect() which is also used in the async-with context manager. In most cases callers should use Run() which calls Connect internally and then drives the read loop.
- [`Contexts`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/contexts) — Contexts returns a copy of the configured RELAY contexts. Mirrors Python's public client.contexts attribute. The returned slice is a copy — mutating it does not affect the client.
- [`Dial`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/dial) — Dial initiates an outbound call to the given device list. The devices parameter is a list of serial/parallel device groups (same structure as the Blade calling.dial devices field).
- [`Execute`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/execute) — Execute sends a JSON-RPC request over the WebSocket and waits for the response. Mirrors Python's async execute(method, params) which is the public arbitrary-RPC surface used by callers that need low-level access.
- [`JWTToken`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/jwt-token) — JWTToken returns the configured JWT. Mirrors Python's public client.jwt\_token attribute, allowing callers to read back the value supplied via WithJWT(...).
- [`Notify`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/notify) — Notify sends a JSON-RPC notification (no `id`, no response expected) with the given method and params. Used for fire-and-forget frames such as the client-side `signalwire.event` ACK pattern that some integration fixtures expect. Returns any write error from the underlying socket.
- [`OnCall`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/on-call) — OnCall registers a handler invoked for each inbound call.
- [`OnEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/on-event) — OnEvent registers a handler invoked for every inbound `signalwire.event` frame, AFTER type-specific routing (call, messaging) has run. The handler receives the raw event\_type string and params map. This is the lowest-level event hook — most callers should use OnCall or OnMessage instead. Mirrors Python RelayClient's public event-tap surface used by integration tests.
- [`OnMessage`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/on-message) — OnMessage registers a handler invoked for each inbound message.
- [`ProjectID`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/project-id) — ProjectID returns the configured project ID. Mirrors Python's public client.project attribute, allowing callers to read back the value supplied via WithProject(...) or the SIGNALWIRE\_PROJECT\_ID env var.
- [`Receive`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/receive) — Receive subscribes to additional contexts for inbound events after the client is already connected. Sends signalwire.receive on the assigned protocol. Mirrors Python's async receive(contexts).
- [`RelayProtocol`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/relay-protocol) — RelayProtocol returns the server-assigned protocol string received during authentication. Mirrors Python's relay\_protocol property. The value is empty until after a successful Connect/Run.
- [`Run`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/run) — Run connects to SignalWire, authenticates, subscribes to configured contexts, and starts the read loop. It blocks until Stop is called or the context is cancelled.
- [`SendMessage`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/send-message) — SendMessage sends an SMS/MMS message and returns a Message that can be used to track delivery.
- [`Space`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/space) — Space returns the configured SignalWire space hostname. Mirrors Python's public client.host attribute (Python uses the term "host"; Go uses "space" because that's the more accurate noun — see WithSpace).
- [`StartReadLoop`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/start-read-loop) — StartReadLoop spawns the read goroutine and marks the client running. Mirrors the goroutine-spawn portion of Run() — call it after Authenticate() and before any Execute() call so JSON-RPC responses have a reader. Pair with Stop() to terminate.
- [`Stop`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/stop) — Stop gracefully shuts down the client connection.
- [`SubscribeContexts`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/subscribe-contexts) — SubscribeContexts subscribes to whatever contexts were configured via WithContexts. No-op when the contexts slice is empty. Used by the mock-relay test helper which drives connect/auth/read-loop manually.
- [`Token`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/token) — Token returns the configured API token. Mirrors Python's public client.token attribute, allowing callers to read back the value supplied via WithToken(...) or the SIGNALWIRE\_API\_TOKEN env var.
- [`Unreceive`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/unreceive) — Unreceive unsubscribes from contexts for inbound events. Sends signalwire.unreceive on the assigned protocol. Mirrors Python's async unreceive(contexts).

## Source

[`pkg/relay/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go)

Line 22.
