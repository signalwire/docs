namespace SWML.Calling;

@summary("user_event Action")
model UserEventAction {
  @doc("Sends a custom user event for the call, carrying this object as its data.")
  @summary("user_event")
  @example(#{ type: "order_placed", order_id: "ord_456" })
  user_event: {
    ...TypeSpec.Record<unknown>;
  };
}
