@summary("Create resource SIP endpoint")
model ResourceSipEndpointAssignRequest {
  @doc("ID of the SIP Credential to assign the handler to. Use the `sip_endpoint.id` value from the SIP Credential's response, not the top-level resource `id`; a resource ID returns `404`.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  sip_endpoint_id: uuid;
}
