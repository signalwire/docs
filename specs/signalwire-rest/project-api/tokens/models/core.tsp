namespace SignalWireAPI.Project;

@doc("Valid permission types for API tokens.")
enum TokenPermission {
  calling,
  chat,
  datasphere,
  fax,
  management,
  messaging,
  numbers,
  pubsub,
  storage,
  tasking,
  video,
}

@summary("API Token Response")
model TokenResponse {
  @doc("The ID of the API Token.")
  @example("ea14556a-984f-11ee-b9d1-0242ac120002")
  id: uuid;

  @doc("The name of the API Token.")
  @example("John Doe's Token")
  name: string;

  @doc("The permissions enabled for this token.")
  @example(#[
    TokenPermission.calling,
    TokenPermission.fax,
    TokenPermission.messaging
  ])
  permissions: TokenPermission[];
}

@summary("Created API Token Response")
model CreateTokenResponse {
  ...TokenResponse;

  @doc("The API token that can be used along with the project ID for basic authentication. It is returned only in this response and cannot be retrieved again; store it securely.")
  @example("swapi_0123456789ab0123456789ab0123456789ab")
  token: string;
}
