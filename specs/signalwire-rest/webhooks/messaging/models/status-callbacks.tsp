import "../../../types";
import "../../../message-api/messages/models/core.tsp";

namespace SignalWireAPI.Webhooks.Messaging;

model MessageStatusCallbackPayload {
  @doc("The unique ID of the message segment.")
  @example("a1b2c3d4-e5f6-7890-abcd-ef1234567890")
  id: uuid;

  @doc("The ID of the project the message belongs to.")
  @example("b2c3d4e5-f6a7-8901-bcde-f12345678901")
  project_id: uuid;

  @doc("The current delivery state of the message.")
  @example(SignalWireAPI.Message.MessageStatus.delivered)
  status: SignalWireAPI.Message.MessageStatus;

  @doc("The destination phone number.")
  @example("+15551234567")
  to: string;

  @doc("The source phone number.")
  @example("+15559876543")
  from: string;

  @doc("The message body text.")
  @example("Hello World!")
  body: string;

  @doc("Number of segments the message body was split into for delivery.")
  @example(1)
  number_of_segments: int32;

  @doc("Timestamp of the status transition.")
  @example(utcDateTime.fromISO("2026-03-17T22:26:57Z"))
  timestamp: utcDateTime;

  @doc("Provider-specific error code if delivery failed. Null when no error occurred.")
  @example(null)
  error_code: string | null;

  @doc("Human-readable error message if delivery failed. Null when no error occurred.")
  @example(null)
  error_message: string | null;

  @doc("The same `custom_variables` key/value pairs you supplied when [sending the message](/docs/apis/rest/messages/create-message), echoed back so you can match this callback to a record in your own system. Included only when the message was sent with custom variables.")
  @example(#{ id: "12345", case_number: "54321" })
  custom_variables?: TypeSpec.Record<string>;
}

model TenDlcStatusCallbackPayload {
  @doc("The unique ID of the project this object is associated with.")
  project_id: string;

  @doc("The timestamp of when the event occurred, in ISO 8601 format.")
  event_at: string;

  @doc("The category of the event.")
  event_category:
    | "brand"
    | "campaign"
    | "number_assignment_order"
    | "number_assignment";

  @doc("""
    The specific type of event that occurred.
    One of: `brand_activated`, `brand_unverified`, `campaign_activated`, `campaign_deactivated`,
    `number_assignment_order_processed`, `number_assignment_failed`, `number_assignment_pending`,
    `number_assignment_activated`.
    """)
  event_type:
    | "brand_activated"
    | "brand_unverified"
    | "campaign_activated"
    | "campaign_deactivated"
    | "number_assignment_order_processed"
    | "number_assignment_failed"
    | "number_assignment_pending"
    | "number_assignment_activated";

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
