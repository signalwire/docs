import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/swml_webhooks/{swml_webhook_id}/addresses")
namespace FabricAPI.SWMLWebhookAddresses {
  @tag("SWML Webhook")
  @friendlyName("SWML Webhooks")
  interface SWMLWebhookAddresses {
    @summary("List SWML Webhook Addresses")
    @doc("A list of SWML Webhook Addresses")
    list(...SWMLWebhookIDPath):
      SWMLWebhookAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}

