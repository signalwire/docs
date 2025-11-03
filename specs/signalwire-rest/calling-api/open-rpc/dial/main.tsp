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
  "https://developer.signalwire.com/rest/signalwire-rest/endpoints/calling/calls/dial",
  "Documentation for the dial command to create new calls."
)
@info(#{
  title: "Calling API - Create Call",
  version: "1.0.0",
  contact: CONTACT_INFO,
  license: LICENSE_INFO,
  termsOfService: TERMS_OF_SERVICE,
})
@service(#{ title: "Calling API - Create Call" })
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
@doc("API to create SignalWire calls using the dial command.")
namespace CallingAPI.Dial;

@route("/calls")
@tag("Calls")
interface CallingDialCommand {
  @summary("Create a Call")
  @doc("To create a new call, you send a `POST` request to the Call resource with a payload including a `dial` command and additional nested `params`.")
  @operationId("create-call")
  @post
  dial(@body request: CallCreateRequest):
    | {
        @statusCode statusCode: 201;
        @body call: CallResponse;
      }
    | StatusCode401
    | StatusCode404
    | CallCreate422Error
    | StatusCode500;
}
