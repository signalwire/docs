import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "./versions";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/call_flows")
namespace SignalWireAPI.Fabric.CallFlows {
  @tag(CALL_FLOWS_TAG)
  @friendlyName("Call Flows")
  interface CallFlows {
    @operationId("list_call_flows")
    @summary("List call flows")
    @doc("""
      Lists the Call Flows in your SignalWire project. A Call Flow is a visual, reusable call handler built in Call Flow Builder; it can be assigned to phone numbers and other routing resources. Use [SWML Scripts](/docs/apis/rest/swml-scripts/list-swml-scripts) when you author SWML directly, or a [Relay Application](/docs/apis/rest/relay-application/list-relay-applications) when a Server SDK process handles the call.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | CallFlowListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_call_flow")
    @summary("Get call flow")
    @doc("""
      Retrieves one Call Flow from your SignalWire project for viewing or editing. Use [List call flows](/docs/apis/rest/call-flows/list-call-flows) to find flows, or [Get SWML Script](/docs/apis/rest/swml-scripts/get-swml-script) for a directly authored SWML handler.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    read(...CallFlowPathID):
      | {
          @statusCode statusCode: 200;
          @body call_flow: CallFlowResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_call_flow")
    @summary("Create call flow")
    @doc("""
      Creates a visual Call Flow in your SignalWire project. The new flow becomes a reusable call handler that can be edited in Call Flow Builder and assigned to phone numbers or other routing resources. Use [Create SWML Script](/docs/apis/rest/swml-scripts/create-swml-script) for directly authored SWML, or [Create Relay application](/docs/apis/rest/relay-application/create-relay-application) for a Server SDK handler.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    create(@body request: CallFlowCreateRequest):
      | {
          @statusCode statusCode: 201;
          @body call_flow: CallFlowResponse;
        }
      | StatusCode401
      | StatusCode404
      | CallFlowCreateStatusCode422
      | StatusCode500;

    @operationId("update_call_flow")
    @summary("Update call flow")
    @doc("""
      Saves a new editable revision of a Call Flow in your SignalWire project. Supply the next required `document_version`, then make the saved revision live with [Deploy call flow version](/docs/apis/rest/call-flows/deploy-call-flow-version). Directly authored SWML belongs in [Update SWML Script](/docs/apis/rest/swml-scripts/update-swml-script).
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @put
    update(...CallFlowPathID, @body request: CallFlowUpdateRequest):
      | {
          @statusCode statusCode: 200;
          @body call_flow: CallFlowResponse;
        }
      | StatusCode401
      | StatusCode404
      | CallFlowUpdateStatusCode422
      | StatusCode500;

    @operationId("delete_call_flow")
    @summary("Delete call flow")
    @doc("""
      Deletes a Call Flow resource by ID. Use it when the visual flow should no longer be available as a call handler; deleting a [SWML Script](/docs/apis/rest/swml-scripts/delete-swml-script) or [Relay Application](/docs/apis/rest/relay-application/delete-relay-application) requires that resource's endpoint.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @delete
    delete(...CallFlowPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
