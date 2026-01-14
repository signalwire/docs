import "../../../types";

using TypeSpec.Http;
using Types;

model SipEndpointPathID {
  @doc("Unique ID of the SIP endpoint.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid;
}

@doc("SIP endpoint model.")
model SipEndpoint {
  @doc("The unique identifier of the SIP endpoint.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The username for the SIP endpoint.")
  @example("user123")
  username: string;

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

  @doc("Timestamp when the SIP endpoint was created.")
  created_at?: utcDateTime;

  @doc("Timestamp when the SIP endpoint was last updated.")
  updated_at?: utcDateTime;
}
