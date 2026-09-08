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

@route("/resources/freeswitch_connectors")
namespace SignalWireAPI.Fabric.FreeswitchConnectors {
  @tag(FREESWITCH_CONNECTOR_TAG)
  @friendlyName("FreeSWITCH Connectors")
  interface FreeswitchConnectors {
    @operationId("list_freeswitch_connectors")
    @summary("List FreeSWITCH connectors")
    @doc("""
      Returns the project's FreeSWITCH Connector resources, which route communications to connected FreeSWITCH deployments. Use it to discover connectors before retrieving or changing one. Use a [Relay Application](/docs/apis/rest/relay-application/list-relay-applications) when a Relay Server SDK process handles events, or a [SIP Gateway](/docs/apis/rest/sip-gateway/list-sip-gateways) for calls sent to an external SIP destination.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | FreeswitchConnectorListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_freeswitch_connector")
    @summary("Get FreeSWITCH connector")
    @doc("""
      Retrieves one FreeSWITCH Connector by resource ID. Use it when you know the connector ID; use [List FreeSWITCH connectors](/docs/apis/rest/freeswitch-connector/list-freeswitch-connectors) to discover IDs, or [Get Relay application](/docs/apis/rest/relay-application/get-relay-application) for a Relay Server SDK handler.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    read(...FreeswitchConnectorPathID):
      | {
          @statusCode statusCode: 200;
          @body freeswitch_connector: FreeswitchConnectorResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_freeswitch_connector")
    @summary("Create FreeSWITCH connector")
    @doc("""
      Creates a resource for a FreeSWITCH deployment that has been connected with the supplied token. Use it when calls or messages should route to your own FreeSWITCH; use [Create Relay application](/docs/apis/rest/relay-application/create-relay-application) for a Relay Server SDK process, or [Create SIP gateway](/docs/apis/rest/sip-gateway/create-sip-gateway) for an external SIP destination.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    create(@body request: FreeswitchConnectorCreateRequest):
      | {
          @statusCode statusCode: 200;
          @body freeswitch_connector: FreeswitchConnectorResponse;
        }
      | StatusCode401
      | StatusCode404
      | FreeswitchConnectorCreateStatusCode422
      | StatusCode500;

    @operationId("update_freeswitch_connector")
    @summary("Update FreeSWITCH connector")
    @doc("""
      Changes how a connected FreeSWITCH deployment is identified when SignalWire routes communications through it. Relay Applications and SIP Gateways have separate update operations.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @put
    update(
      ...FreeswitchConnectorPathID,
      @body request: FreeswitchConnectorUpdateRequest,
    ):
      | {
          @statusCode statusCode: 200;
          @body freeswitch_connector: FreeswitchConnectorResponse;
        }
      | StatusCode401
      | StatusCode404
      | FreeswitchConnectorUpdateStatusCode422
      | StatusCode500;

    @operationId("delete_freeswitch_connector")
    @summary("Delete FreeSWITCH connector")
    @doc("""
      Deletes a FreeSWITCH Connector resource by ID. Use it when SignalWire should no longer route communications to that connected FreeSWITCH; deleting a [Relay Application](/docs/apis/rest/relay-application/delete-relay-application) or [SIP Gateway](/docs/apis/rest/sip-gateway/delete-sip-gateway) requires that resource's endpoint.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @delete
    delete(...FreeswitchConnectorPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
