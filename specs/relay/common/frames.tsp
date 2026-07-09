import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay;

@doc("A JSON-RPC request frame. `Method` is the method name; `Params` is the method's input.")
@summary("JSON-RPC request")
model JsonRpcRequest<Method extends string, Params> {
  @doc("JSON-RPC version. Always `2.0`.")
  jsonrpc: "2.0";

  @doc("Request id, echoed on the correlated response.")
  id: string;

  @doc("The name of the JSON-RPC method being invoked.")
  method: Method;

  @doc("The method's input parameters.")
  params: Params;
}

@doc("""
  A JSON-RPC response frame correlated to a request by `id`. On success the frame carries
  `result` (the method result). If the request fails at the protocol level — an
  incompatible version, failed authentication, insufficient scope, invalid params, or the
  gateway being at capacity — the frame carries `error` instead of `result`. (Ordinary
  backend/application failures are reported the other way: a normal `result` whose own
  `code` is a non-`200` value, not a JSON-RPC `error`.)
  """)
@summary("JSON-RPC response")
model JsonRpcResponse<Result> {
  @doc("JSON-RPC version. Always `2.0`.")
  jsonrpc: "2.0";

  @doc("The id of the request this responds to.")
  id: string;

  @doc("The method result. Present when the request succeeded.")
  result?: Result;

  @doc("Present instead of `result` when the request failed at the protocol level.")
  error?: JsonRpcError;
}

@doc("""
  The error codes carried on a JSON-RPC `error` frame — negative integers, following the
  JSON-RPC 2.0 convention. Meanings:
  - `-32000` — request timed out
  - `-32001` — protocol version incompatible (the `version` you sent on `signalwire.connect` is not supported)
  - `-32002` — authentication failed (bad or expired token)
  - `-32003` — not allowed (the connection lacks the scope/permission for this request)
  - `-32004` — not available
  - `-32005` — capacity exceeded (the gateway is at capacity; retry later)
  - `-32600` — invalid request (malformed JSON-RPC frame)
  - `-32601` — method not found
  - `-32602` — invalid params (a required parameter is missing or malformed)
  - `-32603` — internal error
  - `-32700` — parse error (the payload was not valid JSON)
  """)
@summary("JSON-RPC error code")
union JsonRpcErrorCode {
  -32000,
  -32001,
  -32002,
  -32003,
  -32004,
  -32005,
  -32600,
  -32601,
  -32602,
  -32603,
  -32700,
}

@doc("""
  A JSON-RPC 2.0 error object, delivered on the `error` field of a `JsonRpcResponse` when
  a request fails at the protocol level (bad version, authentication, scope, params, or
  gateway capacity). It replaces `result` — a frame carries one or the other, never both.
  """)
@summary("JSON-RPC error")
model JsonRpcError {
  @doc("The error code — a negative integer identifying the failure. See `JsonRpcErrorCode` for the full list of values and meanings.")
  @example(-32002)
  code: JsonRpcErrorCode;

  @doc("A human-readable description of what went wrong.")
  @example("Authentication failed")
  message: string;
}

@doc("""
  A server-pushed `signalwire.event` frame. `EventType` identifies which event this is
  (e.g. `calling.call.play`); `Data` is the event-specific payload carried at `params.params`.
  """)
@summary("Relay event frame")
model SignalwireEvent<EventType extends string, Data> {
  @doc("JSON-RPC version. Always `2.0`.")
  jsonrpc: "2.0";

  @doc("Event id.")
  id: string;

  @doc("Always `signalwire.event`.")
  method: "signalwire.event";

  @doc("The event envelope.")
  params: {
    @doc("The event type — identifies which event this is.")
    event_type: EventType;

    @doc("The channel the event was delivered on. Always present.")
    @example("calling")
    event_channel: string;

    @doc("When the event was emitted, as a Unix timestamp in seconds. Always present.")
    @example(1712345678.842)
    timestamp: float64;

    @doc("Your project ID. Always present.")
    @example("b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e")
    project_id: string;

    @doc("Your space ID. Always present.")
    @example("c3d4e5f6-a7b8-9c0d-1e2f-3a4b5c6d7e8f")
    space_id: string;

    @doc("The event-specific payload.")
    params: Data;
  };
}

@doc("""
  A server-pushed `signalwire.event` frame for Messaging. Same nesting as a Calling
  event (`Data` at `params.params`), but the envelope includes a required `context`
  field instead of `event_channel`. `EventType` identifies which event this is (e.g.
  `messaging.state`); `Data` is the event-specific payload.
  """)
