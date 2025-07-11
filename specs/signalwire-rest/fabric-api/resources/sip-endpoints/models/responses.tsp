import "./core.tsp";

model ResourceSipEndpointResponse {...ResourceSipEndpoint}

model ResourceSipEndpointListResponse {
  @doc("List of Resource SIP Endpoints")
  data: ResourceSipEndpointResponse[];
}