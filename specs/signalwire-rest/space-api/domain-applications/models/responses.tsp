import "./core.tsp";
import "../../addresses/models/responses.tsp";

using TypeSpec.Http;

@doc("Response containing a list of domain applications.")
model DomainApplicationListResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of domain applications.")
  data?: DomainApplication[];
}

@doc("Response containing a single domain application.")
model DomainApplicationResponse {
  ...DomainApplication;
}
