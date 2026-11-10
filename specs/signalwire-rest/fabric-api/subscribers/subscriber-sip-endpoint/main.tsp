import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../types";
import "../../tags.tsp";
import "../../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/{fabric_subscriber_id}/sip_endpoints")
namespace SignalWireAPI.Fabric.Subscribers.SipEndpoints {
  @tag(SUBSCRIBER_SIP_ENDPOINT_TAG)
  @friendlyName("SIP Endpoints")
  interface SubscriberSipEndpoint {
    @operationId("list_subscriber_sip_credentials")
    @summary("List Subscriber SIP credentials")
    @doc("""
      Returns the SIP Credentials owned by one [Subscriber](/docs/platform/subscribers). Use this subscriber-scoped collection when each subscriber manages one or more registering SIP devices. Use the project-scoped [List SIP credentials](/docs/apis/rest/sip-credentials/list-sip-credentials) for shared or independently managed devices.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...FabricSubscriberID):
      | SubscriberSipEndpointListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_subscriber_sip_credential")
    @summary("Get Subscriber SIP credential")
    @doc("""
      Retrieves one SIP Credential belonging to a specified [Subscriber](/docs/platform/subscribers) by credential ID. Use it when both subscriber and credential IDs are known; use [List Subscriber SIP credentials](/docs/apis/rest/subscribers/sip-credentials/list-subscriber-sip-credentials) to discover the subscriber's credentials, or the project-scoped get operation for a shared device.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    read(...SIPEndpointID, ...FabricSubscriberID):
      | {
          @statusCode statusCode: 200;
          @body subscriber_sip_endpoint: SubscriberSIPEndpoint;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_subscriber_sip_credential")
    @summary("Create Subscriber SIP credential")
    @doc("""
      Creates a SIP Credential owned by a specified [Subscriber](/docs/platform/subscribers), allowing that subscriber's SIP device to register with SignalWire. Use it for per-subscriber devices; use [Create SIP credential](/docs/apis/rest/sip-credentials/create-sip-credential) for a project-scoped credential not tied to a subscriber.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
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

    @operationId("update_subscriber_sip_credential")
    @summary("Update Subscriber SIP credential")
    @doc("""
      Changes the configurable settings of one SIP Credential owned by a specified [Subscriber](/docs/platform/subscribers). Use it for per-subscriber device registration; use [Update SIP credential](/docs/apis/rest/sip-credentials/update-sip-credential) for a project-scoped credential.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
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

    @operationId("delete_subscriber_sip_credential")
    @summary("Delete Subscriber SIP credential")
    @doc("""
      Deletes one SIP Credential owned by a specified [Subscriber](/docs/platform/subscribers), preventing that device from registering with those credentials. Use [Delete SIP credential](/docs/apis/rest/sip-credentials/delete-sip-credential) for a project-scoped credential instead.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
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
