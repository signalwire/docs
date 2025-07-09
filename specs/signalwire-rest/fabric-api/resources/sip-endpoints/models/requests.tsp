@summary("Create resource SIP endpoint")
model ResourceSipEndpointCreateRequest {
  @doc("The username for the SIP endpoint.")
  @example("sip_user")
  username: string;

  @doc("The password for the SIP endpoint.")
  @example("secure_password")
  password?: string;
}