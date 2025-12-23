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
    max_duration?: integer | SWMLVar;

    @doc("Comma-seperated string of codecs to offer.\n Valid codecs are: [`PCMU,PCMA,G722,G729,AMR-WB,OPUS,VP8,H264`]")
    codecs?: string;

    @doc("SIP authentication username")
    sip_auth_username?: string;

    @doc("SIP authentication password")
    sip_auth_password?: string;
  };
}
