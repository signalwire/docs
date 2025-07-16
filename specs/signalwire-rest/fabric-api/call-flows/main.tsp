import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "./versions";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/call_flows")
namespace FabricAPI.CallFlows {
  @tag("Call Flows")
  @friendlyName("Call Flows")
  interface CallFlows {
    @summary("List Call Flows")
    @doc("A list of Call Flows")
    list():
      CallFlowListResponse |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;

    @summary("Get Call Flow")
    @doc("Returns a Call Flow by ID")
    read(...CallFlowPathID):
      { @statusCode statusCode: 200; @body call_flow: CallFlowResponse; } |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;

    @summary("Create Call Flow")
    @doc("Creates a Call Flow")
    @post create(@body request: CallFlowCreateRequest):
      { @statusCode statusCode: 201; @body call_flow: CallFlowResponse; } |
      StatusCode401 |
      StatusCode404 |
      CallFlowCreateStatusCode422 |
      StatusCode500;

    @summary("Update Call Flow")
    @doc("Updates a Call Flow by ID")
    @put update(...CallFlowPathID, @body request: CallFlowUpdateRequest):
      { @statusCode statusCode: 200; @body call_flow: CallFlowResponse; } |
      StatusCode401 |
      StatusCode404 |
      CallFlowUpdateStatusCode422 |
      StatusCode500;

    @summary("Delete Call Flow")
    @doc("Deletes a Call Flow by ID")
    @delete delete(...CallFlowPathID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;
    }
}
