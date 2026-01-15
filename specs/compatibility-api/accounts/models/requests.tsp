using TypeSpec.Http;

@doc("Request body for creating a subproject.")
model CreateSubprojectRequest {
  @doc("The name of the Project, up to 250 characters long.")
  @example("My Project")
  FriendlyName: string;
}

@doc("Request body for updating an account.")
model UpdateAccountRequest {
  @doc("The name of the Project, up to 250 characters long.")
  @example("My Project")
  FriendlyName?: string;
}
