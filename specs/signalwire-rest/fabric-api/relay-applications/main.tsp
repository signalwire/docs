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

@route("/resources/relay_applications")
namespace FabricAPI.RelayApplications {
  @tag(RELAY_APPLICATION_TAG)
  @friendlyName("Relay Applications")
  interface RelayApplications {
    @summary("List Relay Applications")
    @doc("""
      A list of Relay Applications

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list():
      | RelayApplicationListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Get Relay Application")
    @doc("""
      Returns a Relay Application by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    read(...RelayApplicationPathID):
      | {
          @statusCode statusCode: 200;
          @body relay_application: RelayApplicationResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Create Relay Application")
    @doc("""
      Creates a Relay Application

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @post
    create(@body request: RelayApplicationCreateRequest):
      | {
          @statusCode statusCode: 200;
          @body relay_application: RelayApplicationResponse;
        }
      | StatusCode401
      | StatusCode404
      | RelayApplicationCreateStatusCode422
      | StatusCode500;

    @summary("Update Relay Application")
    @doc("""
      Updates a Relay Application by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @put
    update(
      ...RelayApplicationPathID,
      @body request: RelayApplicationUpdateRequest,
    ):
      | {
          @statusCode statusCode: 200;
          @body relay_application: RelayApplicationResponse;
        }
      | StatusCode401
      | StatusCode404
      | RelayApplicationUpdateStatusCode422
      | StatusCode500;

    @summary("Delete Relay Application")
    @doc("""
      Deletes a Relay Application by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @delete
    delete(...RelayApplicationPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
