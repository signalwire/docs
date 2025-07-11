import "./core.tsp";

model DomainApplicationResponse {...DomainApplication}

model DomainApplicationListResponse {
  @doc("List of Domain Applications")
  @example(#[
    #{
      id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      name: "My Domain Application",
      domain: "example.com",
      created_at: "2023-01-01T12:00:00Z",
      updated_at: "2023-01-01T12:00:00Z"
    }
  ])
  data: DomainApplicationResponse[];
}