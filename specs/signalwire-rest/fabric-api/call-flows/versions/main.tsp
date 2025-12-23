import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/call_flow/{id}/versions")
namespace FabricAPI.CallFlow.Versions {
  @tag(CALL_FLOWS_TAG)
  interface CallFlowVersions {
    @summary("List Call Flow Versions")
    @doc("""
      Returns a list of versions of a Call Flow.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list(...CallFlowVersionPathID):
      | CallFlowVersionListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Deploy a Call Flow Version")
    @doc("""
      Deploys a specific version of a Call Flow.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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
