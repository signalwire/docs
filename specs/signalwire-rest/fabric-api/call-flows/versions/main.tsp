import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";
import "../../_shared/examples.tsp";
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
    @opExample(
      #{
        returnType: #{
          data: #[CALL_FLOW_VERSION_EXAMPLE],
          links: #{
            self: "https://example.signalwire.com/api/fabric/resources/call_flow/993ed018-9e79-4e50-b97b-984bd5534095/versions?page_number=0&page_size=50",
            first: "https://example.signalwire.com/api/fabric/resources/call_flow/993ed018-9e79-4e50-b97b-984bd5534095/versions?page_number=0&page_size=50",
            next: "https://example.signalwire.com/api/fabric/resources/call_flow/993ed018-9e79-4e50-b97b-984bd5534095/versions?page_number=1&page_size=50",
          },
        },
      },
      #{
        title: "Call Flow version list",
        description: "A page containing one compact Call Flow version.",
      }
    )
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
    @opExample(
      #{
        parameters: #{
          id: "993ed018-9e79-4e50-b97b-984bd5534095",
          request: #{ document_version: 2 },
        },
        returnType: #{
          statusCode: 201,
          response: #{
            id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
            created_at: "2024-05-06T12:20:00Z",
            updated_at: "2024-05-06T12:25:00Z",
            document_version: 2,
            flow_data: #{},
            relayml: SWML_CONTENTS_EXAMPLE,
          },
        },
      },
      #{
        title: "Deploy by document version",
        description: "Deploy version 2 of a Call Flow.",
      }
    )
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
