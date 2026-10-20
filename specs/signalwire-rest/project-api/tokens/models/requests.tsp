import "@typespec/http";
import "./core.tsp";

using TypeSpec.Http;

namespace SignalWireAPI.Project;


@doc("Request body for creating a new API Token.")
model CreateTokenRequest {
  @doc("The name representing the API token.")
  @example("John Doe's Token")
  name: string;

  @doc("The permissions you would like to enable for this token. Valid permissions are calling, chat, datasphere, fax, management, messaging, numbers, pubsub, storage, tasking, and video")
  @example(#[
    TokenPermission.calling,
    TokenPermission.fax,
    TokenPermission.messaging
  ])
  @minItems(1)
  permissions: TokenPermission[];

  @doc("""
    Personal access token only. The project to create the token for. Required with a
    Personal access token and must name a project the token holder can reach
    (`invalid_project_id`). Ignored with a project API token, which creates the token on
    its own project.
    """)
  @example("4d5e6f70-8192-4a3b-8c4d-5e6f70819234")
  project_id?: uuid;

  @doc("The unique identifier of the subproject you would like to create a token for. The subproject passed must be a child of the project used to authenticate the request, or of `project_id` when authenticating with a Personal access token.")
  @example("9a7fc048-984f-11ee-b9d1-0242ac120002")
  subproject_id?: uuid;
}

@doc("Request body for updating an API Token.")
model UpdateTokenRequest {
  @doc("The name representing the API token.")
  @example("John Doe's Token")
  name?: string;

  @doc("The permissions you would like to enable for this token. Valid permissions are calling, chat, datasphere, fax, management, messaging, numbers, pubsub, storage, tasking, and video")
  @example(#[
    TokenPermission.calling,
    TokenPermission.fax,
    TokenPermission.messaging
  ])
  permissions?: TokenPermission[];
}

@doc("Query parameters for listing API tokens.")
model ListTokensQuery {
  @doc("Only return tokens that belong to this project. A project the caller cannot reach returns an empty list rather than an error.")
  @query
  @example("4d5e6f70-8192-4a3b-8c4d-5e6f70819234")
  project_id?: uuid;

  @doc("The number of results per page.")
  @query
  @minValue(1)
  @maxValue(1000)
  page_size?: int32 = 50;

  @doc("Cursor token for paging, taken from the `next` or `prev` link of a previous response.")
  @query
  page_token?: string;

  @doc("The page index. A value above 0 requires `page_token`.")
  @query
  @minValue(0)
  page_number?: int32 = 0;
}
