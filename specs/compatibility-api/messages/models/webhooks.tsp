import "../../../_shared/webhook/decorator.tsp";

@summary("SMS status callback")
@doc("""
  Payload sent by SignalWire to your SMS Status Callback URL when the status of an SMS/MMS message changes.
  Configure this callback using the StatusCallback parameter when sending an outgoing message.
  """)
model SmsStatusCallbackPayload {
  @doc("The current status of the message at the time of the callback.")
  MessageStatus: string;

  @doc("If the message has failed or is undelivered, the error code may provide more information about what went wrong.")
  ErrorCode?: string;

  @doc("The unique ID of this message.")
  MessageSid: string;

  @doc("The unique ID of the project this message is associated with.")
  AccountSid: string;

  @doc("The From number of the message.")
  From: string;

  @doc("The To number of the message.")
  To: string;

  @doc("The body of the message.")
  Body: string;

  @doc("The number of media files that were included with the message.")
  NumMedia: int32;

  @doc("The number of segments that make up the entire message.")
  NumSegments: int32;
}

@summary("10DLC status callback")
@doc("""
  Payload sent by SignalWire to your 10DLC Status Callback URL when the state of a 10DLC registration object changes.
  Use this webhook to monitor the lifecycle of messaging brands, campaigns, number assignment orders,
  and number assignments in real time.
  """)
model TenDlcStatusCallbackPayload {
  @doc("The unique ID of the project this object is associated with.")
  project_id: string;

  @doc("The timestamp of when the event occurred, in ISO 8601 format.")
  event_at: string;

  @doc("""
    The category of the event.
    One of: brand, campaign, number_assignment_order, number_assignment.
  """)
  event_category: string;

  @doc("""
    The specific type of event that occurred.
    See the 10DLC status callback event types documentation for all possible values.
  """)
  event_type: string;

  @doc("The current state of the object after the event. Possible values depend on the object type.")
  state: string;

  @doc("The unique identifier for the brand. Present in all event types.")
  brand_id: string;

  @doc("The unique identifier for the campaign. Present in campaign, number assignment order, and number assignment events.")
  campaign_id?: string;

  @doc("The unique identifier for the number assignment order. Present in number assignment order and number assignment events.")
  number_assignment_order_id?: string;

  @doc("The unique identifier for the number assignment. Present only in number assignment events.")
  number_assignment_id?: string;

  @doc("The unique identifier for the phone route itself. Present only in number assignment events.")
  phone_number_id?: string;

  @doc("The phone number in E.164 format. Present only in number assignment events.")
  phone_number?: string;
}
