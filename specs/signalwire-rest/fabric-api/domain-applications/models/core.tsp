import "@typespec/http";

using TypeSpec.Http;

model DomainApplicationPathID {
  @doc("The unique identifier of the Resource.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: string;
}

model DomainApplication {
  @doc("The unique identifier of the domain application.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  id: string;

  @doc("The name of the domain application.")
  @example("My Domain Application")
  name: string;

  @doc("The domain for the application.")
  @example("example.com")
  domain: string;

  @doc("The creation timestamp.")
  @example("2023-01-01T12:00:00Z")
  created_at: string;

  @doc("The last update timestamp.")
  @example("2023-01-01T12:00:00Z")
  updated_at: string;
}