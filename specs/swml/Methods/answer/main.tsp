import "@typespec/json-schema";
import "../../Shared/Types/main.tsp";
using TypeSpec.JsonSchema;

@summary("Answer object")
model Answer {
  @doc("Answers an incoming call.")
  @summary("answer")
  answer: {
    @doc("Maximum time in seconds to wait for an answer. Cannot be less than `7` seconds. Defaults to 14400 seconds.")
    @minValue(7)
    @example(3600)
    max_duration?: integer | SWMLVar;

    @doc("Comma-seperated string of codecs to offer.\n Valid codecs are: [`PCMU,PCMA,G722,G729,AMR-WB,OPUS,VP8,H264`]")
    @example("PCMU,PCMA,OPUS")
    codecs?: string;

    @doc("SIP authentication username")
    @example("user123")
    sip_auth_username?: string;

    @doc("SIP authentication password")
    @example("securepassword")
    sip_auth_password?: string;
  };
}
