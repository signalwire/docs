import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/cxml_webhooks/{cxml_webhook_id}/addresses")
namespace FabricAPI.CXMLWebhook.Addresses {
  @tag(CXML_WEBHOOK_TAG)
  @friendlyName("cXML Webhooks")
  interface CXMLWebhookAddresses {
    @summary("List cXML Webhook Addresses")
    @doc("This endpoint returns a list of addresses associated with a specific cXML Webhook.")
    list(...CXMLWebhookIDPath):
      | CXMLWebhookAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
