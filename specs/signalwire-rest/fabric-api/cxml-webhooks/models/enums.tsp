import "../../_shared/enums.tsp";

@doc("What a CXML Webhook handles.")
enum CXMLWebhookScriptType {
  @doc("Inbound calls.")
  calling,

  @doc("Inbound messages.")
  messaging,

  @doc("Inbound faxes.")
  faxing,
}
