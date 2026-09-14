import "./core.tsp";

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
    Personal Access Token only. The project to create the token for. Required with a
    Personal Access Token and must name a project the token holder can reach
    (`invalid_project_id`). Ignored with a project API token, which creates the token on
    its own project.
    """)
  @example("4d5e6f70-8192-4a3b-8c4d-5e6f70819234")
  project_id?: uuid;

  @doc("The unique identifier of the subproject you would like to create a token for. The subproject passed must be a child of the project used to authenticate the request, or of `project_id` when authenticating with a Personal Access Token.")
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
