import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/{id}/whatsapp_numbers")
namespace SignalWireAPI.Fabric.WhatsAppRoutes {
  @tag(WHATSAPP_ROUTES_TAG)
  @friendlyName("WhatsApp Routes")
  interface WhatsAppRoutes {
    @operationId("assign_resource_whatsapp_number")
    @summary("Assign Resource to WhatsApp number")
    @doc("""
      Assigns an existing Resource as a WhatsApp number's calling or messaging handler, so every inbound call or message to the number runs that Resource. Find the number's ID with [List WhatsApp numbers](/docs/apis/rest/whatsapp/list-whatsapp-numbers). A number that already has an address for the chosen channel is re-pointed at the new Resource; an address it holds for the other channel is removed, because a WhatsApp number holds one address at a time. Calling also requires voice to be enabled on the number, as described in [Enable voice on a WhatsApp number](/docs/platform/voice/whatsapp/enable-voice).
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    assign(...WhatsAppRoutePathID, @body request: WhatsAppRouteAssignRequest):
      | {
          @statusCode statusCode: 201;
          @body whatsapp_route: WhatsAppRouteResponse;
        }
      | StatusCode401
      | StatusCode404
      | WhatsAppRouteAssignStatusCode422
      | StatusCode500;
  }
}
