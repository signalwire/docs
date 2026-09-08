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

@route("/resources/{id}/phone_routes")
namespace SignalWireAPI.Fabric.PhoneRoutes {
  @tag(PHONE_ROUTES_TAG)
  @friendlyName("Phone Routes")
  interface PhoneRoutes {
    @operationId("assign_resource_phone_route")
    @summary("Assign Resource to phone route")
    @doc("""
      Assigns an existing Fabric resource as a phone number's calling or messaging handler. Use it when inbound traffic to an owned number should run an AI Agent, script, Call Flow, Relay Application, or another resource. This operation does not purchase or import the number; use [Purchase phone number](/docs/apis/rest/phone-numbers/purchase-phone-number) or [Import phone number](/docs/apis/rest/phone-numbers/create-imported-phone-number) first when needed.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    assign(...PhoneRoutePathID, @body request: PhoneRouteAssignRequest):
      | {
          @statusCode statusCode: 200;
          @body phone_route: PhoneRouteResponse;
        }
      | StatusCode401
      | StatusCode404
      | PhoneRouteCreateStatusCode422
      | StatusCode500;
  }
}
