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

@route("/resources/{id}/addresses")
namespace SignalWireAPI.Fabric.Resource.Addresses {
  @tag(FABRIC_ADDRESS_TAG)
  interface ResourceAddresses {
    @operationId("list_resource_addresses")
    @summary("List Resource Addresses")
    @doc("""
      Returns the project-scoped resource addresses assigned to any resource identified by ID. Use it from project administration code when the resource type is not known in advance; typed resource groups expose equivalent address lists alongside their type-specific fields. Subscriber clients must use the SAT-authenticated [List Resource Addresses from a Client](/docs/apis/rest/addresses/list-resource-addresses-client) operation instead.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...ResourceAddressPathID):
      | ResourceAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
