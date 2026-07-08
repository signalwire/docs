import "@typespec/http";
import "@typespec/json-schema";
import "./core.tsp";
import "./requests.tsp";

using TypeSpec.Http;
using TypeSpec.JsonSchema;

namespace SignalWireAPI.Message;

// ---------------------------------------------------------------------------
// Shared base for all WhatsApp send requests
// ---------------------------------------------------------------------------

@doc("Fields common to every WhatsApp send request.")
model WhatsAppSendBase {
  @doc("Recipient phone number in E.164 format.")
  @example("+15551234567")
  to: string;

  @doc("Your WhatsApp business number, prefixed with `whatsapp:`. The prefix is what routes the message over WhatsApp instead of SMS/MMS.")
  @example("whatsapp:+15557654321")
  from: string;

  @doc("A valid URL to receive message status callback events at each state change.")
  @example("https://example.com/webhooks/message-status")
  status_callback?: url;

  @doc("Your own key/value string pairs to attach to the message. Delivered as `custom_variables` in status callbacks when `status_callback` is set.")
  @maxProperties(20)
  custom_variables?: TypeSpec.Record<string>;
}

// ---------------------------------------------------------------------------
// Media message bodies
// ---------------------------------------------------------------------------

@doc("Body for an image message. Provide either `link` or `id` (not both).")
model WhatsAppImageBody {
  @doc("A public HTTP/HTTPS URL to the image.")
  @example("https://example.com/promo-banner.png")
  link?: url;

  @doc("The ID of media previously uploaded to WhatsApp. Mutually exclusive with `link`.")
  id?: string;

  @doc("Optional caption shown with the image.")
  @example("Check out our summer sale!")
  caption?: string;
}

@doc("Body for a video message. Provide either `link` or `id` (not both).")
model WhatsAppVideoBody {
  @doc("A public HTTP/HTTPS URL to the video.")
  @example("https://example.com/clip.mp4")
  link?: url;

  @doc("The ID of media previously uploaded to WhatsApp. Mutually exclusive with `link`.")
  id?: string;

  @doc("Optional caption shown with the video.")
  caption?: string;
}

@doc("Body for an audio message. Provide either `link` or `id` (not both). Captions are not supported.")
model WhatsAppAudioBody {
  @doc("A public HTTP/HTTPS URL to the audio file.")
  @example("https://example.com/voice-note.mp3")
  link?: url;

  @doc("The ID of media previously uploaded to WhatsApp. Mutually exclusive with `link`.")
  id?: string;
}

@doc("Body for a sticker message. Provide either `link` or `id` (not both). Captions are not supported.")
model WhatsAppStickerBody {
  @doc("A public HTTP/HTTPS URL to a `.webp` sticker.")
  @example("https://example.com/sticker.webp")
  link?: url;

  @doc("The ID of media previously uploaded to WhatsApp. Mutually exclusive with `link`.")
  id?: string;
}

@doc("Body for a document message. Provide either `link` or `id` (not both).")
model WhatsAppDocumentBody {
  @doc("A public HTTP/HTTPS URL to the document.")
  @example("https://example.com/invoice.pdf")
  link?: url;

  @doc("The ID of media previously uploaded to WhatsApp. Mutually exclusive with `link`.")
  id?: string;

  @doc("Optional caption shown with the document.")
  caption?: string;

  @doc("Optional filename shown to the recipient. Maximum 240 characters.")
  @maxLength(240)
  @example("invoice.pdf")
  filename?: string;
}

@doc("Body for a location message. All fields are required.")
model WhatsAppLocationBody {
  @doc("Latitude, between -90 and 90.")
  @minValue(-90)
  @maxValue(90)
  @example(41.8781)
  latitude: float64;

  @doc("Longitude, between -180 and 180.")
  @minValue(-180)
  @maxValue(180)
  @example(-87.6298)
  longitude: float64;

  @doc("The name of the location.")
  @example("SignalWire HQ")
  name: string;

  @doc("The address of the location.")
  @example("Chicago, IL, USA")
  address: string;
}

