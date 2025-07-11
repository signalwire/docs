import "@typespec/http";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/sip_gateways")
namespace FabricAPI.SipGateways {
  @tag("SIP Gateway")
  @friendlyName("SIP Gateway")
  interface SipGateways {
    @summary("List SIP Gateways")
    @doc("Returns a paginated list of SIP Gateways for the authenticated project.")
    list():
      SipGatewayListResponse |
      StatusCode401 |
      StatusCode404;

    @summary("Get SIP Gateway")
    @doc("Returns an SIP Gateway by ID")
    read(...SipGatewayID): {
        @statusCode statusCode: 200;
        @body sip_gateway: SipGatewayResponse;
      } |
      StatusCode401 |
      StatusCode404;

    @summary("Create SIP Gateway")
    @doc("Creates a SIP Gateway that can be used to dial external SIP entities.")
    @post create(...SipGatewayCreateRequest):
      { @statusCode statusCode: 201; @body sip_gateway: SipGatewayCreateResponse; } |
      StatusCode401 |
      StatusCode404 |
      SipGatewayCreateStatusCode422;

    @summary("Update SIP Gateway")
    @doc("Updates a SIP Gateway by ID")
    @patch(#{ implicitOptionality: true })  update(...SipGatewayID, ...SipGatewayUpdateRequest): {
      @statusCode statusCode: 200; @body sip_gateway: SipGatewayUpdateResponse;
    } |
      StatusCode401 |
      StatusCode404 |
      SipGatewayCreateStatusCode422;

    @summary("Delete SIP Gateway")
    @doc("Deletes a SIP Gateway} by ID")
    @delete delete(...SipGatewayID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;

    @summary("List Fabric Addresses assigned to a SIP Gateway")
    @doc("Returns a paginated list of Fabric Addresses associated with the specified SIP Gateway.")
    @route("/{resource_id}/addresses")
    readAddressesByResourceId(@path resource_id: string): 
      SipGatewayAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}
