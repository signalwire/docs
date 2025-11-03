import "@typespec/http";
import "@typespec/openapi";
import "../../../types";
import "../../calls/models/requests.tsp";
import "../../calls/models/responses.tsp";
import "../../../_globally_shared/const.tsp";
import "../../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@tagMetadata(CALLS_TAG, CALLS_TAG_METADATA)
@externalDocs(
  "https://developer.signalwire.com/rest/signalwire-rest/endpoints/calling/calls/update",
  "Documentation for the update command to modify existing calls."
)
@info(#{
  title: "Calling API - Update Call",
  version: "1.0.0",
  contact: CONTACT_INFO,
  license: LICENSE_INFO,
  termsOfService: TERMS_OF_SERVICE,
})
@service(#{ title: "Calling API - Update Call" })
@server(
  "https://{space_name}.${SERVER_URL}/calling",
  "Endpoint",
  {
    @doc(SERVER_URL_DESCRIPTION)
    @example("example")
    space_name: string = "{Your_Space_Name}",
  }
)
@useAuth(BasicAuth)
@doc("API to update existing SignalWire calls with new SWML instructions.")
namespace CallingAPI.Update;

@route("/calls")
@tag("Calls")
interface CallingUpdateCommand {
  @summary("Update a Call")
  @doc("To update an existing call, you send a `POST` request to the Call resource with a payload including an `update` command and additional nested `params` containing new SWML instructions.")
  @operationId("update-call")
  @post
  update(@body request: CallUpdateCurrentCallRequest):
    | {
        @statusCode statusCode: 200;
        @body call: CallResponse;
      }
    | StatusCode401
    | StatusCode404
    | CallUpdate422Error
    | StatusCode500;
}
