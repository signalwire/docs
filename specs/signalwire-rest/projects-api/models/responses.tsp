import "./core.tsp";
import "@typespec/http";

using TypeSpec.Http;

namespace SignalWireAPI.Projects;

@doc("A page of projects.")
model ProjectListResponse {
  @doc("Pagination links for the list of projects.")
  links: ProjectPaginationLinks;

  @doc("The projects on this page.")
  data: Project[];
}

@doc("A single project.")
model ProjectResponse {
  ...Project;
}
