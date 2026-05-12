import "@typespec/json-schema";
import "../switch";

using TypeSpec.JsonSchema;

namespace SWML.Messaging;

@summary("Reply (base fields)")
model ReplyBase {
  @doc("Destination phone number in E.164 format. Defaults to the inbound message's `from`.")
  @example("+15551234567")
  to?: string;

  @doc("Sending phone number. Must be a PhoneRoute or ShortCode in the project. Defaults to the inbound message's `to`.")
  @example("+15559876543")
  from?: string;

  @doc("URL that receives delivery status callbacks for the outbound reply. The callback uses the [message status callback payload](/docs/apis/rest/messages/webhooks/message-status-callback).")
  @example("https://example.com/reply-status")
  status_url?: url;
}

@summary("Reply with body")
model ReplyWithBody is ReplyBase {
  @doc("Body text of the reply. Must be a non-empty string. Required if `media` is not present.")
  @minLength(1)
  @example("Thanks for your message!")
  body: string;

  @doc("Array of media URLs to attach. Converts the message to MMS. Maximum 8 attachments.")
  @maxItems(8)
  @example(#["https://example.com/image.jpg"])
  media?: url[];
}

@summary("Reply with media")
model ReplyWithMedia is ReplyBase {
  @doc("Array of media URLs to attach. Converts the message to MMS. Maximum 8 attachments. Required if `body` is not present.")
  @maxItems(8)
  @example(#["https://example.com/image.jpg"])
  media: url[];

  @doc("Optional body text included alongside the media attachments. Must be a non-empty string if provided.")
  @minLength(1)
  @example("Check out this image!")
  body?: string;
}

alias ReplyPlan = ReplyWithBody | ReplyWithMedia;

@summary("Reply with inline switch")
@doc("""
  Branch the reply on a variable value. The matched `case` (or `default`) supplies the
  reply contents in one of two forms:

  - **String** — sent back to the original sender as the SMS body. The simplest form,
    good for choosing between canned text responses.
  - **Reply object** — a full `{ body, media, to, from, status_url }` block, so the
    matched branch can attach media, override the destination, or set a per-branch
    status callback. Any `%{…}` placeholders inside the object are expanded before
    the reply is sent.

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
      the reply body, sent back to the original sender as SMS) or a full reply object
      (`body`, `media`, `to`, `from`, `status_url`). Use the object form when the
      branch needs media, a different destination, or a per-branch `status_url`.
      """)
    case: {
      ...TypeSpec.Record<string | ReplyPlan>;
    };

    @doc("Fallback used when no `case` value matches. Same string-or-reply-object shape as a `case` value.")
    default?: string | ReplyPlan;
  };
}

@summary("reply Method")
model Reply {
  @summary("reply")
  @doc("""
    Create and send an outbound message in response to the inbound message. Accepts one of:
    a string (used as the message body), an object with body, media, and routing fields, or
    an inline `switch` that branches the reply on a variable value.
    """)
  reply: string | ReplyPlan | ReplyInlineSwitch;
}
