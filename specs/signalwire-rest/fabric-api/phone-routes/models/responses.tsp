import "./core.tsp";

model PhoneRouteResponse {...PhoneRoute}

model PhoneRouteListResponse {
  @doc("List of Phone Routes")
  @example(#[
    #{
      id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      name: "My Phone Route",
      phone_number: "+15551234567",
      created_at: "2023-01-01T12:00:00Z",
      updated_at: "2023-01-01T12:00:00Z"
    }
  ])
  data: PhoneRouteResponse[];
}