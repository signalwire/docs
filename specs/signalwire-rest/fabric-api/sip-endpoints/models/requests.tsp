import "./core.tsp";
import "../../../_globally_shared/enums.tsp";

model SipEndpointCreateRequest {
  @doc("The username of the Sip Endpoint")
  @example("User")
  username: string;

  @doc("The password the SIP device uses to register with this Sip Endpoint.")
  @example("Str0ng-Passw0rd")
  password: string;

  @doc("The caller ID that will showup when dialing from this Sip Endpoint")
  @example("123456789")
  caller_id?: string;

  @doc("The Sip username that will show up on the calle's side. Overrides the username.")
  @example("Support")
  send_as?: string;

  @doc("Ciphers that can be enabled for calls on this Sip Endpoint.")
  @example(#[Ciphers.AEAD_AES_256_GCM_8, Ciphers.AES_256_CM_HMAC_SHA1_32])
  ciphers?: Ciphers[];

  @doc("Codecs that can be enabled for calls on this Sip Endpoint.")
  @example(#[Codecs.G722, Codecs.PCMA, Codecs.PCMU, Codecs.VP8])
  codecs?: Codecs[];

  @doc("The set encryption type on the Sip Endpoint.")
  @example(Encryption.Default)
  encryption?: Encryption = Encryption.Default;

  @doc(callHandlerDescription)
  @example(CallHandlerType.Default)
  call_handler?: CallHandlerType = CallHandlerType.Default;

  @doc("The ID of the resource that handles outbound calls. Required when `call_handler` is `resource`.")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  calling_handler_resource_id?: uuid;
}

model SipEndpointUpdateRequest {
  @doc("The username of the Sip Endpoint")
  @example("User")
  username?: string;

  @doc("A new password for the Sip Endpoint. Omit to keep the current password.")
  @example("Str0ng-Passw0rd")
  password?: string;

  @doc("The caller ID that will showup when dialing from this Sip Endpoint")
  @example("123456789")
  caller_id?: string;

  @doc("The Sip username that will show up on the calle's side. Overrides the username.")
  @example("Support")
  send_as?: string;

  @doc("Ciphers that can be enabled for calls on this Sip Endpoint.")
  @example(#[Ciphers.AEAD_AES_256_GCM_8, Ciphers.AES_256_CM_HMAC_SHA1_32])
  ciphers?: Ciphers[];

  @doc("Codecs that can be enabled for calls on this Sip Endpoint.")
  @example(#[Codecs.G722, Codecs.PCMA, Codecs.PCMU, Codecs.VP8])
  codecs?: Codecs[];

  @doc("The set encryption type on the Sip Endpoint. Omit to keep the current setting.")
  @example(Encryption.Default)
  encryption?: Encryption;

  @doc(callHandlerDescription)
  @example(CallHandlerType.Default)
  call_handler?: CallHandlerType;

  @doc("The ID of the resource that handles outbound calls. Required when `call_handler` is `resource`.")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  calling_handler_resource_id?: uuid | null;
}
