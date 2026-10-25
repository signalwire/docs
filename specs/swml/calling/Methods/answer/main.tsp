import "@typespec/json-schema";
import "../../../Shared/Types/main.tsp";
using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("answer Method")
model Answer {
  @doc("Answer incoming call and set an optional maximum duration.")
  @summary("answer")
  answer: {
    @doc("Maximum duration in seconds for the call. Defaults to `14400` seconds (4 hours).")
    @example(3600)
    max_duration?: integer | SWMLVar = 14400;

    @doc("""
      Codecs to offer, as a comma-separated string or an array of strings with one codec per entry.
      Each array entry can also be a SWML variable reference that is resolved when the method runs.
      Valid codecs depend on the call type: phone calls accept PCMU, PCMA, G722, G729 and AMR-WB;
      SIP and WebRTC calls also accept OPUS, VP8 and H264.
      If the codecs are not valid for the call type, they are not applied and the method reports an error.
      """)
    @example("PCMU,PCMA,OPUS")
    codecs?: string | string[];

    @doc("""
      Username to use for SIP authentication challenges.
      Applied only together with a `password` that is not empty after variable expansion.
      """)
    @example("user123")
    username?: string;

    @doc("""
      Password to use for SIP authentication challenges.
      When it is not empty after variable expansion, it is applied together with `username`.
      """)
    @example("securepassword")
    password?: string;
  };
}
