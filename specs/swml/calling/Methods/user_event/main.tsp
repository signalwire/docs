@summary("user_event Method")
model UserEvent {
  @doc("""
    Allows the user to set and send events to the connected client on the call.
    This is useful for triggering actions on the client side.
    Commonly used with the [browser-sdk](/docs/browser-sdk/v3/js/reference/signalwire/client).
    The event object can be any valid JSON object.
    Any key-value pair in the object is sent to the client as an event type called `user_event`.
    """)
  user_event: {
    @example(#{
      type: "call_update",
      status: "connected",
      caller_name: "John Doe",
    })
    event: {
      ...TypeSpec.Record<unknown>;
    };
  };
}
