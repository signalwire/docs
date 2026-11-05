import "@typespec/http";
import "@typespec/json-schema";
import "./core.tsp";

using TypeSpec.Http;
using TypeSpec.JsonSchema;

namespace SignalWireAPI.Message;

@doc("A suggested reply. Tapping it sends a reply to your agent as an inbound message.")
model RcsReplyAction {
  type: "reply";

  @doc("Text shown on the suggestion.")
  @example("Yes, confirm")
  title: string;
}

@doc("Opens a URL on the recipient's device.")
model RcsUrlAction {
  type: "url";

  @doc("Text shown on the suggestion.")
  @example("Track your order")
  title: string;

  @doc("The HTTP or HTTPS URL to open.")
  @example("https://example.com/orders/12345")
  url: url;

  @doc("How the URL opens: in the device's browser, or in a webview inside the messaging app at full, half, or tall height.")
  @example("browser")
  webview?: "browser" | "full" | "half" | "tall";
}

@doc("Starts a phone call from the recipient's device.")
model RcsCallAction {
  type: "call";

  @doc("Text shown on the suggestion.")
  @example("Call us")
  title: string;

  @doc("The phone number to call.")
  @example("+15557654321")
  phone: string;
}

@doc("Shows a location on a map on the recipient's device.")
model RcsLocationAction {
  type: "location";

  @doc("Text shown on the suggestion.")
  @example("View store")
  title: string;

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

  @doc("Optional label for the pin on the map.")
  @example("Downtown store")
  label?: string;
}

@doc("Adds an event to the recipient's calendar.")
model RcsCalendarAction {
  type: "calendar";

  @doc("Text shown on the suggestion.")
  @example("Add to calendar")
  title: string;

  @doc("Title of the calendar event.")
  @example("Dental appointment")
  event_title: string;

  @doc("Start time of the event.")
  @example("2026-12-01T15:00:00Z")
  start: string;

  @doc("End time of the event.")
  @example("2026-12-01T15:30:00Z")
  end: string;

  @doc("Optional description of the calendar event.")
  @example("Bring your insurance card.")
  description?: string;

  @doc("An HTTP or HTTPS URL to open when the device can't create the calendar event.")
  @example("https://example.com/appointments/12345")
  fallback_url: url;
}

@doc("Asks the recipient to share their location.")
model RcsRequestLocationAction {
  type: "request_location";

  @doc("Text shown on the suggestion.")
  @example("Share your location")
  title: string;

  @doc("An HTTP or HTTPS URL to open when the device can't share its location.")
  @example("https://example.com/find-a-store")
  fallback_url: url;
}

@doc("A suggestion shown with a message. The `type` field determines the other fields.")
@discriminated(#{ discriminatorPropertyName: "type", envelope: "none" })
union RcsAction {
  reply: RcsReplyAction,
  url: RcsUrlAction,
  call: RcsCallAction,
  location: RcsLocationAction,
  calendar: RcsCalendarAction,
  request_location: RcsRequestLocationAction,
}

@doc("A rich card: a title with optional subtitle, image, and suggestions.")
model RcsCard {
  @doc("Card title. Maximum 200 characters.")
  @maxLength(200)
  @example("Your order has shipped")
  title: string;

  @doc("Card subtitle. Maximum 2000 characters.")
  @maxLength(2000)
  @example("Order #12345 arrives Thursday.")
  subtitle?: string;

  @doc("An HTTP or HTTPS URL to a media file shown on the card.")
  @example("https://example.com/images/package.png")
  media?: url;

  @doc("Suggestions shown on the card.")
  actions?: RcsAction[];
}

@doc("Sends a media file.")
model RcsMediaContent {
  type: "media";

  @doc("An HTTP or HTTPS URL to the file.")
  @example("https://example.com/images/promo.png")
  url: url;
}

@doc("Sends a location pin.")
model RcsLocationContent {
  type: "location";

  @doc("Name of the location.")
  @example("Downtown store")
  title: string;

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

  @doc("Optional label for the pin on the map.")
  @example("Open until 9pm")
  label?: string;
}

@doc("Sends text with suggestions the recipient can tap.")
model RcsSuggestionsContent {
  type: "suggestions";

  @doc("Message text. Maximum 3072 characters.")
  @maxLength(3072)
  @example("Can you make your appointment tomorrow at 2pm?")
  text: string;

  @doc("Suggestions shown under the text.")
  actions: RcsAction[];
}

@doc("Sends a single rich card.")
model RcsCardContent {
  type: "card";
  ...RcsCard;
}

@doc("Sends a horizontally scrolling set of rich cards.")
model RcsCarouselContent {
  type: "carousel";

  @doc("The cards in the carousel. Maximum 10 cards.")
  @maxItems(10)
  cards: RcsCard[];

  @doc("Suggestions shown under the carousel. Maximum 3.")
  @maxItems(3)
  actions?: RcsAction[];
}

@doc("Rich content for an RCS message. The `type` field determines the other fields.")
@discriminated(#{ discriminatorPropertyName: "type", envelope: "none" })
union RcsContent {
  media: RcsMediaContent,
  location: RcsLocationContent,
  suggestions: RcsSuggestionsContent,
  card: RcsCardContent,
  carousel: RcsCarouselContent,
}

@doc("Send an RCS message from an RCS agent. Provide either `body` for plain text or `content` for rich content, not both. `media` and `message_type` are not supported.")
model RcsMessageRequest {
  @doc("Recipient phone number in E.164 format. Must be a US number: RCS messaging isn't available in other countries yet.")
  @example("+15551234567")
  to: string;

  @doc("The ID of your RCS agent, shown on the agent's page in the Dashboard. The agent must be in review, launching, or launched.")
  @example("7d3e1f2a-9b8c-4d5e-a6f7-1234567890ab")
  from: uuid;

  @doc("Plain-text message body. Required when `content` is not provided.")
  @example("Your appointment is confirmed for tomorrow at 2pm.")
  body?: string;

  @doc("Rich content: media, a location, text with suggestions, a card, or a carousel. Required when `body` is not provided.")
  content?: RcsContent;

  @doc("A valid URL to receive message status callback events at each state change.")
  @example("https://example.com/webhooks/message-status")
  status_callback?: url;

  @doc("Your own key/value string pairs to attach to the message. Delivered as `custom_variables` in status callbacks when `status_callback` is set.")
  @maxProperties(20)
  custom_variables?: TypeSpec.Record<string>;
}
