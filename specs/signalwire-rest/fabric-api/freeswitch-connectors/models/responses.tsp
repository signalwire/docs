import "./core.tsp";
import "../../_shared/enums.tsp";
import "../../_shared/const.tsp";

model FreeswitchConnectorResponse {
  @doc("Unique ID of the FreeSWITCH Connector.")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  @format("uuid")
  id: uuid;

  @doc("Unique ID of the Project.")
  @example("1313fe58-5e14-4c11-bbe7-6fdfa11fe780")
  @format("uuid")
  project_id: uuid;

  @doc("Display name of the FreeSWITCH Connector Fabric Resource")
  @example("Main FreeSWITCH Server")
  display_name: string;

  @doc("Type of the Fabric Resource")
  @example(FabricResponseType.FreeswitchConnector)
  type: FabricResponseType.FreeswitchConnector;

  @doc("Date and time when the resource was created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;

  @doc("Date and time when the resource was updated.")
  @example(UTC_TIME_EXAMPLE)
  updated_at: utcDateTime;

  @doc("FreeSWITCH Connector data.")
  freeswitch_connector: FreeswitchConnectorWithID;
}

model FreeswitchConnectorListResponse {
  data: FreeswitchConnectorResponse[];
}