import "@typespec/json-schema";
import "../switch";

// A WhatsApp or RCS reply runs the same content, template, and RCS content validation as
// `POST /api/messaging/messages`, so those shapes reference the REST message models instead of
// forking them. whatsapp.tsp also imports rcs.tsp.
import "../../../../signalwire-rest/message-api/messages/models/whatsapp.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Messaging;

@summary("Reply (base fields)")
model ReplyBase {
  @doc("""
    Destination phone number in E.164 format. Defaults to the inbound message's `from`; on
    WhatsApp, a leading `+` is added to it. On RCS it must be a US number.
    """)
  @example("+15551234567")
  to?: string;

  @doc("""
    Sender of the reply. Defaults to the inbound message's `to`, so the reply comes from the
    number or agent that received the message. For SMS and MMS, a phone number or short code
    owned by your project with messaging capability. For WhatsApp, a WhatsApp number in your
    project, prefixed with `whatsapp:`. For RCS, the ID of an RCS agent in your project.
    """)
  @example("+15559876543")
  from?: string;

  @doc("""
    HTTP or HTTPS URL that receives delivery status callbacks for the outbound reply. The
    callback uses the [message status callback payload](/docs/apis/rest/webhooks/message-status-callback).
    Callbacks are delivered after the reply is queued, so a `queued` result does not confirm
    that a callback reached this URL.
    """)
  @example("https://example.com/reply-status")
  status_url?: url;
}

@doc("""
  Reply body text, used by the string shorthand and by string outcomes of an inline
  `switch`. After variable expansion it must contain at least one non-whitespace
  character.
  
  Body length is checked before the reply is queued. The limit depends on the channel
  (SMS, MMS, WhatsApp, or RCS) and on the route SignalWire uses to send the reply, and length is counted
  according to the message encoding. A body over the limit fails the reply with a
  `swml_reply_character_limit_exceeded` error whose message states the limit.
  """)
@summary("Reply body text")
@minLength(1)
scalar ReplyText extends string;

