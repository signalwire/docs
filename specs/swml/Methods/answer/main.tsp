import "@typespec/json-schema";
import "../../Shared/Types/main.tsp";
using TypeSpec.JsonSchema;

@summary("Answer object")
model Answer {
  @doc("Answer incoming call and set an optional maximum duration.")
  @summary("answer")
  answer: {
    @doc("Maximum duration in seconds for the call. Cannot be less than 7 seconds. Defaults to `14400` seconds (4 hours).")
    @minValue(7)
    @example(3600)
    max_duration?: integer | SWMLVar = 14400;

    @doc("Comma-separated string of codecs to offer. Valid codecs are: PCMU, PCMA, G722, G729, AMR-WB, OPUS, VP8, H264.")
    @example("PCMU,PCMA,OPUS")
    codecs?: string;

    @doc("Username to use for SIP authentication.")
    @example("user123")
    sip_auth_username?: string;

    @doc("Password to use for SIP authentication.")
    @example("securepassword")
    sip_auth_password?: string;
  };
}
