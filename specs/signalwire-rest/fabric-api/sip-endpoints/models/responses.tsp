import "./core.tsp";

model SipEndpointResponse {
  @doc("Unique ID of the SIP Endpoint.")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  id: uuid;

  @doc("Unique ID of the Project.")
  @example("1313fe58-5e14-4c11-bbe7-6fdfa11fe780")
  project_id: uuid;

  @doc("Display name of the SIP Endpoint Fabric Resource")
  @example("Conference Room Phone")
  display_name: string;

  @doc("Type of the Fabric Resource")
  @example("sip_endpoint")
  type: string;

  @doc("Date and time when the resource was created.")
  @example(utcDateTime.fromISO("2024-01-02T00:00:00Z"))
  created_at: utcDateTime;

  @doc("Date and time when the resource was updated.")
  @example(utcDateTime.fromISO("2024-01-02T00:00:00Z"))
  updated_at: utcDateTime;

  @doc("SIP Endpoint data.")
  sip_endpoint: SipEndpointWithID;
}

model SipEndpointListResponse {
  data: SipEndpointResponse[];
}