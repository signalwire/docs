import "./core.tsp";

using TypeSpec.Http;

@doc("Response containing a list of WhatsApp numbers.")
model WhatsAppNumberListResponse {
  @doc("List of WhatsApp numbers available to the Space.")
  data: WhatsAppNumber[];
}

@doc("Response containing a single WhatsApp number.")
model WhatsAppNumberResponse {
  ...WhatsAppNumber;
}
