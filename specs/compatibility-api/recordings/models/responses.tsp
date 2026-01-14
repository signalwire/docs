import "./core.tsp";
import "../../_shared/pagination.tsp";

using TypeSpec.Http;

@doc("Response containing a list of recordings.")
model RecordingListResponse {
  ...Pagination;

  @doc("List of recordings.")
  recordings?: Recording[];
}

@doc("Response containing a single recording.")
model RecordingResponse {
  ...Recording;
}
