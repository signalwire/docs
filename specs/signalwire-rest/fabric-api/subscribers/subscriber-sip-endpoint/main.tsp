import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/{fabric_subscriber_id}/sip_endpoints")
namespace FabricAPI.Subscribers.SipEndpoints {
  @tag(SUBSCRIBER_SIP_ENDPOINT_TAG)
  @friendlyName("SIP Endpoints")
  interface SubscriberSipEndpoint {
    @summary("List Subscriber SIP Endpoints")
    @doc("""
      A list of Sip Endpoints of the Subscriber

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list(...FabricSubscriberID):
      | SubscriberSipEndpointListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Get Subscriber SIP Endpoint")
    @doc("""
      Returns a Subscriber Sip Endpoint by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    read(...SIPEndpointID, ...FabricSubscriberID):
      | {
          @statusCode statusCode: 200;
          @body subscriber_sip_endpoint: SubscriberSIPEndpoint;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Create Subscriber SIP Endpoint")
    @doc("""
      Creates a Subscriber Sip Endpoint

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @post
    create(...FabricSubscriberID, @body body: SubscriberSipEndpointRequest):
      | {
          @statusCode statusCode: 201;
          @body subscriber_sip_endpoint: SubscriberSIPEndpoint;
        }
      | StatusCode401
      | StatusCode404
      | SipEndpointCreateStatusCode422
      | StatusCode500;

    @summary("Update Subscriber SIP Endpoint")
    @doc("""
      Updates a Subscriber Sip Endpoint by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @patch(#{ implicitOptionality: true })
    update(
      ...SIPEndpointID,
      ...FabricSubscriberID,
      @body body: SubscriberSipEndpointRequest,
    ):
      | {
          @statusCode statusCode: 200;
          @body subscriber_sip_endpoint: SubscriberSIPEndpoint;
        }
      | StatusCode401
      | StatusCode404
      | SipEndpointUpdateStatusCode422
      | StatusCode500;

    @summary("Delete Subscriber SIP Endpoint")
    @doc("""
      Deletes a Subscriber Sip Endpoint by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @delete
    delete(...SIPEndpointID, ...FabricSubscriberID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
