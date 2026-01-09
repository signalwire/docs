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
    @doc("A list of FreeSWITCH Connectors")
    list():
      | FreeswitchConnectorListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Get FreeSWITCH Connector")
    @doc("Returns a FreeSWITCH Connector by ID")
    read(...FreeswitchConnectorPathID):
      | {
          @statusCode statusCode: 200;
          @body freeswitch_connector: FreeswitchConnectorResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Create FreeSWITCH Connector")
    @doc("Creates a FreeSWITCH Connector")
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
    @doc("Updates a FreeSWITCH Connector by ID")
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
    @doc("Deletes a FreeSWITCH Connector by ID")
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
