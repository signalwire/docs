model SipGatewayCreateRequest {
  @doc("Display name for the SIP Gateway.")
  @example("My SIP Gateway")
  name: string;

  @doc("External SIP URI.")
  @example("user2@domain.com")
  uri: string;

  @doc("Specifies the encryption requirement for the SIP connection.")
  @example("required")
  encryption: "optional" | "required" | "disabled";

  @doc("List of supported SIP ciphers.")
  @example(#[ "AEAD_AES_256_GCM_8", "AES_256_CM_HMAC_SHA1_80" ])
  ciphers: string[];

  @doc("List of supported codecs for media transmission.")
  @example(#["OPUS"])
  codecs: string[];
}

alias SipGatewayUpdateRequest = SipGatewayCreateRequest;