@doc("Body for a reaction message.")
model WhatsAppReactionBody {
  @doc("The ID of the message being reacted to.")
  @example("wamid.HBgLMTU1NTEyMzQ1NjcVAgARGBI...")
  message_id: string;

  @doc("The emoji to react with.")
  @example("👍")
  emoji: string;
}

@doc("The name fields of a shared contact.")
model WhatsAppContactName {
  @doc("The contact's full formatted name. Required.")
  @example("Jane Smith")
  formatted_name: string;

  ...TypeSpec.Record<unknown>;
}

@doc("A shared contact card. Additional fields (phones, emails, org, etc.) follow the WhatsApp contacts message format.")
model WhatsAppContact {
  @doc("The contact's name. `formatted_name` is required.")
  name: WhatsAppContactName;

  ...TypeSpec.Record<unknown>;
}

// ---------------------------------------------------------------------------
// Interactive message body (shared across all interactive types)
// ---------------------------------------------------------------------------

@doc("""
  Body for an interactive message. `type` and `action` are required; `header`, `body`, and `footer` are optional. The shape of `action` depends on the interactive type — buttons, list sections, a call-to-action URL, a location request, or a Flow — and follows the WhatsApp interactive message format.
  """)
model WhatsAppInteractiveBody {
  @doc("The interactive type, e.g. `button`, `list`, `cta_url`, `location_request_message`, or `flow`.")
  @example("button")
  type: string;

  @doc("The interactive action. Its contents depend on `type` (for example, a `buttons` array, list `sections`, or Flow parameters).")
  action: TypeSpec.Record<unknown>;

  @doc("Optional header object.")
  header?: TypeSpec.Record<unknown>;

  @doc("Optional body object, e.g. `{ \"text\": \"How can we help?\" }`.")
  body?: TypeSpec.Record<unknown>;

  @doc("Optional footer object.")
  footer?: TypeSpec.Record<unknown>;
}

// ---------------------------------------------------------------------------
// WhatsApp content message request variants (discriminated by message_type)
// ---------------------------------------------------------------------------

@doc("Send a plain text WhatsApp message. Allowed only within the 24-hour customer service window.")
model WhatsAppTextMessageRequest {
  ...WhatsAppSendBase;
  message_type: "whatsapp_media_text";

  @doc("The message text.")
  @example("Your appointment is confirmed for tomorrow at 2pm.")
  body: string;
}

@doc("Send an image message.")
model WhatsAppImageMessageRequest {
  ...WhatsAppSendBase;
  message_type: "whatsapp_media_image";
  body: WhatsAppImageBody;
}

@doc("Send an audio message.")
model WhatsAppAudioMessageRequest {
  ...WhatsAppSendBase;
  message_type: "whatsapp_media_audio";
  body: WhatsAppAudioBody;
}

@doc("Send a video message.")
model WhatsAppVideoMessageRequest {
  ...WhatsAppSendBase;
  message_type: "whatsapp_media_video";
  body: WhatsAppVideoBody;
}

@doc("Send a document message.")
model WhatsAppDocumentMessageRequest {
  ...WhatsAppSendBase;
  message_type: "whatsapp_media_document";
  body: WhatsAppDocumentBody;
}

@doc("Send a sticker message.")
model WhatsAppStickerMessageRequest {
  ...WhatsAppSendBase;
  message_type: "whatsapp_media_sticker";
  body: WhatsAppStickerBody;
}

@doc("Share a location.")
model WhatsAppLocationMessageRequest {
  ...WhatsAppSendBase;
  message_type: "whatsapp_media_location";
  body: WhatsAppLocationBody;
}

@doc("Share one or more contact cards.")
model WhatsAppContactsMessageRequest {
  ...WhatsAppSendBase;
  message_type: "whatsapp_media_contacts";

  @doc("One or more contacts to share.")
  body: WhatsAppContact[];
}

@doc("React to a message with an emoji.")
model WhatsAppReactionMessageRequest {
  ...WhatsAppSendBase;
  message_type: "whatsapp_media_reaction";
  body: WhatsAppReactionBody;
}

