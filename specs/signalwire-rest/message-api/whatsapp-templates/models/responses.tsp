import "./core.tsp";

using TypeSpec.Http;

@doc("Response containing a list of message templates.")
model WhatsAppTemplateListResponse {
  @doc("List of message templates.")
  data: WhatsAppTemplate[];
}

@doc("Response containing a single message template.")
model WhatsAppTemplateResponse {
  ...WhatsAppTemplate;
}
