import "../../calls/models/webhooks.tsp";

// An inbound call's status callback is built by the same serializer as the
// voice status callback, so it shares that payload. Only `CallStatus` diverges:
// a phone number's status callback is sent for the `completed` event only, so
// this pathway narrows the enum.
model InboundCallStatusCallbackPayload {
  ...OmitProperties<VoiceStatusCallbackPayload, "CallStatus">;

  @doc("The status of the call. For this callback, the value will be either `failed` or `completed`.")
  @example("completed")
  CallStatus: "failed" | "completed";
}
