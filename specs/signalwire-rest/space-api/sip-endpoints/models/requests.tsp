import "./core.tsp";

using TypeSpec.Http;

@doc("Request body for creating a SIP endpoint.")
model CreateSipEndpointRequest {
  @doc("The username for the SIP endpoint.")
  @example("user123")
  username: string;

  @doc("The password for the SIP endpoint.")
  password: string;

  @doc("The caller ID for the SIP endpoint.")
  @example("+15551234567")
  caller_id?: string;

  @doc("The codecs enabled for the SIP endpoint.")
  codecs?: string[];

  @doc("The ciphers enabled for the SIP endpoint.")
  ciphers?: string[];

  @doc("The encryption setting for the SIP endpoint.")
  encryption?: "required" | "optional" | "default";

  @doc("The call handler setting for the SIP endpoint.")
  call_handler?: "default" | "passthrough" | "block-pstn" | "resource";

  @doc("The resource ID for call handling when call_handler is 'resource'.")
  @format("uuid")
  calling_handler_resource_id?: uuid;

  @doc("The send_as value for the SIP endpoint.")
  @example("Support")
  send_as?: string;
}

@doc("Request body for updating a SIP endpoint.")
model UpdateSipEndpointRequest {
  @doc("The username for the SIP endpoint.")
  @example("user123")
  username?: string;

  @doc("The password for the SIP endpoint.")
  password?: string;

  @doc("The caller ID for the SIP endpoint.")
  @example("+15551234567")
  caller_id?: string;

  @doc("The codecs enabled for the SIP endpoint.")
  codecs?: string[];

  @doc("The ciphers enabled for the SIP endpoint.")
  ciphers?: string[];

  @doc("The encryption setting for the SIP endpoint.")
  encryption?: "required" | "optional" | "default";

  @doc("The call handler setting for the SIP endpoint.")
  call_handler?: "default" | "passthrough" | "block-pstn" | "resource";

  @doc("The resource ID for call handling when call_handler is 'resource'.")
  @format("uuid")
  calling_handler_resource_id?: uuid;

  @doc("The send_as value for the SIP endpoint.")
  @example("Support")
  send_as?: string;
}
