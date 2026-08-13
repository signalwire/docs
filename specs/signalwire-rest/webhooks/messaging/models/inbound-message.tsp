import "../../../types";

namespace SignalWireAPI.Webhooks.Messaging;

@summary("Inbound message media item")
@doc("A single MMS media attachment included on an inbound message.")
model InboundMessageMediaItem {
  @doc("URL to download the media file.")
  @example("https://example.com/media/abc123.jpg")
  url: url;

  @doc("MIME type of the media file.")
  @example("image/jpeg")
  content_type: string;

  @doc("File size in bytes.")
  @example(48213)
  size: int32;
}

@summary("Inbound message")
@doc("Information about the inbound message that triggered the SWML document fetch.")
model InboundMessageContext {
  @doc("Unique identifier for the inbound message.")
  @example("c2d3e4f5-a6b7-8901-cdef-234567890abc")
  message_id: uuid;

  @doc("The Project ID this message belongs to.")
  @example("b2c3d4e5-f6a7-8901-bcde-f12345678901")
  project_id: uuid;

  @doc("The Space ID this message belongs to.")
  @example("d3e4f5a6-b7c8-9012-defa-345678901bcd")
  space_id: uuid;

  @doc("Direction of the message. Always `inbound` for messages handled by an SWML messaging script.")
  @example("inbound")
  direction: "inbound";

  @doc("The kind of message.")
  @example("sms")
  type: "sms" | "mms";

  @doc("Phone number that sent the message.")
  @example("+15551231234")
  from: string;

  @doc("Phone number that received the message.")
  @example("+15553214321")
  to: string;

  @doc("The text content of the message. Null on media-only MMS where the carrier did not include a text body.")
  @example("Hello, I need help")
  body: string | null;

  @doc("MMS media attachments. Empty when the message has no attachments.")
  @example(#[])
  media: InboundMessageMediaItem[];

  @doc("Number of SMS segments the message body was split into.")
  @example(1)
  segments: int32;

  @doc("Timestamp in UTC (ISO 8601, seconds precision) of when the message was received.")
  @example(utcDateTime.fromISO("2024-01-15T10:30:00Z"))
  timestamp: utcDateTime;
}

@summary("SWML inbound message webhook")
@doc("""
  Payload sent by SignalWire to a SWML messaging webhook URL when an inbound SMS or MMS message arrives on a phone number configured with a SWML message handler. The same payload shape is also used when the SWML messaging `transfer` method targets an external URL — in that case, `params` carries the values supplied to the `transfer` step and `vars` carries the propagated runtime variables from the originating document.
  
  The webhook URL is expected to respond with the SWML document to execute for the inbound message.
  """)
model InboundMessageWebhookPayload {
  @doc("The inbound message that triggered this fetch.")
  message: InboundMessageContext;

  @doc("Script-scope variables propagated from the SWML document that issued a `transfer` step. Absent on the initial inbound-message fetch; present (possibly empty) on fetches driven by a `transfer` step inside a full-mode SWML document. Common keys include `request_result`, `request_response`, `request_response_code`, `request_response_body`, `reply_result`, and `reply_message_id`.")
  @example(#{ request_result: "success", reply_result: "queued" })
  vars?: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("Parameters passed via a SWML messaging `transfer` step. An empty object on the initial document fetch.")
  @example(#{})
  params: {
    ...TypeSpec.Record<unknown>;
  };
}
