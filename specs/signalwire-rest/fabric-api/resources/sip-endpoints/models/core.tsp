import "@typespec/http";

using TypeSpec.Http;

model ResourceSipEndpointPathID {
  @doc("The unique identifier of the Resource.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid;
}

model ResourceSipEndpoint {
  @doc("The unique identifier of the SIP endpoint.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The username for the SIP endpoint.")
  @example("sip_user")
  username: string;

  @doc("The SIP address of the endpoint.")
  @example("sip:user@example.com")
  address: string;

  @doc("The creation timestamp.")
  @example("2023-01-01T12:00:00Z")
  created_at: string;

  @doc("The last update timestamp.")
  @example("2023-01-01T12:00:00Z")
  updated_at: string;
}