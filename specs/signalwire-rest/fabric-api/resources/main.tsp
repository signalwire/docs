import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources")
namespace FabricAPI.Resources {
  @tag(RESOURCES_TAG)
  @friendlyName("Resources")
  interface Resources {
    @summary("List Resources")
    @doc("""
      A list of Fabric Resources

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list():
      | ResourceListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Get Resource")
    @doc("""
      Returns a Resource by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    read(...ResourcePathID):
      | {
          @statusCode statusCode: 200;
          @body resource: ResourceResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Delete Resource")
    @doc("""
      Deletes a Resource by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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
