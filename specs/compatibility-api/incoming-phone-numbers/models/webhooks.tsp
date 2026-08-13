
model InboundCallStatusCallbackPayload {
  @doc("A unique identifier for the call. May be used to later retrieve this call from the REST API.")
  @example("b3877c40-da60-4998-90ad-b792e98472ca")
  CallSid: string;

  @doc("The unique ID of the project this call is associated with.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  AccountSid: string;

  @doc("The From number in E.164 format.")
  @example("+15551234567")
  From: string;

  @doc("The To number in E.164 format.")
  @example("+18005559876")
  To: string;

  @doc("The timestamp of the call creation date/time.")
  @example("Thu, 04 Apr 2024 18:32:15 +0000")
  Timestamp: string;

  @doc("The status of the call. For this callback, the value will be either `failed` or `completed`.")
  @example("completed")
  CallStatus: "failed" | "completed";

  @doc("The duration, in seconds, of the call.")
  @example("142")
  CallDuration: string;

  @doc("A mean opinion score on a scale of 1–5 that represents the quality of the call.")
  @example("4.5")
  AudioInMos: string;
}
