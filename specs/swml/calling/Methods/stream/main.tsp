import "../../../Shared/Types/main.tsp";

namespace SWML.Calling;

@summary("stream Method")
model Stream {
  @summary("stream")
  @doc("Start a background audio stream from the call to a WebSocket endpoint. Runs alongside the call as an independent operation.")
  stream: {
    @doc("Secure WebSocket URI (wss://) to stream the call audio to.")
    @example("wss://example.com/audio-stream")
    url: string;

    @doc("Identifier for this stream to use with `stop_stream`. If not set, one is generated and stored in the `stream_control_id` variable.")
    @example("stream_001")
    control_id?: string;

    @doc("Friendly name for the stream.")
    @example("my-stream")
    name?: string;

    @doc("""
      Audio track to stream:
          `inbound_track` for what the caller says,
          `outbound_track` for what the caller hears,
          `both_tracks` for both.
          Default is `"inbound_track"`.
      """)
    @example("both_tracks")
    track?: "inbound_track" | "outbound_track" | "both_tracks" = "inbound_track";

    @doc("""
      Codec to use for the streamed audio. Freeform and endpoint-specific.
      Common values include `PCMU`, `PCMA`, and `OPUS`.
      """)
    @example("PCMU")
    codec?: string;

    @doc("HTTP or HTTPS URL to deliver stream status events.")
    @example("https://example.com/stream-status")
    status_url?: url;

    @doc("""
      HTTP method used to deliver stream status events to `status_url`.
      Possible Values: [`GET`, `POST`]. Default is `"POST"`.
      """)
    @example("POST")
    status_url_method?: "GET" | "POST" = "POST";

    @doc("Bearer token sent as an `Authorization` header during the WebSocket handshake.")
    @example("my-secret-token")
    authorization_bearer_token?: string;

    @doc("Custom key-value pairs sent to the WebSocket endpoint in the start message.")
    custom_parameters?: TypeSpec.Record<string>;
  };
}
