import "./core.tsp";

using TypeSpec.Http;

@doc("Response containing a list of WhatsApp Business Accounts.")
model WhatsAppBusinessListResponse {
  @doc("List of WhatsApp Business Accounts connected to the Space.")
  data: WhatsAppBusiness[];
}
