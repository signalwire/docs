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

@route("/resources/relay_applications/{id}/addresses")
namespace SignalWireAPI.Fabric.RelayApplication.Addresses {
  @tag(RELAY_APPLICATION_TAG)
  interface RelayApplicationAddresses {
    @operationId("list_relay_application_addresses")
    @summary("List Relay application Addresses")
    @doc("""
      Returns the project-scoped resource addresses assigned to one Relay Application. Use these callable handles to see how calls or messages can reach the Relay Server SDK topic; use [List Relay applications](/docs/apis/rest/relay-application/list-relay-applications) for the resources themselves, or the address operation for the handler type you actually use.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...RelayApplicationAddressPathID):
      | RelayApplicationAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
