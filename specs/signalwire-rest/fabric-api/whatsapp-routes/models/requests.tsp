import "../../_shared/enums.tsp";

model WhatsAppRouteAssignRequest {
  @doc("The SignalWire ID of the WhatsApp number, as returned by [List WhatsApp numbers](/docs/apis/rest/whatsapp/list-whatsapp-numbers).")
  @example("691af061-cd86-4893-a605-173f47afc4c2")
  whatsapp_number_id: uuid;

  @doc("Whether the Resource handles the number's `calling` or `messaging` traffic.")
  @example(UsedForType.Calling)
  handler: UsedForType;
}