@summary("Reply with body")
model ReplyWithBody is ReplyBase {
  @doc("""
    Body text of the reply. For SMS and MMS, required if `media` is not present. When no
    media is attached, the body must contain at least one non-whitespace character after
    variable expansion.
    
    Body length is checked before the reply is queued. The limit depends on the channel
    (SMS, MMS, WhatsApp, or RCS) and on the route SignalWire uses to send the reply, and length is counted
    according to the message encoding. A body over the limit fails the reply with a
    `swml_reply_character_limit_exceeded` error whose message states the limit.
    """)
  @minLength(1)
  @example("Thanks for your message!")
  body: string;

  @doc("""
    Array of HTTP or HTTPS media URLs to attach. Converts the message to MMS. Maximum 8
    attachments. Media is fetched after the reply is queued, so a `queued` result does not
    confirm that the media could be retrieved.
    
    SMS and MMS only. A WhatsApp reply ignores `media`, and an RCS reply that sets it fails
    with `rcs_media_not_supported`.
    """)
  @maxItems(8)
  @example(#["https://example.com/image.jpg"])
  media?: url[];
}

@summary("Reply with media")
model ReplyWithMedia is ReplyBase {
  @doc("""
    Array of HTTP or HTTPS media URLs to attach. Converts the message to MMS. Required if
    `body` is not present, and must then contain at least one URL. Maximum 8 attachments.
    Media is fetched after the reply is queued, so a `queued` result does not confirm that
    the media could be retrieved.
    
    SMS and MMS only. A WhatsApp reply ignores `media`, so it needs a `body` or `template_id`
    instead, and an RCS reply that sets it fails with `rcs_media_not_supported`.
    """)
  @minItems(1)
  @maxItems(8)
  @example(#["https://example.com/image.jpg"])
  media: url[];

  @doc("""
    Optional body text included alongside the media attachments. Must be a non-empty string
    if provided. Body length is checked before the reply is queued. The limit depends on
    the route SignalWire uses to send the reply, and length is counted according to the
    message encoding. A body over the limit fails the reply with a
    `swml_reply_character_limit_exceeded` error whose message states the limit.
    """)
  @minLength(1)
  @example("Check out this image!")
  body?: string;
}

@summary("WhatsApp message type")
@doc("The kind of WhatsApp message a reply sends. Each type sets the shape of `body`.")
union WhatsAppReplyMessageType {
  "whatsapp_media_text",
  "whatsapp_media_contacts",
  "whatsapp_media_audio",
  "whatsapp_media_document",
  "whatsapp_media_image",
  "whatsapp_media_sticker",
  "whatsapp_media_video",
  "whatsapp_media_reaction",
  "whatsapp_media_location",
  "whatsapp_interactive_cta",
  "whatsapp_interactive_flow",
  "whatsapp_interactive_list",
  "whatsapp_interactive_location_request_message",
  "whatsapp_interactive_reply_button",
}

// WhatsApp only. A WhatsApp reply with no `message_type` is a text message and matches
// `ReplyWithBody`, so this variant requires `message_type` instead of making it a discriminator.
@summary("WhatsApp reply with message type")
@doc("""
  A WhatsApp media or interactive reply. Applies only when the inbound message is a WhatsApp
  message. Free-form WhatsApp messages can only be sent within 24 hours of the customer's last
  inbound message.
  """)
model ReplyWhatsAppMessage is ReplyBase {
  @doc("""
    The kind of WhatsApp message to send. A WhatsApp reply without `message_type` is sent as
    `whatsapp_media_text`.
    """)
  @example("whatsapp_interactive_reply_button")
  message_type: WhatsAppReplyMessageType;

  @doc("""
    Message content, in the shape that `message_type` calls for: text for
    `whatsapp_media_text`, an array of contacts for `whatsapp_media_contacts`, and an object
    for every other type. These are the same shapes the
    [send message API](/docs/apis/rest/messages/create-message) accepts. A string is sent as
    is for text and parsed as JSON for the other types. An object or array body is counted
    as its JSON text for the character limit, so a large interactive body can exceed it.
    """)
  body:
    | string
    | SignalWireAPI.Message.WhatsAppImageBody
    | SignalWireAPI.Message.WhatsAppVideoBody
    | SignalWireAPI.Message.WhatsAppAudioBody
    | SignalWireAPI.Message.WhatsAppStickerBody
    | SignalWireAPI.Message.WhatsAppDocumentBody
    | SignalWireAPI.Message.WhatsAppLocationBody
    | SignalWireAPI.Message.WhatsAppReactionBody
    | SignalWireAPI.Message.WhatsAppContact[]
    | SignalWireAPI.Message.WhatsAppInteractiveBody;
}

alias WhatsAppTemplateReplyKeys =
  | "template_id"
  | "header_template_parameters"
  | "body_template_parameters"
  | "button_template_parameters";

// WhatsApp only. Template fields are validated exactly as for the send message API; the reply
// additionally requires the template to belong to the WhatsApp Business Account of `from`.
@summary("WhatsApp reply with template")
@doc("""
  A WhatsApp template reply. Applies only when the inbound message is a WhatsApp message. Use
  a template to reply more than 24 hours after the customer's last inbound message. The
  template must be approved and belong to the same WhatsApp Business Account as the `from`
  number. Do not set `body`.
  """)
model ReplyWhatsAppTemplate is ReplyBase {
  ...PickProperties<
    SignalWireAPI.Message.WhatsAppTemplateMessageRequest,
    WhatsAppTemplateReplyKeys
  >;
}

// RCS only. `content` is validated exactly as for the send message API.
@summary("RCS reply with rich content")
@doc("""
  An RCS rich-content reply. Applies only when the inbound message is an RCS message. Set
  `content` or `body`, never both.
  """)
model ReplyRcsContent is ReplyBase {
  @doc("""
    Rich content to send: media, a location, text with suggestions, a card, or a carousel.
    The same content types as the [send message API](/docs/apis/rest/messages/create-message).
    """)
  content: SignalWireAPI.Message.RcsContent;
}

alias ReplyPlan =
  | ReplyWithBody
  | ReplyWithMedia
  | ReplyWhatsAppMessage
  | ReplyWhatsAppTemplate
  | ReplyRcsContent;

@summary("Reply with inline switch")
@doc("""
  Branch the reply on a variable value. The matched `case` (or `default`) supplies the
  reply contents in one of two forms:
  
  - **String** — sent back to the original sender as the reply body. The simplest form,
    good for choosing between canned text responses.
  - **Reply object** — any object form of `reply`, such as `{ body, media, to, from,
    status_url }`, or a WhatsApp or RCS reply object, so the matched branch can attach
    media, send rich content, override the destination, or set a per-branch status
    callback. Any `%{…}` placeholders inside the object are expanded before the reply is
    sent.
  
  When you use an inline `switch`, do not set `body`, `media`, `to`, `from`, or
  `status_url` directly on the same `reply` — put them inside each `case` value
  (or `default`) instead.
  """)
model ReplyInlineSwitch {
  switch: {
    @doc("Variable path to match. Specified without the `%{}` wrapper (e.g. `message.body`).")
    @example("message.body")
    variable: string;

    @doc("Transform to apply to the value before matching.")
    @example(SwitchTransform.lowercase_trim)
    transform?: SwitchTransform;

    @doc("""
      Map of values to reply outcomes. Each entry's value is either a string (used as
      the reply body, sent back to the original sender) or a full reply object, in any of
      the object forms `reply` accepts. Use the object form when the branch needs media,
      rich content, a different destination, or a per-branch `status_url`.
      """)
    case: {
      ...TypeSpec.Record<ReplyText | ReplyPlan>;
    };

    @doc("""
      Fallback used when no `case` value matches. Same string-or-reply-object shape as a
      `case` value. If omitted and no case matches, the `reply` step fails and execution
      stops.
      """)
    default?: ReplyText | ReplyPlan;
  };
}

@summary("reply Method")
model Reply {
  @summary("reply")
  @doc("""
    Create and send an outbound message in response to the inbound message. The reply goes
    out on the inbound message's channel: SMS or MMS, WhatsApp, or RCS. Accepts one of: a
    string (used as the message body), an object with content and routing fields, or an
    inline `switch` that branches the reply on a variable value.
    
    `reply` does not end execution — subsequent steps in the section continue to run after
    the reply is queued.
    """)
  reply: ReplyText | ReplyPlan | ReplyInlineSwitch;
}
