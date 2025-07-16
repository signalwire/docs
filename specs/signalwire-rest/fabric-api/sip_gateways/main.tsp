import "@typespec/http";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";
import "./addresses";
import "../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/sip_gateways")
namespace FabricAPI.SipGateways {
  @tag(SIP_GATEWAY_TAG)
  @friendlyName("SIP Gateway")
  interface SipGateways {
    @summary("List SIP Gateways")
    @doc("Returns a paginated list of SIP Gateways for the authenticated project.")
    list():
      SipGatewayListResponse |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;

    @summary("Get SIP Gateway")
    @doc("Returns an SIP Gateway by ID")
    read(...SipGatewayID): {
        @statusCode statusCode: 200;
        @body sip_gateway: SipGatewayResponse;
      } |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;

    @summary("Create SIP Gateway")
    @doc("Creates a SIP Gateway that can be used to dial external SIP entities.")
    @post create(...SipGatewayRequest):
      { @statusCode statusCode: 201; @body sip_gateway: SipGatewayResponse; } |
      StatusCode401 |
      StatusCode404 |
      SipGatewayCreateStatusCode422 |
      StatusCode500;

    @summary("Update SIP Gateway")
    @doc("Updates a SIP Gateway by ID")
    @patch(#{ implicitOptionality: true })  update(...SipGatewayID, ...SipGatewayRequest): {
      @statusCode statusCode: 200; @body sip_gateway: SipGatewayResponse;
    } |
      StatusCode401 |
      StatusCode404 |
      SipGatewayCreateStatusCode422 |
      StatusCode500;

    @summary("Delete SIP Gateway")
    @doc("Deletes a SIP Gateway} by ID")
    @delete delete(...SipGatewayID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;
  }
}
