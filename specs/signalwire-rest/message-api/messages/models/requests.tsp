import "@typespec/http";
import "@typespec/json-schema";
import "./core.tsp";

using TypeSpec.Http;
using TypeSpec.JsonSchema;

namespace SignalWireAPI.Message;

@doc("Request body for sending a new SMS or MMS message.")
model CreateMessageRequest {
  @doc("Destination phone number in E.164 format (`+` followed by 5-17 digits). Also accepts passthrough numbers like `988`/`+988`.")
  @example("+15551234567")
  to: string;

  @doc("Source phone number. Must be a purchased SignalWire phone number on the project in E.164 format, or a shortcode (5-6 digits). Verified caller IDs are not permitted.")
  @example("+15559876543")
  from: string;

  @doc("Message body text. Required if `media` is not provided. Subject to provider-specific character limits.")
  @example("Your order #12345 has shipped!")
  body?: string;

  @doc("Array of HTTP or HTTPS URLs for media attachments. Presence of media makes the message MMS. Maximum 8 items.")
  @example(#["https://example.com/tracking.png"])
  media?: url[];

  @doc("Force the message to be sent as MMS even when no media attachments are provided.")
  @example(false)
  send_as_mms?: boolean = false;

  @doc("A valid URL to receive message status callback events at each state change. See the [Message status callback](/docs/apis/rest/messages/webhooks/message-status-callback) webhook for the payload your URL will receive.")
  @example("https://example.com/webhooks/message-status")
  status_callback?: url;

  @doc("""
    Your own key/value string pairs to attach to the message — for example, an order or case number you want to recognize later. When you also set `status_callback`, SignalWire includes these pairs as a `custom_variables` object in every status callback it sends to that URL, so you can match each callback to a record in your own system. If you don't set `status_callback`, there is nowhere for the variables to be delivered.

    Each value must be a non-empty string of at most 1024 bytes. You can send at most 20 pairs. Each key must start with a letter or underscore and contain only letters, numbers, and underscores, and cannot begin with the reserved prefixes `signalwire_`, `sw_`, `rtc_`, or `internal_` (case-insensitive). Keys are case-sensitive.
    """)
  @maxProperties(20)
  @example(#{ id: "12345", case_number: "54321" })
  custom_variables?: TypeSpec.Record<string>;
}

@doc("Request body for redacting the body of a previously sent message. Only `body` may be updated, and it must be an empty string.")
model UpdateMessageRequest {
  @doc("Must be an empty string (`\"\"`) to redact the message. Any non-empty value is rejected with `body_must_be_empty`. This is the only field that can be updated.")
  @example("")
  body: string;
}
