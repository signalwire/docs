import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/{fabric_subscriber_id}/sip_endpoints")
namespace FabricAPI.Subscribers.SipEndpoints {
  @tag("Subscribers: SIP Endpoints")
  @friendlyName("SIP Endpoints")
  interface SubscriberSipEndpoint {
    @summary("List Subscriber SIP Endpoints")
    @doc("A list of Sip Endpoints of the Subscriber")
    list(...FabricSubscriberID):
      SubscriberSipEndpointListResponse |
      StatusCode401 |
      StatusCode404;

    @summary("Get Subscriber SIP Endpoint")
    @doc("Returns a Subscriber Sip Endpoint by ID")
    read(...SIPEndpointID, ...FabricSubscriberID): {
        @statusCode statusCode: 200;
        @body subscriber_sip_endpoint: SIPEndpoint;
      } |
      StatusCode401 |
      StatusCode404;

    @summary("Create Subscriber SIP Endpoint")
    @doc("Creates a Subscriber Sip Endpoint")
    @post create(...FabricSubscriberID, @body body: SubscriberSipEndpointRequest):
      { @statusCode statusCode: 201; @body subscriber_sip_endpoint: SIPEndpoint; } |
      StatusCode401 |
      StatusCode404 |
      SipEndpointCreateStatusCode422;

    @summary("Update Subscriber SIP Endpoint")
    @doc("Updates a Subscriber Sip Endpoint by ID")
    @patch(#{ implicitOptionality: true }) update(...SIPEndpointID, ...FabricSubscriberID, @body body: SubscriberSipEndpointRequest): {
      @statusCode statusCode: 200; @body subscriber_sip_endpoint: SIPEndpoint;
    } |
      StatusCode401 |
      StatusCode404 |
      SipEndpointUpdateStatusCode422;

    @summary("Delete Subscriber SIP Endpoint")
    @doc("Deletes a Subscriber Sip Endpoint by ID")
    @delete delete(...SIPEndpointID, ...FabricSubscriberID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;
    }
}
