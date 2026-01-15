import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/endpoints/sip")
namespace SpaceAPI.SipEndpoints {
  @tag(SIP_ENDPOINTS_TAG)
  @friendlyName("SIP Endpoints")
  interface SipEndpoints {
    @operationId("list_sip_endpoints")
    @summary("List all SIP Endpoints.")
    @doc("""
      Returns a list of your SIP endpoints.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    list(): SipEndpointListResponse | StatusCode401 | StatusCode500;

    @operationId("create_sip_endpoint")
    @summary("Create a SIP Endpoint")
    @doc("""
      Creates a new SIP endpoint.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    create(@body body: CreateSipEndpointRequest):
      | {
          @statusCode statusCode: 201;
          @body sip_endpoint: SipEndpointResponse;
        }
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("retrieve_sip_endpoint")
    @summary("Retrieve a SIP Endpoint")
    @doc("""
      Retrieves the details of a SIP endpoint.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    read(...SipEndpointPathID): SipEndpointResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("update_sip_endpoint")
    @summary("Update a SIP Endpoint")
    @doc("""
      Updates a SIP endpoint.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @put
    update(...SipEndpointPathID, @body body: UpdateSipEndpointRequest):
      | {
          @statusCode statusCode: 200;
          @body sip_endpoint: SipEndpointResponse;
        }
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("delete_sip_endpoint")
    @summary("Delete a SIP Endpoint")
    @doc("""
      Permanently deletes a SIP endpoint.

      #### Permissions
      The API token must include the following scopes: _Voice_.
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
