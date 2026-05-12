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

  @doc("URL to receive delivery status callbacks for the outbound reply message.")
  @example("https://example.com/reply-status")
  status_url?: url;
}

@summary("Reply with body")
model ReplyWithBody is ReplyBase {
  @doc("The body of the reply message. Required if `media` is not present.")
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

  @doc("Optional body text included alongside the media attachments.")
  @example("Check out this image!")
  body?: string;
}

alias ReplyPlan = ReplyWithBody | ReplyWithMedia;

@summary("Reply with inline switch")
@doc("""
  Branch the reply body based on a variable value. The matching case (or `default`) provides
  the reply body. When using an inline `switch`, you cannot also set `body`, `media`, `to`,
  `from`, or `status_url` on the same `reply`.
  """)
model ReplyInlineSwitch {
  switch: {
    @doc("Variable path to match. Specified without the `%{}` wrapper (e.g. `message.body`).")
    @example("message.body")
    variable: string;

    @doc("Transform to apply to the value before matching.")
    @example(SwitchTransform.lowercase_trim)
    transform?: SwitchTransform;

    @doc("Map of values to reply bodies. The matched value is used as the reply body.")
    case: {
      ...TypeSpec.Record<string>;
    };

    @doc("Fallback reply body used when no `case` value matches.")
    default?: string;
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
