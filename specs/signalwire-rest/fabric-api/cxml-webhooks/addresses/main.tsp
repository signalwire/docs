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

@route("/resources/cxml_webhooks/{cxml_webhook_id}/addresses")
namespace SignalWireAPI.Fabric.CXMLWebhook.Addresses {
  @tag(CXML_WEBHOOK_TAG)
  @friendlyName("cXML Webhooks")
  interface CXMLWebhookAddresses {
    @operationId("list_cxml_webhook_addresses")
    @summary("List cXML webhook Addresses")
    @doc("""
      Returns the project-scoped resource addresses assigned to one cXML Webhook. Use these callable handles to see how calls or messages can reach the server-backed cXML handler; use [List cXML webhooks](/docs/apis/rest/cxml-webhook/list-cxml-webhooks) for the resources themselves, or the cXML Script address operation for stored cXML handlers.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...CXMLWebhookIDPath):
      | CXMLWebhookAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
