import "../../types";
import "../../_globally_shared/const.tsp";

using TypeSpec.Http;

namespace SignalWireAPI.Projects;

@doc("The unique identifier of a project or subproject.")
model ProjectPathID {
  @doc("The unique identifier of the project or subproject.")
  @example("8f14e45f-ceea-467d-9c2b-7a1d3a9b2c34")
  @path
  id: uuid;
}

@summary("Project")
@doc("A project or subproject within the caller's project tree.")
model Project {
  @doc("The unique identifier of the project.")
  @example("8f14e45f-ceea-467d-9c2b-7a1d3a9b2c34")
  id: uuid;

  @doc("The name of the project.")
  @example("Acme Staging")
  name: string;

  @doc("The unique identifier of the root project. `null` when this project is itself a root project.")
  @example("b3877739-5c7e-4d4f-9d1a-2f0c8c2f1a11")
  parent_project_id: uuid | null;

  @doc("`true` when this project is a subproject.")
  @example(true)
  subproject: boolean;

  @doc("The effective region preference for the project. Returned in all responses; it is not currently settable through this API.")
  @example("us-west")
  region_preference: string;

  @doc("When enabled, recordings created within the project require authentication to access.")
  @example(false)
  protect_recordings: boolean;

  @doc("When enabled, message media created within the project requires authentication to access.")
  @example(false)
  protect_message_media: boolean;

  @doc("When enabled, fax media created within the project requires authentication to access.")
  @example(false)
  protect_fax_media: boolean;

  @doc("When enabled, requests made to the project's webhooks and callbacks must use HTTPS.")
  @example(true)
  force_https_requests: boolean;

  @doc("The date and time when the project was created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;

  @doc("The date and time when the project was last updated.")
  @example(UTC_TIME_EXAMPLE)
  updated_at: utcDateTime;
}

@summary("Project with signing key")
@doc("""
  A project, including its `signing_key`.
  
  The `signing_key` is only returned when creating a subproject or rotating a project's
  signing key. It is not retrievable afterward, so capture it from the response.
  """)
model ProjectWithSigningKey is Project {
  @doc("""
    The project's signing key. Only returned on create and signing-key rotation responses;
    it cannot be retrieved through the API afterward.
    """)
  @example("PSK_4d8c2b1a9f3e7c6d5b4a3e2f1d0c9b8a")
  signing_key: string;
}

@doc("Pagination links for a list of projects.")
model ProjectPaginationLinks {
  @doc("The link to the current page.")
  @example("https://example-space.signalwire.com/api/projects?page_size=50")
  self: url;

  @doc("The link to the first page.")
  @example("https://example-space.signalwire.com/api/projects?page_size=50")
  first: url;

  @doc("The link to the next page. Only present when more results exist.")
  @example("https://example-space.signalwire.com/api/projects?page_size=50&page_number=1&page_token=PA8f14e45f")
  next?: url;

  @doc("The link to the previous page. Only present when a previous page exists.")
  @example("https://example-space.signalwire.com/api/projects?page_size=50&page_number=0&page_token=PA8f14e45f")
  prev?: url;
}
