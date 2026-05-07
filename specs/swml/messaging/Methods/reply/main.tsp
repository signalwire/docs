import "@typespec/json-schema";

using TypeSpec.JsonSchema;

@summary("ReplyBase object")
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
  media?: string[];
}

@summary("Reply with media")
model ReplyWithMedia is ReplyBase {
  @doc("Array of media URLs to attach. Converts the message to MMS. Maximum 8 attachments. Required if `body` is not present.")
  @maxItems(8)
  @example(#["https://example.com/image.jpg"])
  media: string[];

  @doc("Optional body text included alongside the media attachments.")
  @example("Check out this image!")
  body?: string;
}

alias ReplyPlan = ReplyWithBody | ReplyWithMedia;

@summary("reply Method")
model Reply {
  @oneOf
  @summary("reply")
  @doc("""
    Create and send an outbound message in response to the inbound message.
    Accepts either a string shorthand (used as the message body) or an object with body,
    optional media, and optional routing fields.
    """)
  reply: string | ReplyPlan;
}
