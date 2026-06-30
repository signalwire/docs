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
  control_id: string;

  @doc("WebSocket URI (`wss://`) to stream audio to.")
  url: url;

  @doc("A friendly name for the stream.")
  name?: string;

  @doc("Codec for the streamed audio. Default is the call's native codec.")
  codec?: string;

  @doc("""
    Which audio track to stream. `inbound_track` (what the caller says),
    `outbound_track` (what the caller hears), or `both_tracks`. Default
    `inbound_track`.
    """)
  track?: StreamTrack = "inbound_track";

  @doc("HTTP(s) URL to POST stream status events to.")
  status_url?: url;

  @doc("HTTP method for `status_url`. Default `POST`.")
  status_url_method?: "GET" | "POST" = "POST";

  @doc("Bearer token to include in the WebSocket connection.")
  authorization_bearer_token?: string;

  @doc("""
    JSON object of custom key-value pairs sent to the WebSocket endpoint on
    connect.
    """)
  custom_parameters?: Record<unknown>;
}

model StreamStopParams {
  ...CallAddress;

  @doc("The stream `control_id` assigned in `calling.stream`.")
  control_id: string;
}
