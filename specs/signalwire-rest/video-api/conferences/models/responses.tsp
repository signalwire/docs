import "@typespec/http";
import "./core.tsp";
import "../../_shared/models.tsp";

using TypeSpec.Http;

namespace SignalWireAPI.Video;


@doc("Conference response wrapper.")
model ConferenceResponse {
  @statusCode statusCode: 200;
  @body body: Conference;
}

@doc("List conferences response.")
model ListConferencesResponse {
  @doc("Pagination links.")
  links: PaginationLinks;

  @doc("List of conferences.")
  data: Conference[];
}
