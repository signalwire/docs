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
import "../_shared/examples.tsp";
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
      A list of Call Flows
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      #{
        returnType: #{
          links: #{
            self: "https://example.signalwire.com/api/fabric/resources/call_flows?page_number=0&page_size=50",
            first: "https://example.signalwire.com/api/fabric/resources/call_flows?page_number=0&page_size=50",
          },
          data: #[CALL_FLOW_RESPONSE_EXAMPLE],
        },
      },
      #{ title: "Call flow list", description: "A page containing one Call Flow." }
    )
    list():
      | CallFlowListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_call_flow")
    @summary("Get call flow")
    @doc("""
      Returns a Call Flow by ID
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      #{ returnType: #{ statusCode: 200, call_flow: CALL_FLOW_RESPONSE_EXAMPLE } },
      #{ title: "Call flow", description: "A Call Flow with a compact SWML document." }
    )
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
      Creates a Call Flow
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      #{
        parameters: #{
          request: #{
            title: "Welcome Call Flow",
            flow_data: #{},
            relayml: SWML_CONTENTS_EXAMPLE,
          },
        },
        returnType: #{ statusCode: 201, call_flow: CALL_FLOW_RESPONSE_EXAMPLE },
      },
      #{
        title: "Welcome Call Flow",
        description: "Create a Call Flow that plays a single audio file.",
      }
    )
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
      Updates a Call Flow by ID
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      #{
        parameters: #{
          id: "993ed018-9e79-4e50-b97b-984bd5534095",
          request: #{
            title: "Updated Welcome Call Flow",
            document_version: 2,
            flow_data: #{},
            relayml: SWML_CONTENTS_EXAMPLE,
          },
        },
        returnType: #{ statusCode: 200, call_flow: CALL_FLOW_RESPONSE_EXAMPLE },
      },
      #{
        title: "Update a Call Flow",
        description: "Update a Call Flow with its next document revision.",
      }
    )
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
      Deletes a Call Flow by ID
      
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
