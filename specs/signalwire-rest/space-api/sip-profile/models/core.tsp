import "../../../types";

using TypeSpec.Http;
using Types;

@doc("SIP profile model.")
model SipProfile {
  @doc("The default codecs for SIP endpoints.")
  default_codecs?: string[];

  @doc("The default ciphers for SIP endpoints.")
  default_ciphers?: string[];

  @doc("The default encryption setting for SIP endpoints.")
  default_encryption?: "required" | "optional" | "default";

  @doc("The default call handler setting for SIP endpoints.")
  default_call_handler?: "default" | "passthrough" | "block-pstn" | "resource";

  @doc("The default resource ID for call handling.")
  @format("uuid")
  default_calling_handler_resource_id?: uuid;
}
