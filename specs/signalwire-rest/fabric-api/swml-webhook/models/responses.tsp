import "../../_shared/enums.tsp";
import "../../_shared/const.tsp";


model SWMLWebhookResponse {
  @doc("Unique ID of the SWML Webhook.")
  @example("a87db7ed-8ebe-42e4-829f-8ba5a4152f54")
  @format("uuid")
  id: uuid;

  @doc("Unique ID of the Project.")
  @example("99151cf8-9548-4860-ba70-a8de824f3312")
  @format("uuid")
  project_id: uuid;

  @doc("Display name of the SWML Webhook Fabric Resource")
  @example("Booking Assistant")
  display_name: string;

  @doc("Type of the Fabric Resource")
  @example(FabricResponseType.SwmlWebhook)
  type: FabricResponseType.SwmlWebhook;

  @doc("Date and time when the resource was created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;

  @doc("Date and time when the resource was updated.")
  @example(UTC_TIME_EXAMPLE)
  updated_at: utcDateTime;

  @doc("SWML Webhook data.")
  swml_webhook: SWMLWebhook;
}

model SWMLWebhookListResponse {
  data: SWMLWebhookResponse[];
  links: SWMLWebhookPaginationResponse;
}

model SWMLWebhookPaginationResponse {
  @doc("Link of the current page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/swml_webhooks?page_number=0&page_size=50")
  self: url;

  @doc("Link to the first page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/swml_webhooks?page_number=0&page_size=50")
  first: url;

  @doc("Link to the next page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/swml_webhooks?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  next: url;

  @doc("Link to the previous page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/swml_webhooks?page_number=0&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  prev?: url
}
