import "./core.tsp";
import "../../_shared/pagination.tsp";

using TypeSpec.Http;

@doc("Response containing a list of applications.")
model ApplicationListResponse {
  @doc("Pagination links.")
  links?: Pagination;

  @doc("List of applications.")
  applications?: Application[];
}

@doc("Response containing a single application.")
model ApplicationResponse {
  ...Application;
}
