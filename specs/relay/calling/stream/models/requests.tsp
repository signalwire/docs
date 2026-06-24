import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// calling.stream
//
// Flat params (no nested tap/device union). NOTE: the result echoes `node_id`,
// unlike sibling methods that echo `call_id`.
// ═════════════════════════════════════════════════════════════════════════════

/** Which audio track to stream. */
union StreamTrack {
  "inbound_track",
  "outbound_track",
  "both_tracks",
}

model StreamParams {
  ...CallAddress;

  /** Identifier used to control the active stream. */
  control_id: string;

  /** WebSocket URI (`wss://`) to stream audio to. */
  url: url;

  /** A friendly name for the stream. */
  name?: string;

  /** Codec for the streamed audio. Default is the call's native codec. */
  codec?: string;

  /**
   * Which audio track to stream. `inbound_track` (what the caller says),
   * `outbound_track` (what the caller hears), or `both_tracks`. Default
   * `inbound_track`.
   */
  track?: StreamTrack = "inbound_track";

  /** HTTP(s) URL to POST stream status events to. */
  status_url?: url;

  /** HTTP method for `status_url`. Default `POST`. */
  status_url_method?: "GET" | "POST" = "POST";

  /** Bearer token to include in the WebSocket connection. */
  authorization_bearer_token?: string;

  /**
   * JSON object of custom key-value pairs sent to the WebSocket endpoint on
   * connect.
   */
  custom_parameters?: Record<unknown>;
}

model StreamStopParams {
  ...CallAddress;

  /** The stream `control_id` assigned in `calling.stream`. */
  control_id: string;
}
