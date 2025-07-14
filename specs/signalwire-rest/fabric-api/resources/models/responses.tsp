import "./core.tsp";
import "../../_shared/const.tsp";
import "../../_shared/enums.tsp";
import "@typespec/http";


model ResourceResponse {
  @doc("Unique ID of the Resource.")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  @format("uuid")
  id: uuid;

  @doc("Unique ID of the Project.")
  @example("1313fe58-5e14-4c11-bbe7-6fdfa11fe780")
  @format("uuid")
  project_id: uuid;

  @doc("Display name of the Resource")
  @example("My Resource")
  display_name: string;

  @doc("Type of the Resource")
  @example(FabricResponseType.RelayApplication)
  type: FabricResponseType;

  @doc("Date and time when the resource was created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;

  @doc("Date and time when the resource was updated.")
  @example(UTC_TIME_EXAMPLE)
  updated_at: utcDateTime;

  @doc("Resource-specific data")
  data?: Record<unknown>;
}

