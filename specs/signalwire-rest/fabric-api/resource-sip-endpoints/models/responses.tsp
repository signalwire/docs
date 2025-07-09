import "./core.tsp";

model ResourceSipEndpointResponse {...ResourceSipEndpoint}

model ResourceSipEndpointListResponse {
  @doc("List of Resource SIP Endpoints")
  @example(#[
    #{
      id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      username: "sip_user",
      address: "sip:user@example.com",
      created_at: "2023-01-01T12:00:00Z",
      updated_at: "2023-01-01T12:00:00Z"
    }
  ])
  data: ResourceSipEndpointResponse[];
}