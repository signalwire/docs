import "../../../types/status-codes";

using Types.StatusCodes;

model CallFlowVersion {
  @doc("The unique identifier of the version.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  id: string;

  @doc("The version number.")
  @example("1.0.0")
  version: string;

  @doc("The creation timestamp.")
  @example("2023-01-01T12:00:00Z")
  created_at: string;

  @doc("The last update timestamp.")
  @example("2023-01-01T12:00:00Z")
  updated_at: string;

  @doc("Call Flow data structure")
  @example("{}")
  flow_data?: string;

  @doc("SWML document for this version")
  @example("{}")
  relayml?: string;
}

model CallFlowVersionListResponse {
  @doc("List of Call Flow Versions")
  @example(#[
    #{
      id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      version: "1.0.0",
      created_at: "2023-01-01T12:00:00Z",
      updated_at: "2023-01-01T12:00:00Z"
    }
  ])
  data: CallFlowVersion[];
}

model CallFlowVersionDeployResponse {
  @doc("The unique identifier of the deployed Call Flow Version.")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  id: string;

  @doc("The creation timestamp.")
  @example("2024-01-02T00:00:00Z")
  created_at: string;

  @doc("The last update timestamp.")
  @example("2024-01-02T00:00:00Z")
  updated_at: string;

  @doc("The document version.")
  @example(2)
  document_version: int32;

  @doc("Call Flow data structure")
  @example("{}")
  flow_data?: string;

  @doc("SWML document for this version")
  @example("{}")
  relayml?: string;
}