import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";
import "../../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/swml_webhooks/{swml_webhook_id}/addresses")
namespace SignalWireAPI.Fabric.SWMLWebhookAddresses {
  @tag(SWML_WEBHOOK_TAG)
  @friendlyName("SWML Webhooks")
  interface SWMLWebhookAddresses {
    @operationId("list_swml_webhook_addresses")
    @summary("List SWML webhook Addresses")
    @doc("""
      Returns the project-scoped resource addresses assigned to one SWML Webhook. Use these callable handles to see how calls or messages can reach the server-backed SWML handler; use [List SWML webhooks](/docs/apis/rest/swml-webhook/list-swml-webhooks) for the resources themselves, or the SWML Script address operation for stored SWML handlers.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...SWMLWebhookIDPath):
      | SWMLWebhookAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
