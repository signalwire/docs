import "./enums.tsp";
import "../../../types";

using TypeSpec.Http;

model SWMLWebhookID {
  @doc("Unique ID of a SWML Webhook.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid;
}

model SWMLWebhook {
  @doc("Unique ID of the SWML Webhook.")
  @example("a87db7ed-8ebe-42e4-829f-8ba5a4152f54")
  id: uuid;

  @doc("Name of the SWML Webhook.")
  @example("My SWML Webhook")
  name: string;

  @doc("Indicates whether this SWML Webhook handles inbound calls or inbound messages. Determines the payload SignalWire POSTs to `primary_request_url`.")
  @example("calling")
  used_for: "calling" | "messaging";

  @doc("Primary URL SignalWire fetches the SWML document from when the webhook fires. The webhook payload depends on `used_for`: for `calling`, see the [SWML inbound call webhook](/docs/apis/rest/swml-webhook/webhooks/inbound-call-webhook); for `messaging`, see the [SWML inbound message webhook](/docs/apis/rest/swml-webhook/webhooks/inbound-message-webhook).")
  @example("https://primary.com")
  primary_request_url: url;

  @doc("Primary request method of the SWML Webhook.")
  @example(RequestUrlMethodType.Get)
  primary_request_method: RequestUrlMethodType;

  @doc("Fallback URL SignalWire fetches the SWML document from if the primary URL fails. Receives the same payload as `primary_request_url` — see the [SWML inbound call webhook](/docs/apis/rest/swml-webhook/webhooks/inbound-call-webhook) or [SWML inbound message webhook](/docs/apis/rest/swml-webhook/webhooks/inbound-message-webhook) depending on `used_for`.")
  @example("https://fallback.com")
  fallback_request_url: url | null;

  @doc("Fallback request method of the SWML Webhook.")
  @example(RequestUrlMethodType.Get)
  fallback_request_method: RequestUrlMethodType;

  @doc("URL to receive message status callback events for outbound messages sent by this webhook (`reply` or `send_sms`). See the [Message status callback](/docs/apis/rest/messages/webhooks/message-status-callback) webhook for the payload your URL will receive.")
  @example("https://callback.com")
  status_callback_url: url | null;

  @doc("Status callback method of the SWML Webhook.")
  @example(RequestUrlMethodType.Post)
  status_callback_method: RequestUrlMethodType;
}
