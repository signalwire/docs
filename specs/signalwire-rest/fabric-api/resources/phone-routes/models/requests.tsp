@summary("Create phone route")
model PhoneRouteCreateRequest {
  @doc("The name of the phone route.")
  @example("My Phone Route")
  name: string;

  @doc("The phone number for the route.")
  @example("+15551234567")
  phone_number: string;
}