@doc("Send a call-to-action (button) interactive message.")
model WhatsAppInteractiveCtaMessageRequest {
  ...WhatsAppSendBase;
  message_type: "whatsapp_interactive_cta";
  body: WhatsAppInteractiveBody;
}

@doc("Send a list interactive message (up to 10 items).")
model WhatsAppInteractiveListMessageRequest {
  ...WhatsAppSendBase;
  message_type: "whatsapp_interactive_list";
  body: WhatsAppInteractiveBody;
}

@doc("Send a reply-button interactive message (up to 3 buttons).")
model WhatsAppInteractiveReplyButtonMessageRequest {
  ...WhatsAppSendBase;
  message_type: "whatsapp_interactive_reply_button";
  body: WhatsAppInteractiveBody;
}

@doc("Request the customer's location.")
model WhatsAppInteractiveLocationRequestMessageRequest {
  ...WhatsAppSendBase;
  message_type: "whatsapp_interactive_location_request_message";
  body: WhatsAppInteractiveBody;
}

@doc("A WhatsApp content message. The `message_type` field determines the shape of `body`.")
@discriminated(#{ discriminatorPropertyName: "message_type", envelope: "none" })
union WhatsAppContentMessageRequest {
  whatsapp_media_text: WhatsAppTextMessageRequest,
  whatsapp_media_image: WhatsAppImageMessageRequest,
  whatsapp_media_audio: WhatsAppAudioMessageRequest,
  whatsapp_media_video: WhatsAppVideoMessageRequest,
  whatsapp_media_document: WhatsAppDocumentMessageRequest,
  whatsapp_media_sticker: WhatsAppStickerMessageRequest,
  whatsapp_media_location: WhatsAppLocationMessageRequest,
  whatsapp_media_contacts: WhatsAppContactsMessageRequest,
  whatsapp_media_reaction: WhatsAppReactionMessageRequest,
  whatsapp_interactive_cta: WhatsAppInteractiveCtaMessageRequest,
  whatsapp_interactive_list: WhatsAppInteractiveListMessageRequest,
  whatsapp_interactive_reply_button: WhatsAppInteractiveReplyButtonMessageRequest,
  whatsapp_interactive_location_request_message: WhatsAppInteractiveLocationRequestMessageRequest,
}

// ---------------------------------------------------------------------------
// WhatsApp template message request
// ---------------------------------------------------------------------------

@doc("Send an approved WhatsApp template. Use this to reach a customer for the first time or outside the 24-hour window. Do not include `body` or `message_type`.")
model WhatsAppTemplateMessageRequest {
  ...WhatsAppSendBase;

  @doc("The template to send, by SignalWire template ID or Meta template ID. The template must be `approved`.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  template_id: string;

  @doc("Values for the placeholders in the template header. An array for positional parameters, an object for named parameters, or a media URL string for a document/media header.")
  header_template_parameters?: string[] | TypeSpec.Record<string> | string;

  @doc("Values for the placeholders in the template body. An array for positional parameters or an object for named parameters.")
  body_template_parameters?: string[] | TypeSpec.Record<string>;

  @doc("Values for URL-button placeholders. Positional only (an array); named parameters are not supported for buttons.")
  button_template_parameters?: string[];
}

// ---------------------------------------------------------------------------
// Combined request body for the send-message endpoint
// ---------------------------------------------------------------------------

@doc("""
  Request body for `POST /api/messaging/messages`. The channel is determined by the `from` number:

  - An SMS/MMS request when `from` is a purchased phone number or shortcode.
  - A WhatsApp **content** message when `from` is a `whatsapp:`-prefixed number and `message_type` is set.
  - A WhatsApp **template** message when `from` is a `whatsapp:`-prefixed number and `template_id` is set.
  """)
union SendMessageRequest {
  CreateMessageRequest,
  WhatsAppContentMessageRequest,
  WhatsAppTemplateMessageRequest,
}
