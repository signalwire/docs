import "./core.tsp";

model CallFlowResponse {
  @doc("Unique ID of the Call Flow.")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  id: uuid;

  @doc("Unique ID of the Project.")
  @example("1313fe58-5e14-4c11-bbe7-6fdfa11fe780")
  project_id: uuid;

  @doc("Display name of the Call Flow Fabric Resource")
  @example("Booking Assistant")
  display_name: string;

  @doc("Type of the Fabric Resource")
  @example("call_flow")
  type: string;

  @doc("Date and time when the resource was created.")
  @example(utcDateTime.fromISO("2024-01-02T00:00:00Z"))
  created_at: utcDateTime;

  @doc("Date and time when the resource was updated.")
  @example(utcDateTime.fromISO("2024-01-02T00:00:00Z"))
  updated_at: utcDateTime;

  @doc("Call Flow data.")
  call_flow: CallFlowWithID;
}


model CallFlowVersionResponse {
  @doc("Version number of the Call Flow")
  @example(1)
  version: int32;

  @doc("Date and time when the version was created.")
  @example(utcDateTime.fromISO("2024-01-02T00:00:00Z"))
  created_at: utcDateTime;

  @doc("Call Flow data structure")
  @example("{}")
  flow_data?: string;

  @doc("SWML document for this version")
  @example("{}")
  relayml?: string;
}