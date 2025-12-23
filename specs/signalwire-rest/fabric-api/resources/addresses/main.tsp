import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/{id}/addresses")
namespace FabricAPI.Resource.Addresses {
  @tag(RESOURCES_TAG)
  interface ResourceAddresses {
    @summary("List Resource Addresses")
    @doc("""
      This endpoint is used to retrieve addresses associated with a specific Resource.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list(...ResourceAddressPathID):
      | ResourceAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
