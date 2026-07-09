import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Messaging;

@doc("The kind of WhatsApp message to send, for WhatsApp media and interactive messages.")
union WhatsAppMessageType {
  @doc("A WhatsApp text message.")
  "whatsapp_media_text",

  @doc("A WhatsApp contacts card.")
  "whatsapp_media_contacts",

  @doc("A WhatsApp audio message.")
  "whatsapp_media_audio",

  @doc("A WhatsApp document message.")
  "whatsapp_media_document",

  @doc("A WhatsApp image message.")
  "whatsapp_media_image",

  @doc("A WhatsApp sticker message.")
  "whatsapp_media_sticker",

  @doc("A WhatsApp video message.")
  "whatsapp_media_video",

  @doc("A WhatsApp reaction to a message.")
  "whatsapp_media_reaction",

  @doc("A WhatsApp location message.")
  "whatsapp_media_location",

  @doc("A WhatsApp interactive call-to-action message.")
  "whatsapp_interactive_cta",

  @doc("A WhatsApp interactive flow message.")
  "whatsapp_interactive_flow",

  @doc("A WhatsApp interactive list message.")
  "whatsapp_interactive_list",

  @doc("A WhatsApp interactive location-request message.")
  "whatsapp_interactive_location_request_message",

  @doc("A WhatsApp interactive reply-button message.")
  "whatsapp_interactive_reply_button",
}

@summary("Send parameters")
model SendParams {
  @doc("The context that delivery and reply events for this message are sent to. Defaults to `default`.")
  @example("office")
  context?: string;

  @doc("""
    A single tag string stored with the message, useful for searching/filtering
    in the dashboard. Echoed back in the `messaging.state` event.
    """)
  @example("order-98765")
  tag?: string;

  @doc("The recipient's phone number, in E.164 format (for example, `+15551231234`).")
  @example("+15551230002")
  to_number: string;

  @doc("The phone number to send from, in E.164 format. Must be a number on your account.")
  @example("+15551230001")
  from_number: string;

  @doc("""
    The text of the message. Include `body`, `media`, or both — at least one is
    required — unless you are sending a WhatsApp template message (`template_id`),
    in which case `body` must be omitted.
    """)
  @example("Your order has shipped!")
  body?: string;

  @doc("""
    One or more media URLs to send as an MMS. You must include `body`, `media`,
    or both — at least one is required. Each URL must be HTTP or HTTPS. Up to
    8 URLs; defaults to an empty array.
    """)
  @maxItems(8)
  @example(#["https://example.com/receipt.png"])
  media?: string[];

  @doc("HTTPS URL that SignalWire POSTs per-message delivery-status updates to.")
  @example("https://example.com/message-status")
  status_callback?: url;

  @doc("Force the message to be sent as MMS even when it has no media attached.")
  @example(true)
  send_as_mms?: boolean;

  @doc("""
    For a WhatsApp media or interactive message, the kind of WhatsApp message to
    send. Required when sending from a WhatsApp number unless you supply a
    `template_id` instead. Leave unset for SMS/MMS.
    """)
  @example("whatsapp_media_image")
  message_type?: WhatsAppMessageType;

  @doc("""
    The ID of a pre-approved WhatsApp message template. Supplying this sends a
    template message; when set, `body` must be omitted. Required for a WhatsApp
    send when you do not supply a `message_type`. Ignored for SMS/MMS.
    """)
  @example("d94f5e21-8c3a-4b7e-9f10-2a1b0c9d8e7f")
  template_id?: string;

  @doc("""
    Values for the variables in your WhatsApp template's **header**, supplied
    alongside `template_id`. The shape follows the template: an object keyed by
    parameter name for a named template, an array of values for a positional
    template, or a media/document URL string for a media header.
    """)
  header_template_parameters?: Record<unknown> | unknown[] | string;

  @doc("""
    Values for the variables in your WhatsApp template's **body**, supplied
    alongside `template_id`. An object keyed by parameter name for a named
    template, or an array of values for a positional template.
    """)
  body_template_parameters?: Record<unknown> | unknown[] | string;

  @doc("""
    Values for your WhatsApp template's **button** variables, supplied alongside
    `template_id`. The shape follows the template's button definition.
    """)
  button_template_parameters?: Record<unknown> | unknown[] | string;
}
