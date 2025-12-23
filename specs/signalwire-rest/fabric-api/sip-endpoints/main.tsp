import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "./resource";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/sip_endpoints")
namespace FabricAPI.SipEndpoints {
  @tag(SIP_ENDPOINTS_TAG)
  @friendlyName("SIP Endpoints")
  @doc("""
      SIP Endpoints API category.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
  interface SipEndpoints {
    @summary("List SIP Endpoints")
    @doc("""
      A list of SIP Endpoints

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list():
      | SipEndpointListResponse[]
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Get SIP Endpoint")
    @doc("""
      Returns a SIP Endpoint by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    read(...SipEndpointPathID):
      | {
          @statusCode statusCode: 200;
          @body sip_endpoint: SipEndpointResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Create SIP Endpoint")
    @doc("""
      Creates a SIP Endpoint

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @post
    create(@body request: SipEndpointCreateRequest):
      | {
          @statusCode statusCode: 200;
          @body sip_endpoint: SipEndpointResponse;
        }
      | StatusCode401
      | StatusCode404
      | ResourceSipEndpointCreateStatusCode422
      | StatusCode500;

    @summary("Update SIP Endpoint")
    @doc("""
      Updates a SIP Endpoint by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @put
    update(...SipEndpointPathID, @body request: SipEndpointUpdateRequest):
      | {
          @statusCode statusCode: 200;
          @body sip_endpoint: SipEndpointResponse;
        }
      | StatusCode401
      | StatusCode404
      | ResourceSipEndpointUpdateStatusCode422
      | StatusCode500;

    @summary("Delete SIP Endpoint")
    @doc("""
      Deletes a SIP Endpoint by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @delete
    delete(...SipEndpointPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
