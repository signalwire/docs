---
slug: "/reference/java/com/signalwire/sdk/relay/relay/relay-client"
title: "RelayClient"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.RelayClient"
  parent: "com.signalwire.sdk.relay"
  module: "com.signalwire.sdk.relay"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayClient.java"
  visibility: "public"
---
# `RelayClient`

RELAY WebSocket connection manager.

<p>
 Manages WebSocket connections to the SignalWire RELAY service using JSON-RPC 2.0.
 Implements the four correlation mechanisms:
 <ol>
   <li>JSON-RPC id -> CompletableFuture for RPC response matching</li>
   <li>call_id -> Call for event routing</li>
   <li>control_id -> Action per Call for action event routing</li>
   <li>tag -> CompletableFuture&lt;Call&gt; for dial correlation</li>
 </ol>
 <p>
 Also handles:
 <ul>
   <li>Event ACK for every `signalwire.event`</li>
   <li>Ping/pong for `signalwire.ping`</li>
   <li>Exponential backoff reconnection</li>
   <li>Authorization state for fast reconnection</li>
   <li>Server-initiated disconnect with restart flag</li>
   <li>Dynamic context subscription via receive/unreceive</li>
   <li>Message tracking by message_id</li>
 </ul>

 <pre>client = RelayClient.builder()
     .project("project-id")
     .token("api-token")
     .space("example.signalwire.com")
     .contexts(List.of("default"))
     .build();

 client.onCall(call -> {
     call.answer();
     var action = call.play(List.of(Map.of("type", "tts",
         "params", Map.of("text", "Hello!"))));
     action.waitForCompletion();
     call.hangup(););

 client.run();
 }</pre>

## Signature

```java
public class RelayClient
```

## Methods

- [`builder`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/builder)
- [`connect`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/connect) — Open the WebSocket connection and complete the signalwire.connect handshake without blocking the caller.
- [`dial`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/dial) — Dial an outbound call.
- [`disconnect`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/disconnect) — Disconnect the client.
- [`execute`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/execute) — Execute an RPC method and wait for the response.
- [`getAuthorizationState`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/get-authorization-state) — Returns the authorization state blob the server pushed via the `signalwire.authorization.state` event, or null.
- [`getContexts`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/get-contexts)
- [`getProject`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/get-project)
- [`getRelayProtocol`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/get-relay-protocol) — Returns the protocol identifier issued by the server during the signalwire.connect handshake.
- [`getSpace`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/get-space)
- [`isConnected`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/is-connected)
- [`onCall`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/on-call) — Register a handler for inbound calls.
- [`onEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/on-event) — Register a handler for all raw events.
- [`onMessage`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/on-message) — Register a handler for inbound messages.
- [`receive`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/receive) — Subscribe to additional contexts dynamically.
- [`run`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/run) — Connect and run the client.
- [`sendMessage`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/send-message) — Send an outbound SMS/MMS.
- [`sendRaw`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/send-raw) — Send a raw JSON-RPC frame on the underlying socket.
- [`setRelayProtocol`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/set-relay-protocol) — Test-only setter for the protocol \u2014 used by reconnect-with-protocol tests that simulate "I already have a session token from last time".
- [`unreceive`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/unreceive) — Unsubscribe from contexts.

## Classes

- [`Builder`](/reference/java/com/signalwire/sdk/relay/relay/relay-client/builder)

## Source

[`src/main/java/com/signalwire/sdk/relay/RelayClient.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayClient.java)

Line 62.
