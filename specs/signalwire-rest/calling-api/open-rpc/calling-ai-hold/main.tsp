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
  "https://developer.signalwire.com/rest/signalwire-rest/endpoints/calling/calls/calling-ai-hold",
  "Documentation for the calling.ai_hold command to hold AI calls."
)
@info(#{
  title: "Calling API - Calling AI Hold",
  version: "1.0.0",
  contact: CONTACT_INFO,
  license: LICENSE_INFO,
  termsOfService: TERMS_OF_SERVICE,
})
@service(#{ title: "Calling API - Calling AI Hold" })
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
@doc("API to hold AI SignalWire calls using the calling.ai_hold command.")
namespace CallingAPI.AIHold;

@route("/calls")
@tag("Calls")
interface AIHoldCommand {
  @summary("Hold an AI Call")
  @doc("To hold an existing AI call, you send a `POST` request to the Call resource with a payload including a `calling.ai_hold` command and the call ID. This pauses the AI conversation.")
  @operationId("hold-ai")
  @post
  hold(@body request: CallHoldRequest):
    | {
        @statusCode statusCode: 200;
        @body call: CallResponse;
      }
    | StatusCode401
    | StatusCode404
    | CallUpdate422Error
    | StatusCode500;
}
