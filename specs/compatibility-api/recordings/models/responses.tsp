import "./core.tsp";
import "../../_shared/pagination.tsp";

using TypeSpec.Http;

@doc("Response containing a list of recordings.")
model RecordingListResponse {
  ...Pagination;

  @doc("The name of object.")
  @example("0")
  end?: string;

  @doc("The name of object.")
  @example("0")
  start?: string;

  @doc("The unique identifier for this account.")
  @example("b720796a0-8ee9-4350-83bd-2d07a3121f1e")
  account_sid?: string;

  @doc("List of recordings.")
  recordings?: Recording[];
}

@doc("Response containing a single recording.")
model RecordingResponse {
  ...Recording;
}
