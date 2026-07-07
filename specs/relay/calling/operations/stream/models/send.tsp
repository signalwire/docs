import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Which audio track to stream.")
union StreamTrack {
  "inbound_track",
  "outbound_track",
  "both_tracks",
}

model StreamParams {
  ...CallAddress;

  @doc("Identifier used to control the active stream.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("WebSocket URI (`wss://`) to stream audio to.")
  @example("wss://example.com/media")
  url: url;

  @doc("A friendly name for the stream.")
  @example("my_stream")
  name?: string;

  @doc("Audio codec for the stream (e.g. `PCMU`, `OPUS`). Defaults to the call's native codec — leave unset unless your endpoint needs a specific one.")
  @example("PCMU")
  codec?: string;

  @doc("""
    Which audio track to stream. `inbound_track` (what the caller says),
    `outbound_track` (what the caller hears), or `both_tracks`. Default
    `inbound_track`.
    """)
  @example("inbound_track")
  track?: StreamTrack = "inbound_track";

  @doc("HTTP(s) URL that stream status events are POSTed to.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;

  @doc("HTTP method for `status_url`. Default `POST`.")
  @example("POST")
  status_url_method?: "GET" | "POST" = "POST";

  @doc("Bearer token to include in the WebSocket connection.")
  @example("my-token")
  authorization_bearer_token?: string;

  @doc("""
    JSON object of custom key-value pairs sent to the WebSocket endpoint on
    connect.
    """)
  custom_parameters?: Record<unknown>;
}

model StreamStopParams {
  ...CallAddress;

  @doc("The `control_id` you set when you started the stream with `calling.stream`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}
