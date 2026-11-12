import "./core.tsp";

using TypeSpec.Http;

@doc("Request body for updating the SIP profile.")
model UpdateSipProfileRequest {
  @doc("String representing the domain_identifier portion of the profile. Must be unique across your project.")
  @example("example")
  domain_identifier?: string;

  @doc("A list of codecs this profile will support. Currently supported values are: OPUS, G722, PCMU, PCMA, VP8, H264.")
  default_codecs?: string[];

  @doc("A list of encryption ciphers this profile will support. Currently supported values are: AEAD_AES_256_GCM_8, AES_256_CM_HMAC_SHA1_80, AES_CM_128_HMAC_SHA1_80, AES_256_CM_HMAC_SHA1_32, AES_CM_128_HMAC_SHA1_32.")
  default_ciphers?: string[];

  @doc("A string representing whether connections to an endpoint that uses this profile require encryption or if encryption is optional. Encryption will always be used if possible. Possible values are required or optional.")
  @example("optional")
  default_encryption?: "required" | "optional";

  @doc("""
    How calls placed by a SIP endpoint whose `call_handler` is `default` are handled. `passthrough`
    connects the call to the dialed destination, including PSTN numbers, and `block-pstn` does the same
    but blocks calls to PSTN numbers. Omit it to keep the current value; `null` is rejected with `422`.
    """)
  @example(SipProfileOutboundPolicy.passthrough)
  default_outbound_policy?: SipProfileOutboundPolicy;

  @doc("""
    The E.164 number SIP endpoints that use this profile send as their From number when dialing PSTN
    phone numbers. It must be a number purchased or verified in the project. Send `null` or an empty
    string to clear it so that a purchased or verified number from the project is chosen. The value
    `random`, which [Get SIP profile](/docs/apis/rest/sip-profile/retrieve-sip-profile) returns when no
    number is set, is not accepted here and returns `422`; to keep the current setting, omit the field.
    """)
  @example("+15551234567")
  default_send_as?: string | null;
}
