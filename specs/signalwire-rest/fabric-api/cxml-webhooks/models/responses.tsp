
model CXMLWebhookResponse {
  @doc("Unique ID of the CXMLWebhook.")
  @example("a87db7ed-8ebe-42e4-829f-8ba5a4152f54")
  @format("uuid")
  id: uuid;

  @doc("Unique ID of the Project.")
  @example("99151cf8-9548-4860-ba70-a8de824f3312")
  @format("uuid")
  project_id: uuid;

  @doc("Display name of the CXMLWebhook Fabric Resource")
  @example("Booking Assistant")
  display_name: string;

  @doc("Type of the Fabric Resource")
  @example("cxml_webhook")
  type: "cxml_webhook";

  @doc("Date and time when the resource was created.")
  @example(utcDateTime.fromISO("2024-10-17T14:14:53Z"))
  created_at: utcDateTime;

  @doc("Date and time when the resource was updated.")
  @example(utcDateTime.fromISO("2024-10-17T14:14:53Z"))
  updated_at: utcDateTime;

  @doc("CXMLWebhook data.")
  cxml_webhook: CXMLWebhook;
}

model CXMLWebhookListResponse {
  data: CXMLWebhookResponse[];
  links: CXMLWebhookPaginationResponse;
}

model CXMLWebhookPaginationResponse {
  @doc("Link of the current page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/cxml_webhooks?page_number=0&page_size=50")
  self: url;

  @doc("Link to the first page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/cxml_webhooks?page_number=0&page_size=50")
  first: url;

  @doc("Link to the next page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/cxml_webhooks?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  next: url;

  @doc("Link to the previous page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/cxml_webhooks?page_number=0&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  prev?: url;
}
