import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/relay_applications")
namespace SignalWireAPI.Fabric.RelayApplications {
  @tag(RELAY_APPLICATION_TAG)
  @friendlyName("Relay Applications")
  interface RelayApplications {
    @operationId("list_relay_applications")
    @summary("List Relay applications")
    @doc("""
      Returns the project's Relay Application resources, which route calls or messages to a Relay Server SDK application listening on a topic. Use it to discover topic-backed handlers before retrieving or changing one. Use a [SWML Webhook](/docs/apis/rest/swml-webhook/list-swml-webhooks) for an HTTP server that returns instructions per request, or a [Call Flow](/docs/apis/rest/call-flows/list-call-flows) for a visual handler.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | RelayApplicationListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_relay_application")
    @summary("Get Relay application")
    @doc("""
      Retrieves one Relay Application by resource ID so you can inspect how SignalWire routes events to its Relay Server SDK listener. Use [List Relay applications](/docs/apis/rest/relay-application/list-relay-applications) to discover IDs, or a [SWML Script](/docs/apis/rest/swml-scripts/create-swml-script) when no Relay Server SDK process should receive the event.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    read(...RelayApplicationPathID):
      | {
          @statusCode statusCode: 200;
          @body relay_application: RelayApplicationResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_relay_application")
    @summary("Create Relay application")
    @doc("""
      Creates a resource that routes calls or messages to a Relay Server SDK application listening on the configured topic. Use it when your long-running server application will handle events through the Relay SDK; use [Create SWML webhook](/docs/apis/rest/swml-webhook/create-swml-webhook) for request-and-response HTTP handling, or [Create call flow](/docs/apis/rest/call-flows/create-call-flow) for visual call logic.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    create(@body request: RelayApplicationCreateRequest):
      | {
          @statusCode statusCode: 200;
          @body relay_application: RelayApplicationResponse;
        }
      | StatusCode401
      | StatusCode404
      | RelayApplicationCreateStatusCode422
      | StatusCode500;

    @operationId("update_relay_application")
    @summary("Update Relay application")
    @doc("""
      Changes where a Relay Application sends events or call-status updates while preserving the same Fabric resource. Update a SWML Webhook or Call Flow through its own resource endpoint instead.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @put
    update(
      ...RelayApplicationPathID,
      @body request: RelayApplicationUpdateRequest,
    ):
      | {
          @statusCode statusCode: 200;
          @body relay_application: RelayApplicationResponse;
        }
      | StatusCode401
      | StatusCode404
      | RelayApplicationUpdateStatusCode422
      | StatusCode500;

    @operationId("delete_relay_application")
    @summary("Delete Relay application")
    @doc("""
      Deletes a Relay Application resource by ID. Use it when calls or messages should no longer route to the Relay Server SDK topic; deleting this resource does not delete a [SWML Webhook](/docs/apis/rest/swml-webhook/delete-swml-webhook) or [Call Flow](/docs/apis/rest/call-flows/delete-call-flow).
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @delete
    delete(...RelayApplicationPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
