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

@route("/resources")
namespace SignalWireAPI.Fabric.Resources {
  @tag(RESOURCES_TAG)
  @friendlyName("Resources")
  interface Resources {
    @operationId("list_resources")
    @summary("List Resources")
    @doc("""
      Lists every supported Fabric resource in your SignalWire project, regardless of type. Use it for project-wide inventory or when you do not yet know whether an ID belongs to an AI Agent, script, SIP resource, or another resource type. Use a type-specific collection such as [SWML Scripts](/docs/apis/rest/swml-scripts/list-swml-scripts) or [SIP Credentials](/docs/apis/rest/sip-credentials/list-sip-credentials) to create resources or work with their full configuration.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | ResourceListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_resource")
    @summary("Get Resource")
    @doc("""
      Retrieves a Fabric resource from your SignalWire project without requiring its type in advance. The response identifies what the resource is; use that resource type's own get operation when you need its full configuration.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
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
      Deletes a Fabric resource from your SignalWire project without requiring its type in advance. Use the type-specific delete operation instead when your application already knows the resource family and should make that intent explicit.
      
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
