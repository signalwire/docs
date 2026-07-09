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

@doc("Response returned when a template is successfully created and submitted to Meta.")
model WhatsAppTemplateCreatedResponse {
  @statusCode
  statusCode: 201;

  @body
  body: WhatsAppTemplate;
}

@doc("Response returned when a template has been deleted.")
model WhatsAppTemplateDeleteResponse {
  @statusCode
  statusCode: 200;

  @doc("Whether the template was deleted successfully at Meta.")
  success: boolean;

  @doc("Empty array when the deletion succeeds; otherwise the error details returned by Meta.")
  errors: unknown;
}
