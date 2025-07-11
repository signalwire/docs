@summary("Create domain application")
model DomainApplicationCreateRequest {
  @doc("The name of the domain application.")
  @example("My Domain Application")
  name: string;

  @doc("The domain for the application.")
  @example("example.com")
  domain: string;
}