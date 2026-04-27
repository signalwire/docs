import "../../../../_shared/webhook/decorator.tsp";
import "../../../types";
import "./core.tsp";

namespace SignalWireAPI.Message;

@summary("Message status callback")
@doc("""
  Payload sent by SignalWire to the `status_callback` URL each time a message transitions to a new state. The same payload shape is used for RELAY SDK message callbacks and SWML `send_sms` status callbacks.

  Configure `status_callback` when [sending a message](/docs/apis/rest/messages/create-message).
  """)
model MessageStatusCallbackPayload {
  @format("uuid")
  @doc("The unique ID of the message segment.")
  @example("a1b2c3d4-e5f6-7890-abcd-ef1234567890")
  id: uuid;

  @format("uuid")
  @doc("The ID of the project the message belongs to.")
  @example("b2c3d4e5-f6a7-8901-bcde-f12345678901")
  project_id: uuid;

  @doc("The current delivery state of the message.")
  @example(MessageStatus.delivered)
  status: MessageStatus;

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
}
