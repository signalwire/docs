import "../../../types";

namespace SignalWireAPI.Webhooks.Messaging;

@summary("Inbound message media item")
@doc("A single media attachment included on an inbound message.")
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

  @doc("The channel the message arrived on.")
  @example("sms")
  type: "sms" | "mms" | "whatsapp" | "rcs";

  @doc("""
    Sender of the message. For SMS, MMS, and RCS, a phone number in E.164 format. For WhatsApp,
    the sender's phone number as WhatsApp reports it: country code and number, with no leading
    `+`.
    """)
  @example("+15551231234")
  from: string;

  @doc("""
    Recipient of the message. For SMS and MMS, your phone number in E.164 format. For WhatsApp,
    your WhatsApp number, prefixed with `whatsapp:`. For RCS, the ID of your RCS agent.
    """)
  @example("+15553214321")
  to: string;

  @doc("""
    The text content of the message. Null on media-only MMS where the carrier did not include a
    text body. For a WhatsApp reply button or list selection, the ID of the button or list row
    the customer chose. Null for WhatsApp media, location, and contact messages.
    """)
  @example("Hello, I need help")
  body: string | null;

  @doc("""
    Media attachments. Empty when the message has no attachments. Always empty for WhatsApp:
    WhatsApp media details are in `whatsapp_context`.
    """)
  @example(#[])
  media: InboundMessageMediaItem[];

  @doc("Number of segments the message body was split into. Always `1` for WhatsApp.")
  @example(1)
  segments: int32;

  @doc("Timestamp in UTC (ISO 8601, seconds precision) of when the message was received.")
  @example(utcDateTime.fromISO("2024-01-15T10:30:00Z"))
  timestamp: utcDateTime;

  // The fields below appear only for WhatsApp or RCS messages. They carry no @example so the
  // generated payload example stays a coherent SMS message.
  @doc("""
    WhatsApp and RCS messages only. For WhatsApp, the kind of message the customer sent:
    `whatsapp_image`, `whatsapp_video`, `whatsapp_audio`, `whatsapp_document`,
    `whatsapp_sticker`, `whatsapp_location`, `whatsapp_contacts`,
    `whatsapp_interactive_button` (a reply button tap), or `whatsapp_interactive_list` (a list
    selection). Null for a text message. Always null for RCS.
    """)
  message_type?: string | null;

  @doc("""
    WhatsApp messages only. For a reply button tap or list selection, the title of the button
    or list row the customer chose. Null otherwise.
    """)
  tag?: string | null;

  @doc("""
    WhatsApp messages only. Context for the message:
    
    - Text message: the string `default`.
    - Reply button tap or list selection: the ID of the WhatsApp message that carried the
      button or list, as a string, or null when WhatsApp doesn't provide it.
    - Image, video, audio, document, or sticker: an object with `type`, `media_id`,
      `mime_type`, `sha256`, and `url`. A document also has `filename`, and a sticker has
      `animated`.
    - Location: an object with `type`, `latitude`, `longitude`, `name`, and `address`, plus
      `context_id` and `context_from` when the location replies to an earlier message.
    - Contacts: an object with `type` and a `contacts` array, each entry holding
      `name_information` and `phones_information`.
    
    Object fields WhatsApp doesn't provide are omitted.
    """)
  whatsapp_context?: string | Record<unknown> | null;

  @doc("RCS messages only. The ID of the RCS agent that received the message. Same as `to`.")
  agent_id?: uuid;
}

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
