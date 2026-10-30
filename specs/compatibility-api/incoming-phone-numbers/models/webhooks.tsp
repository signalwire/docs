import "../../calls/models/webhooks.tsp";

// An inbound call's status callback is built by the same serializer as the
// voice status callback, so it shares that payload. Only `CallStatus` diverges:
// a phone number's status callback is subscribed to the `completed` event only,
// which also matches `busy`, `no-answer` and `failed`. The raw status is sent,
// so this pathway narrows the enum to those four.
model InboundCallStatusCallbackPayload {
  ...OmitProperties<VoiceStatusCallbackPayload, "CallStatus">;

  @doc("""
    The final status of the call.
    - `completed`: the call ended normally.
    - `busy`: the call ended with a busy signal before it was answered, such as when your cXML rejects it with `<Reject reason="busy">`.
    - `no-answer`: the call ended without being answered, such as when the caller hung up first.
    - `failed`: the call could not be completed.
    """)
  @example("completed")
  CallStatus: "completed" | "busy" | "no-answer" | "failed";
}
