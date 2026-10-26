namespace SWML.Calling;

@summary("user_event Action")
model UserEventAction {
  @doc("Sends a custom event to the client connected to the call, with this object as its payload, like the [`user_event`](/docs/swml/reference/calling/user-event) method.")
  @summary("user_event")
  @example(#{ type: "order_placed", order_id: "ord_456" })
  user_event: {
    ...TypeSpec.Record<unknown>;
  };
}
