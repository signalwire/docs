import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/relay_applications/{id}/addresses")
namespace FabricAPI.RelayApplication.Addresses {
  @tag(RELAY_APPLICATION_TAG)
  interface RelayApplicationAddresses {
    @summary("List Relay Application Addresses")
    @doc("""
      This endpoint returns a paginated list of addresses associated with a Relay Application.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list(...RelayApplicationAddressPathID):
      | RelayApplicationAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
