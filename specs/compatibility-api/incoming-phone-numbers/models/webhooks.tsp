import "../../../_shared/webhook/decorator.tsp";

@summary("Inbound call status callback")
@doc("""
  Payload sent by SignalWire to your Inbound Call Status Callback URL for inbound calls to a phone number.

  This webhook is enabled at the phone number level in the dashboard:
  **Phone Numbers** → select a number → **Phone Number Settings**.

  By default, the webhook fires only when the call is `completed` or `failed`, making it well-suited
  for tracking inbound call success rate, call quality, and total call volume in a call center context.
  """)
model InboundCallStatusCallbackPayload {
  @doc("A unique identifier for the call. May be used to later retrieve this call from the REST API.")
  CallSid: string;

  @doc("The unique ID of the project this call is associated with.")
  AccountSid: string;

  @doc("The From number in E.164 format.")
  From: string;

  @doc("The To number in E.164 format.")
  To: string;

  @doc("The timestamp of the call creation date/time.")
  Timestamp: string;

  @doc("The status of the call. For this callback, the value will be either `failed` or `completed`.")
  CallStatus: "failed" | "completed";

  @doc("The duration, in seconds, of the call.")
  CallDuration: string;

  @doc("A mean opinion score on a scale of 1–5 that represents the quality of the call.")
  AudioInMos: string;
}
