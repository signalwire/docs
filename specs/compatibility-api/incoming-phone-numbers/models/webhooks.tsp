import "../../../_shared/webhook/decorator.tsp";

@summary("Inbound call status callback")
@doc("""
  Payload sent by SignalWire to your Inbound Call Status Callback URL for inbound calls to a phone number.
  This webhook is enabled at the phone number level in the dashboard: Phone Numbers → select number → Phone Number Settings.
  By default the webhook is called when the call is completed or failed. Suited for tracking inbound calls,
  success rate, call quality, and total calls.
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

  @doc("The status of the call. Typically failed or completed.")
  CallStatus: string;

  @doc("The duration, in seconds, of the call.")
  CallDuration: string;

  @doc("The score that represents the quality of the call (1-5).")
  AudioInMos: string;
}
