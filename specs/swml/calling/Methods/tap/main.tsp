import "@typespec/json-schema";
import "../../../Shared/Types/main.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("Tap RTP packetization time")
@doc("RTP packetization time in milliseconds: a multiple of 10 from 10 to 120.")
@minValue(10)
@maxValue(120)
@multipleOf(10)
scalar TapRtpPtime extends integer;

@summary("tap Method")
model Tap {
  @summary("tap")
  @doc("""
    Start background call tap. Media is streamed over Websocket or RTP to customer controlled URI.
    For an inbound call that has not been answered and is not ending, the method attempts to answer it before starting the tap.
    """)
  tap: {
    @doc("""
      Destination of the tap media stream: `rtp://IP:port`, `ws://example.com`, or `wss://example.com`.
      For RTP, the address must be a public IPv4 address followed by a port; hostnames, private addresses, and IPv6 addresses are not accepted.
      """)
    @example("wss://example.com/tap-stream")
    uri: string;

    @doc("""
      Identifier for this tap to use with `stop_tap`.
      If not set, one is generated and stored in the `tap_control_id` variable.
      """)
    @example("tap_001")
    control_id?: string;

    @doc("""
      Direction of the audio to tap:
          `speak` for what party says,
          `listen` for what party hears,
          `both` for what party hears and says.
          Default is `"speak"`.
          Accepts a SWML variable reference that resolves to one of these values.
      """)
    @example("both")
    direction?: "speak" | "listen" | "both" | SWMLVar = "speak";

    @doc("""
      Codec to use for the tap media stream.
      Possible Values: [`PCMU`, `PCMA`]
      Default is `"PCMU"`.
      Accepts a SWML variable reference that resolves to one of these values.
      """)
    @example("PCMU")
    codec?: "PCMU" | "PCMA" | SWMLVar = "PCMU";

    @doc("""
      If `uri` is a `rtp://` this will set the packetization time of the media in milliseconds.
      Must be a multiple of 10 from `10` to `120`. A literal value is validated even when `uri` is a WebSocket URI, where it has no effect.
      Default is `20` milliseconds.
      """)
    @example(20)
    rtp_ptime?: TapRtpPtime | SWMLVar = 20;

    @doc("http or https URL to deliver tap status events")
    @example("https://example.com/tap-status")
    status_url?: url;
  };
}
