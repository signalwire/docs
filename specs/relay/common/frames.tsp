import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay;

@doc("A JSON-RPC request frame. `Method` is the wire method constant; `Params` the method input.")
model JsonRpcRequest<Method extends string, Params> {
  @doc("JSON-RPC version. Always `2.0`.")
  jsonrpc: "2.0";

  @doc("Request id, echoed on the correlated response.")
  id: string;

  @doc("The JSON-RPC method.")
  method: Method;

  @doc("Method parameters.")
  params: Params;
}

@doc("A JSON-RPC response frame correlated to a request by `id`. `Result` is the method result.")
model JsonRpcResponse<Result> {
  @doc("JSON-RPC version. Always `2.0`.")
  jsonrpc: "2.0";

  @doc("The id of the request this responds to.")
  id: string;

  @doc("The method result.")
  result: Result;
}

@doc("""
  A server-pushed `signalwire.event` frame. `EventType` is the wire event discriminator
  (e.g. `calling.call.play`); `Data` is the event-specific payload carried at `params.params`.
  """)
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

    @doc("The channel the event was delivered on.")
    @example("calling")
    event_channel?: string;

    @doc("When the event was emitted, as a Unix timestamp in seconds.")
    @example(1712345678.842)
    timestamp?: float64;

    @doc("Your project ID.")
    @example("b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e")
    project_id?: string;

    @doc("Your space ID.")
    @example("c3d4e5f6-a7b8-9c0d-1e2f-3a4b5c6d7e8f")
    space_id?: string;

    @doc("The event-specific payload.")
    params: Data;
  };
}

@doc("""
  A server-pushed `signalwire.event` frame for Messaging. Same nesting as the Calling
  carrier (`Data` at `params.params`), but the envelope is keyed by `context` (required)
  instead of `event_channel`. `EventType` is the wire event discriminator (e.g.
  `messaging.state`); `Data` is the event-specific payload.
  """)
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

    @doc("When the event was emitted, as a Unix timestamp in seconds.")
    @example(1712345678.842)
    timestamp?: float64;

    @doc("Your project ID.")
    @example("b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e")
    project_id?: string;

    @doc("Your space ID.")
    @example("c3d4e5f6-a7b8-9c0d-1e2f-3a4b5c6d7e8f")
    space_id?: string;

    @doc("The event-specific payload.")
    params: Data;
  };
}

@doc("""
  A server-pushed `signalwire.event` frame for Tasking. The envelope is FLAT —
  `context`, `message`, `timestamp`, `space_id`, and `project_id` are direct siblings
  of `event_type` under `params`, with no nested `params.params` and no `event_channel`.
  `EventType` is the wire event discriminator.
  """)
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
  A server-pushed `signalwire.event` frame for WebRTC/Verto. Carries `event_channel`,
  and the `node_id` that sent the event sits at the envelope level (sibling of
  `event_type`). `Data` is the Verto frame carried directly at `params.params`.
  `EventType` is the wire event discriminator.
  """)
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
    node_id?: string;

    @doc("The channel the event was delivered on.")
    @example("webrtc")
    event_channel?: string;

    @doc("When the event was emitted, as a Unix timestamp in seconds.")
    @example(1712345678.842)
    timestamp?: float64;

    @doc("Your project ID.")
    @example("b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e")
    project_id?: string;

    @doc("Your space ID.")
    @example("c3d4e5f6-a7b8-9c0d-1e2f-3a4b5c6d7e8f")
    space_id?: string;

    @doc("""
      The event-specific payload — the Verto frame being delivered, either a Verto
      response or a conference/room event. Passed through as-is; see `verto_messages.md`.
      """)
    params: Data;
  };
}
