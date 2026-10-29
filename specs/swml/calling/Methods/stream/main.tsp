import "../../../Shared/Types/main.tsp";

namespace SWML.Calling;

@summary("stream Method")
model Stream {
  @summary("stream")
  @doc("""
    Start a background audio stream from the call to a WebSocket endpoint. Runs alongside the call as an independent operation.
    For an inbound call that has not been answered and is not ending, the method attempts to answer it before starting the stream.
    """)
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
          Accepts a SWML variable reference that resolves to one of these values.
      """)
    @example("both_tracks")
    track?:
      | "inbound_track"
      | "outbound_track"
      | "both_tracks"
      | SWMLVar = "inbound_track";

    @doc("""
      Codec for the streamed audio. Supported values: `PCMU` (8 kHz G.711 µ-law),
      `L16@16000h` (16-bit linear PCM at 16 kHz), and `L16@24000h` (16-bit linear PCM at 24 kHz).
      Default is `"PCMU"`.
      """)
    @example("L16@16000h")
    codec?: string = "PCMU";

    @doc("""
      HTTP or HTTPS URL to deliver stream status events.
      Accepts a SWML variable reference that resolves to an HTTP or HTTPS URL.
      """)
    @example("https://example.com/stream-status")
    status_url?: url | SWMLVar;

    @doc("""
      Has no effect on stream status callbacks: SignalWire always sends `calling.call.stream` events to `status_url` with POST, whatever this is set to, so you can leave it unset.
      Possible Values: [`GET`, `POST`]. Default is `"POST"`.
      Accepts a SWML variable reference that resolves to one of these values.
      """)
    @example("POST")
    status_url_method?: "GET" | "POST" | SWMLVar = "POST";

    @doc("Bearer token sent as an `Authorization` header during the WebSocket handshake.")
    @example("my-secret-token")
    authorization_bearer_token?: string;

    @doc("Custom key-value pairs sent to the WebSocket endpoint in the start message.")
    custom_parameters?: TypeSpec.Record<string>;
  };
}
