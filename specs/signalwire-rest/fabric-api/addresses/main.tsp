import "@typespec/http";
import "@typespec/openapi";
import "../_shared/fabric-address";
import "../../types";
import "../../../_shared/auth.tsp";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@useAuth(SignalWireBearerAuth)
@route("/addresses")
namespace SignalWireAPI.Fabric.FabricAddresses {
  @tag(FABRIC_ADDRESS_TAG)
  @friendlyName("Fabric Address")
  interface FabricAddresses {
    @operationId("list_resource_addresses_client")
    @summary("List Resource Addresses from a Client")
    @doc("""
      Returns the resource addresses visible to the authenticated [Subscriber](/docs/platform/subscribers). A subscriber client uses this collection to discover the callable handles it can reach. Authenticate with a Subscriber Access Token (SAT) created by [Create Subscriber token](/docs/apis/rest/subscribers/tokens/create-subscriber-token); project administration code should use the project-scoped [List Resource Addresses](/docs/apis/rest/addresses/list-resource-addresses) operation instead.

      Resource addresses are callable handles, not standalone SIP Address configurations or physical [E911 Addresses](/docs/apis/rest/e-911-addresses/list-addresses).
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | FabricAddressesResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_resource_address_client")
    @summary("Get Resource Address from a Client")
    @doc("""
      Retrieves one resource address visible to the authenticated [Subscriber](/docs/platform/subscribers) by address ID. Use it when a subscriber client already holds a callable address identifier; use [List Resource Addresses from a Client](/docs/apis/rest/addresses/list-resource-addresses-client) to discover visible addresses. Authenticate with a Subscriber Access Token (SAT), not a project API token.

      Resource addresses are callable handles, not standalone SIP Address configurations or physical [E911 Addresses](/docs/apis/rest/e-911-addresses/get-address).

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    read(...FabricAddressID):
      | {
          @statusCode statusCode: 200;
          @body fabric_address: FabricAddress;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
