import "../../Shared/Types/main.tsp";

@summary("Tap object")
model Tap {
  @summary("tap")
  @doc("Start background call tap. Media is streamed over Websocket or RTP to customer controlled URI.")
  tap: {
    @doc("Destination of the tap media stream.")
    uri: string;

    @doc("Identifier for this tap to use with `stop_tap`.")
    control_id?: string;

    @doc("""
      Direction of the audio to tap:
          `speak` for what party says,
          `listen` for what party hears,
          `both` for what party hears and says.
          Default is `speak`
      """)
    direction?: "speak" | "listen" | "both";

    @doc("""
      Codec to use for the tap media stream.
      Possible Values: [`PCMU`, `PCMA`]
      Default is `PCMU`
      """)
    codec?: "PCMU" | "PCMA";

    @doc("""
      If `uri` is a `rtp://` this will set the packetization time of the media in milliseconds.
      Default is `20` miliseconds.
      """)
    rtp_ptime?: integer | SWMLVar;

    @doc("http or https URL to deliver tap status events")
    status_url?: url;
  };
}
