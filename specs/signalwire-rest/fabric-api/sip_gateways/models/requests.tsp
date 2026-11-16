import "../../../_globally_shared/enums.tsp";

// SIP Gateways accept a different set of encryption values from SIP Endpoints:
// `forbidden` instead of `default`.
enum SipGatewayEncryption {
  Required: "required",
  Optional: "optional",
  Forbidden: "forbidden",
}

model SipGatewayRequest {
  @doc("Display name for the SIP Gateway.")
  @example("My SIP Gateway")
  name: string;

  @doc("External SIP URI, including the `sip:` or `sips:` scheme. Must be unique within the project. SignalWire dials the URI exactly as configured, with one exception: when a call to one of your phone numbers routes to this gateway and the URI has no user part, SignalWire adds the dialed number, without the leading `+`, as the user part.")
  @example("sip:user2@domain.com")
  uri: string;

  @doc("Specifies the encryption requirement for the SIP connection.")
  @example(SipGatewayEncryption.Required)
  encryption: SipGatewayEncryption;

  @doc("List of supported SIP ciphers.")
  @minItems(1)
  @example(#[Ciphers.AEAD_AES_256_GCM_8, Ciphers.AES_256_CM_HMAC_SHA1_80])
  ciphers: Ciphers[];

  @doc("List of supported codecs for media transmission.")
  @minItems(1)
  @example(#[Codecs.OPUS])
  codecs: Codecs[];
}
