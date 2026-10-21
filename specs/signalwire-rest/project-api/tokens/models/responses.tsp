import "@typespec/http";
import "./core.tsp";

using TypeSpec.Http;

namespace SignalWireAPI.Project;

@doc("A page of API tokens.")
model TokenListResponse {
  @doc("Pagination links for the list of tokens.")
  links: TokenPaginationLinks;

  @doc("The tokens on this page. Token values are never included.")
  data: TokenResponse[];
}

// Note: Error models are now defined in errors.tsp using the shared StatusCode422 pattern
