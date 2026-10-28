using TypeSpec.Http;

@doc("Request body for creating an API token.")
model CreateTokenRequest {
  @doc("The name representing the project API token.")
  @example("John Doe's Token")
  @minLength(1)
  name: string;

  @doc("""
    The permissions you would like to enable for this project API token. Valid permissions are: calling, chat, datasphere, fax, management, messaging, numbers, pubsub, storage, tasking, and video.

    In the form-encoded body, send each permission as a `permissions[]` key, for example `permissions[]=calling&permissions[]=messaging`. A `permissions` key without the brackets is rejected with `Permissions is not an array of strings`, even when you repeat it for each value.
    """)
  @example(#["calling", "fax", "messaging"])
  @minItems(1)
  permissions: string[];

  @doc("The unique identifier of the subproject you would like to create a token for. Must belong to the parent project.")
  @example("9a7fc048-984f-11ee-b9d1-0242ac120002")
  subproject_id?: uuid;
}

@doc("Request body for updating an API token.")
model UpdateTokenRequest {
  @doc("The name representing the project API token.")
  @example("John Doe's Token")
  @minLength(1)
  name: string;

  @doc("""
    The permissions you would like to enable for this project API token. If not provided, existing permissions are kept. Valid permissions are: calling, chat, datasphere, fax, management, messaging, numbers, pubsub, storage, tasking, and video.

    Send `permissions` as an array, even for a single permission. A single string, such as `"permissions": "calling"`, is rejected with `Permissions is not an array of strings`.
    """)
  @example(#["calling", "fax", "messaging"])
  permissions?: string[];
}
