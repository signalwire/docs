import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";
import "../tags.tsp";
import "../_shared/examples.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources")
namespace SignalWireAPI.Fabric.Resources {
  @tag(RESOURCES_TAG)
  @friendlyName("Resources")
  interface Resources {
    @operationId("list_resources")
    @summary("List Resources")
    @doc("""
      A list of Fabric Resources
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      #{
        returnType: #{
          data: #[RESOURCE_AI_EXAMPLE],
          links: #{
            self: "https://example.signalwire.com/api/fabric/resources?page_number=0&page_size=50",
            first: "https://example.signalwire.com/api/fabric/resources?page_number=0&page_size=50",
          },
        },
      },
      #{
        title: "Resource list",
        description: "A page containing one compact AI Agent resource.",
      }
    )
    list():
      | ResourceListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_resource")
    @summary("Get Resource")
    @doc("""
      Returns a Resource by ID
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      #{ returnType: #{ statusCode: 200, resource: RESOURCE_AI_EXAMPLE } },
      #{ title: "AI Agent", description: "An AI Agent Fabric resource." }
    )
    @opExample(
      #{ returnType: #{ statusCode: 200, resource: RESOURCE_CALL_FLOW_EXAMPLE } },
      #{ title: "Call Flow", description: "A Call Flow with compact SWML content." }
    )
    @opExample(
      #{
        returnType: #{
          statusCode: 200,
          resource: RESOURCE_CALLING_SWML_SCRIPT_EXAMPLE,
        },
      },
      #{ title: "Calling script", description: "A compact Calling SWML Script resource." }
    )
    @opExample(
      #{
        returnType: #{
          statusCode: 200,
          resource: RESOURCE_MESSAGING_SWML_SCRIPT_EXAMPLE,
        },
      },
      #{ title: "Messaging script", description: "A compact Messaging SWML Script resource." }
    )
    read(...ResourcePathID):
      | {
          @statusCode statusCode: 200;
          @body resource: ResourceResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("delete_resource")
    @summary("Delete Resource")
    @doc("""
      Deletes a Resource by ID
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @delete
    delete(...ResourcePathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
