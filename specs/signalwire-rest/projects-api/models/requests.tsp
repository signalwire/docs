import "./core.tsp";

using TypeSpec.Http;

namespace SignalWireAPI.Projects;

@doc("Request body for creating a subproject.")
model CreateProjectRequest {
  @doc("The name of the subproject.")
  @maxLength(250)
  @example("Acme Staging")
  name: string;

  @doc("When enabled, recordings created within the project require authentication to access.")
  @example(true)
  protect_recordings?: boolean;

  @doc("When enabled, message media created within the project requires authentication to access.")
  @example(false)
  protect_message_media?: boolean;

  @doc("When enabled, fax media created within the project requires authentication to access.")
  @example(false)
  protect_fax_media?: boolean;

  @doc("When enabled, requests made to the project's webhooks and callbacks must use HTTPS.")
  @example(true)
  force_https_requests?: boolean;
}

@doc("Request body for updating a project's name and settings.")
model UpdateProjectRequest {
  @doc("The name of the project.")
  @maxLength(250)
  @example("Acme Staging (EU)")
  name: string;

  @doc("When enabled, recordings created within the project require authentication to access.")
  @example(true)
  protect_recordings?: boolean;

  @doc("When enabled, message media created within the project requires authentication to access.")
  @example(true)
  protect_message_media?: boolean;

  @doc("When enabled, fax media created within the project requires authentication to access.")
  @example(false)
  protect_fax_media?: boolean;

  @doc("When enabled, requests made to the project's webhooks and callbacks must use HTTPS.")
  @example(true)
  force_https_requests?: boolean;
}

@doc("Query parameters for listing projects.")
model ListProjectsQuery {
  @doc("Filter projects by name.")
  @query
  name?: string;

  @doc("The number of results per page.")
  @query
  @minValue(1)
  @maxValue(1000)
  page_size?: int32 = 50;

  @doc("Cursor token for paging, taken from the `links` in a previous response.")
  @query
  page_token?: string;

  @doc("The page index, used together with `page_token`.")
  @query
  @minValue(0)
  page_number?: int32 = 0;
}
