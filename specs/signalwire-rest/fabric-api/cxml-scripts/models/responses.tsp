import "./core.tsp";

model CXMLScriptResponse {
  @doc("Unique ID of the cXML Script.")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  @format("uuid")
  id: uuid;

  @doc("Unique ID of the Project.")
  @example("1313fe58-5e14-4c11-bbe7-6fdfa11fe780")
  @format("uuid")
  project_id: uuid;

  @doc("Display name of the cXML Script Fabric Resource")
  @example("Reception Script")
  name: string;

  @doc("Type of the Fabric Resource")
  @example("cxml_script")
  type: "cxml_script";

  @doc("Date and time when the resource was created.")
  @example(utcDateTime.fromISO("2024-01-02T00:00:00Z"))
  created_at: utcDateTime;

  @doc("Date and time when the resource was updated.")
  @example(utcDateTime.fromISO("2024-01-02T00:00:00Z"))
  updated_at: utcDateTime;

  @doc("cXML Script data.")
  cxml_script: CXMLScriptWithID;
}

