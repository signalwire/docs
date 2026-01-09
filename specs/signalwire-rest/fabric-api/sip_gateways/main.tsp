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
    @doc("""
      Returns a paginated list of SIP Gateways for the authenticated project.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list():
      | SipGatewayListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Get SIP Gateway")
    @doc("""
      Returns an SIP Gateway by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    read(...SipGatewayID):
      | {
          @statusCode statusCode: 200;
          @body sip_gateway: SipGatewayResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Create SIP Gateway")
    @doc("""
      Creates a SIP Gateway that can be used to dial external SIP entities.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @post
    create(...SipGatewayRequest):
      | {
          @statusCode statusCode: 201;
          @body sip_gateway: SipGatewayResponse;
        }
      | StatusCode401
      | StatusCode404
      | SipGatewayCreateStatusCode422
      | StatusCode500;

    @summary("Update SIP Gateway")
    @doc("""
      Updates a SIP Gateway by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @patch(#{ implicitOptionality: true })
    update(...SipGatewayID, ...SipGatewayRequest):
      | {
          @statusCode statusCode: 200;
          @body sip_gateway: SipGatewayResponse;
        }
      | StatusCode401
      | StatusCode404
      | SipGatewayCreateStatusCode422
      | StatusCode500;

    @summary("Delete SIP Gateway")
    @doc("""
      Deletes a SIP Gateway} by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @delete
    delete(...SipGatewayID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
