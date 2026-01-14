import "@typespec/http";
import "../_shared/models.tsp";
import "../room-sessions/models.tsp";

using TypeSpec.Http;

@doc("List room recordings response.")
model ListRoomRecordingsResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of room recordings.")
  data?: RoomRecordingResponse[];
}
