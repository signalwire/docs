import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";
import "../../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/call_flow/{id}/versions")
namespace SignalWireAPI.Fabric.CallFlow.Versions {
  @tag(CALL_FLOWS_TAG)
  interface CallFlowVersions {
    @operationId("list_call_flow_versions")
    @summary("List call flow versions")
    @doc("""
      Lists the saved revisions of one Call Flow. Use it to review the visual resource's history or select a version for deployment; use [Get call flow](/docs/apis/rest/call-flows/get-call-flow) for the current editable resource, or SWML Scripts when you do not need the Call Flow Builder deployment lifecycle.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...CallFlowVersionPathID):
      | CallFlowVersionListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("deploy_call_flow_version")
    @summary("Deploy call flow version")
    @doc("""
      Makes one saved Call Flow version active, selected by document version or version ID. Use it after updating a visual flow when that revision is ready to handle calls; updating the Call Flow saves a revision but does not replace this deployment step. Directly authored [SWML Scripts](/docs/apis/rest/swml-scripts/create-swml-script) do not use Call Flow versions.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    deploy(
      ...CallFlowVersionPathID,
      @body request: CallFlowVersionDeployRequest,
    ):
      | {
          @statusCode statusCode: 201;
          @body response: CallFlowVersionDeployResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode422
      | StatusCode500;
  }
}