@summary("Messaging event frame")
model MessagingEvent<EventType extends string, Data> {
  @doc("JSON-RPC version. Always `2.0`.")
  jsonrpc: "2.0";

  @doc("Event id.")
  id: string;

  @doc("Always `signalwire.event`.")
  method: "signalwire.event";

  @doc("The event envelope.")
  params: {
    @doc("The event type — identifies which event this is.")
    event_type: EventType;

    @doc("The context the message belongs to.")
    @example("office")
    context: string;

    @doc("When the event was emitted, as a Unix timestamp in seconds. Always present.")
    @example(1712345678.842)
    timestamp: float64;

    @doc("Your project ID. Always present.")
    @example("b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e")
    project_id: string;

    @doc("Your space ID. Always present.")
    @example("c3d4e5f6-a7b8-9c0d-1e2f-3a4b5c6d7e8f")
    space_id: string;

    @doc("The event-specific payload.")
    params: Data;
  };
}

@doc("""
  A server-pushed `signalwire.event` frame for Tasking. The envelope is flat: `context`,
  `message`, `timestamp`, `space_id`, and `project_id` sit directly under `params`
  (no nested `params.params`, no `event_channel`). `EventType` identifies which event
  this is.
  """)
@summary("Tasking event frame")
model TaskingEvent<EventType extends string> {
  @doc("JSON-RPC version. Always `2.0`.")
  jsonrpc: "2.0";

  @doc("Event id.")
  id: string;

  @doc("Always `signalwire.event`.")
  method: "signalwire.event";

  @doc("The flat event envelope.")
  params: {
    @doc("The event type — identifies which event this is.")
    event_type: EventType;

    @doc("The context this task arrived on.")
    @example("office")
    context: string;

    @doc("The message payload, exactly as the sender passed it to the Tasking REST endpoint. Arbitrary JSON — no fixed structure.")
    message: Record<unknown>;

    @doc("When the event was emitted, as a Unix timestamp in seconds (integer).")
    @example(1712345678)
    timestamp: int64;

    @doc("Your project ID.")
    @example("b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e")
    project_id: string;

    @doc("Your space ID.")
    @example("c3d4e5f6-a7b8-9c0d-1e2f-3a4b5c6d7e8f")
    space_id: string;
  };
}

@doc("""
  A server-pushed `signalwire.event` frame for WebRTC signaling. Carries `event_channel`
  and the `node_id` that sent the event. `Data` is the event-specific payload carried
  directly at `params.params`. `EventType` identifies which event this is.
  """)
@summary("WebRTC event frame")
model WebRTCEvent<EventType extends string, Data> {
  @doc("JSON-RPC version. Always `2.0`.")
  jsonrpc: "2.0";

  @doc("Event id.")
  id: string;

  @doc("Always `signalwire.event`.")
  method: "signalwire.event";

  @doc("The event envelope.")
  params: {
    @doc("The event type — identifies which event this is.")
    event_type: EventType;

    @doc("""
      The node that sent this event. Capture it once your call starts and reuse
      it as the `node_id` on your subsequent `message` requests so they reach the
      same node.
      """)
    @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
    node_id: string;

    @doc("The channel the event was delivered on — the session identifier this WebRTC connection is bound to.")
    @example("f47ac10b-58cc-4372-a567-0e02b2c3d479")
    event_channel: string;

    @doc("When the event was emitted, as a Unix timestamp in seconds.")
    @example(1712345678.842)
    timestamp: float64;

    @doc("Your project ID.")
    @example("b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e")
    project_id: string;

    @doc("""
      The event-specific payload for this WebRTC signaling event — either a signaling
      response or a conference/room event.
      """)
    params: Data;
  };
}

@doc("""
  A server-pushed `signalwire.event` frame for Call Fabric Conversation events
  (`conversation.message`, `conversation.message.updated`, `conversation.joined`,
  `conversation.broadcast`). These are produced by the Conversation service rather than
  the calling engine, so the envelope differs from the standard `SignalwireEvent`: the
  service delivers `timestamp` as a **string**-encoded epoch value (not a numeric
  `float64`), and the three non-broadcast events carry an envelope-level `is_author` flag
  (supplied via `EnvelopeExtra`). `event_channel` is the subscriber's Conversation stream.
  `Data` is the event-specific payload at `params.params`.
  """)
@summary("Conversation event frame")
model ConversationEvent<
  EventType extends string,
  Data,
  EnvelopeExtra extends {} = {}
> {
  @doc("JSON-RPC version. Always `2.0`.")
  jsonrpc: "2.0";

  @doc("Event id.")
  id: string;

  @doc("Always `signalwire.event`.")
  method: "signalwire.event";

  @doc("The event envelope.")
  params: {
    @doc("The event type — identifies which event this is.")
    event_type: EventType;

    @doc("The subscriber's Conversation stream this event was delivered on.")
    event_channel: string;

    @doc("When the event was emitted, as a string-encoded epoch timestamp.")
    @example("1712345678842")
    timestamp: string;

    // Envelope-level extras carried alongside `params` — e.g. `is_author` on the
    // message/message.updated/joined events. Empty (nothing added) on broadcast.
    ...EnvelopeExtra;

    @doc("The event-specific payload.")
    params: Data;
  };
}
