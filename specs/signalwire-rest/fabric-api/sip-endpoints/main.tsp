import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/sip_endpoints")
namespace FabricAPI.SipEndpoints {
  @tag("SIP Endpoints")
  @friendlyName("SIP Endpoints")
  interface SipEndpoints {
    @summary("List SIP Endpoints")
    @doc("A list of SIP Endpoints")
    list():
      SipEndpointResponse[] |
      StatusCode401 |
      StatusCode404;

    @summary("Get SIP Endpoint")
    @doc("Returns a SIP Endpoint by ID")
    read(...SipEndpointPathID):
      { @statusCode statusCode: 200; @body sip_endpoint: SipEndpointResponse; } |
      StatusCode401 |
      StatusCode404;

    @summary("Create SIP Endpoint")
    @doc("Creates a SIP Endpoint")
    @post create(@body request: SipEndpointCreateRequest):
      { @statusCode statusCode: 201; @body sip_endpoint: SipEndpointResponse; } |
      StatusCode401 |
      StatusCode404 |
      ResourceSipEndpointCreateStatusCode422;

    @summary("Update SIP Endpoint")
    @doc("Updates a SIP Endpoint by ID")
    @put update(...SipEndpointPathID, @body request: SipEndpointUpdateRequest):
      { @statusCode statusCode: 200; @body sip_endpoint: SipEndpointResponse; } |
      StatusCode401 |
      StatusCode404 |
      ResourceSipEndpointUpdateStatusCode422;

    @summary("Delete SIP Endpoint")
    @doc("Deletes a SIP Endpoint by ID")
    @delete delete(...SipEndpointPathID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;
    }
}