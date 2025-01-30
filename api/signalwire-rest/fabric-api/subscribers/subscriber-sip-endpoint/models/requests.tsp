import "@typespec/openapi3";

using TypeSpec.OpenAPI;

model SubscriberSipEndpointBaseRequest {
  @doc("Username of the Sip Endpoint.")
  @example("justice-league")
  username: string;

  @doc("Password of the Sip Endpoint.")
  @example("hack-me-if-you-can")
  password: string;

  @doc("Caller ID of the Sip Endpoint.")
  @example("call-id-123")
  caller_id?: string;

  @doc("The Number to send as.")
  @example("+14632322867")
  send_as?: string;

  @doc("Ciphers of the Sip Endpoint.")
  ciphers?: CipherTypeArray;

  @doc("Codecs of the Sip Endpoint.")
  codecs?: CodecTypeArray;

  @doc("Encryption requirement of the Sip Endpoint.")
  @example(EncryptionType.Optional)
  encryption?: EncryptionType = EncryptionType.Default;
}

@summary("Create Subscriber SIP Endpoint with Call Handler")
model SubscriberSipEndpointCreateWithHandler extends SubscriberSipEndpointBaseRequest {

  @doc("Call handler of the Sip Endpoint.")
  @example(CallHandlerPassthroughType.BlockPstn)
  call_handler?: CallHandlerPassthroughType;

}

@summary("Create Subscriber SIP Endpoint with Resource ID")
model SubscriberSipEndpointCreateWithResourceId extends SubscriberSipEndpointBaseRequest {
  @doc("Unique ID of the Calling Handler Resource.")
  @example("f7078ea7-dc79-4763-96f6-725bf5829097")
  calling_handler_resource_id?: uuid
}

@summary("Update Subscriber SIP Endpoint with Call Handler")
model SubscriberSipEndpointUpdateWithHandler extends SubscriberSipEndpointBaseRequest {

  @doc("Call handler of the Sip Endpoint.")
  @example(CallHandlerPassthroughType.BlockPstn)
  call_handler?: CallHandlerPassthroughType;

}

@summary("Update Subscriber SIP Endpoint with Resource ID")
model SubscriberSipEndpointUpdateWithResourceId extends SubscriberSipEndpointBaseRequest {
  @doc("Unique ID of the Calling Handler Resource.")
  @example("f7078ea7-dc79-4763-96f6-725bf5829097")
  calling_handler_resource_id?: uuid
}

@oneOf
union SubscriberSipEndpointCreateRequest {
  
  SubscriberSipEndpointCreateWithHandler,
  SubscriberSipEndpointCreateWithResourceId
}

@oneOf
union SubscriberSipEndpointUpdateRequest {

  SubscriberSipEndpointUpdateWithHandler,
  SubscriberSipEndpointUpdateWithResourceId
}


