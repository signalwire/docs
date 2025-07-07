import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/cxml_webhooks/{cxml_webhook_id}/addresses")
namespace FabricAPI.CXMLWebhookAddresses {
  @tag("cXML Webhook")
  @friendlyName("cXML Webhooks")
  interface CXMLWebhookAddresses {
    @summary("List cXML Webhook Addresses")
    @doc("A list of cXML Webhook Addresses")
    list(...CXMLWebhookIDPath):
      CXMLWebhookAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}

