import "./core.tsp";
import "../../addresses/models/responses.tsp";

using TypeSpec.Http;

@doc("Response containing a list of verified caller IDs.")
model VerifiedCallerIdListResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of verified caller IDs.")
  data?: VerifiedCallerId[];
}

@doc("Response containing a single verified caller ID.")
model VerifiedCallerIdResponse {
  ...VerifiedCallerId;
}
