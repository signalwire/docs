import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

// The Relay wire is JSON-RPC 2.0 over one WebSocket. The framing is modeled here, in the spec,
// as base model templates that each operation/event specializes — the emitter is a generic
// AsyncAPI emitter and synthesizes none of this. Declared on the `Relay` namespace so every
// sub-service (`Relay.Calling`, `Relay.Messaging`, …) resolves them unqualified.
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
    event_channel?: string;

    @doc("When the event was emitted, as a Unix timestamp in seconds.")
    timestamp?: float64;

    @doc("Your project ID.")
    project_id?: string;

    @doc("Your space ID.")
    space_id?: string;

    @doc("The event-specific payload.")
    params: Data;
  };
}
