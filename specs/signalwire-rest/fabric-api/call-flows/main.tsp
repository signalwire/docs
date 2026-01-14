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

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/call_flows")
namespace FabricAPI.CallFlows {
  @tag(CALL_FLOWS_TAG)
  @friendlyName("Call Flows")
  interface CallFlows {
    @operationId("list_call_flows")
    @summary("List Call Flows")
    @doc("A list of Call Flows")
    list():
      | CallFlowListResponse
      | StatusCode401
      | StatusCode404
          | StatusCode500;

        @operationId("get_call_flow")
        @summary("Get Call Flow")
        @doc("Returns a Call Flow by ID")
        read(...CallFlowPathID):
      | {
          @statusCode statusCode: 200;
          @body call_flow: CallFlowResponse;
        }
      | StatusCode401
      | StatusCode404
          | StatusCode500;

        @operationId("create_call_flow")
        @summary("Create Call Flow")
        @doc("Creates a Call Flow")
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
        @summary("Update Call Flow")
        @doc("Updates a Call Flow by ID")
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
        @summary("Delete Call Flow")
        @doc("Deletes a Call Flow by ID")
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
