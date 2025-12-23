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

@route("/resources/freeswitch_connectors")
namespace FabricAPI.FreeswitchConnectors {
  @tag(FREESWITCH_CONNECTOR_TAG)
  @friendlyName("FreeSWITCH Connectors")
  interface FreeswitchConnectors {
    @summary("List FreeSWITCH Connectors")
    @doc("""
      A list of FreeSWITCH Connectors

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list():
      | FreeswitchConnectorListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Get FreeSWITCH Connector")
    @doc("""
      Returns a FreeSWITCH Connector by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    read(...FreeswitchConnectorPathID):
      | {
          @statusCode statusCode: 200;
          @body freeswitch_connector: FreeswitchConnectorResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Create FreeSWITCH Connector")
    @doc("""
      Creates a FreeSWITCH Connector

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @post
    create(@body request: FreeswitchConnectorCreateRequest):
      | {
          @statusCode statusCode: 200;
          @body freeswitch_connector: FreeswitchConnectorResponse;
        }
      | StatusCode401
      | StatusCode404
      | FreeswitchConnectorCreateStatusCode422
      | StatusCode500;

    @summary("Update FreeSWITCH Connector")
    @doc("""
      Updates a FreeSWITCH Connector by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @put
    update(
      ...FreeswitchConnectorPathID,
      @body request: FreeswitchConnectorUpdateRequest,
    ):
      | {
          @statusCode statusCode: 200;
          @body freeswitch_connector: FreeswitchConnectorResponse;
        }
      | StatusCode401
      | StatusCode404
      | FreeswitchConnectorUpdateStatusCode422
      | StatusCode500;

    @summary("Delete FreeSWITCH Connector")
    @doc("""
      Deletes a FreeSWITCH Connector by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @delete
    delete(...FreeswitchConnectorPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
