import "../../../Shared/Types/main.tsp";

namespace SWML.Calling;
@summary("user_event Method")
model UserEvent {
  @doc("""
    Allows the user to set and send events to the connected client on the call.
    This is useful for triggering actions on the client side.
    Commonly used with the [browser-sdk](/docs/browser-sdk/v3/js/reference/signalwire/client).
    Each `user_event` method sends one `user_event` event, whose payload is the `event` object.
    On an unanswered inbound call, this method first attempts to answer the call before sending the event.
    """)
  user_event: {
    @doc("""
      The payload of one custom event. The object can contain any JSON values; to send several events, use several `user_event` methods.
      Instead of an object, you can pass a SWML variable reference that resolves to an event object.
      String values in the payload, including those inside nested objects and arrays, are expanded as SWML variables before the event is sent.
      SignalWire adds call details such as `call_id`, `node_id`, and `segment_id` at the top level of the payload, so top-level fields
      aren't guaranteed to arrive unchanged. Put custom data under your own key to avoid name collisions.
      """)
    @example(#{
      type: "call_update",
      status: "connected",
      caller_name: "John Doe",
    })
    event: {
      ...TypeSpec.Record<unknown>;
    } | SWMLVar;
  };
}
