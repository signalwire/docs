import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/swml_webhooks/{swml_webhook_id}/addresses")
namespace FabricAPI.SWMLWebhookAddresses {
  @tag("SWML Webhook")
  @friendlyName("SWML Webhooks")
  interface SWMLWebhookAddresses {
    @summary("List SWML Webhook Addresses")
    @doc("A list of SWML Webhook Addresses. This endpoint uses the bearer token authentication method with the SAT (Subscriber Access Token) which can be generated using the [Create Subscriber Token endpoint](/rest/signalwire-rest/endpoints/fabric/subscriber-tokens-create).")
    list(...SWMLWebhookIDPath):
      SWMLWebhookAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}

