import "../../../types";

using TypeSpec.Http;

model RelayApplicationPathID {
  @doc("Unique ID of a Relay Application.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid
}

model RelayApplicationID {
  @doc("Unique ID of a Relay Application.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  relay_application_id: uuid
}

model RelayApplication {
  @doc("Name of the Relay Application")
  @example("Booking Assistant")
  name: string;

  @doc("Topic of the Relay Application")
  @example("booking")
  topic: string;

  @doc("Call status callback URL")
  @example("https://booking.com/callbacks")
  call_status_callback_url: string;
}

model RelayApplicationConfig {
  @doc("Environment variables for the application")
  environment?: Record<string>;

  @doc("Whether the application is enabled")
  @example(true)
  enabled?: boolean;

  @doc("Webhook URL for events")
  @example("https://example.com/relay/webhook")
  webhook_url?: string;

  @doc("Events to subscribe to")
  @example(#["call.created", "call.updated", "message.received"])
  event_subscriptions?: string[];
}

model RelayApplicationWithID {
  ...RelayApplicationID,
  ...RelayApplication
}