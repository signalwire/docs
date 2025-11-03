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
  "https://developer.signalwire.com/rest/signalwire-rest/endpoints/calling/calls/calling-ai-unhold",
  "Documentation for the calling.ai_unhold command to resume AI calls."
)
@info(#{
  title: "Calling API - Calling Unhold AI",
  version: "1.0.0",
  contact: CONTACT_INFO,
  license: LICENSE_INFO,
  termsOfService: TERMS_OF_SERVICE,
})
@service(#{ title: "Calling API - Calling AI Unhold" })
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
@doc("API to resume AI SignalWire calls using the calling.ai_unhold command.")
namespace CallingAPI.AIUnhold;

@route("/calls")
@tag("Calls")
interface CallingAIUnholdCommand {
  @summary("Unhold an AI Call")
  @doc("To resume an existing AI call that was previously held, you send a `POST` request to the Call resource with a payload including a `calling.ai_unhold` command and the call ID. This resumes the AI conversation.")
  @operationId("unhold-ai")
  @post
  unhold(@body request: CallUnholdRequest):
    | {
        @statusCode statusCode: 200;
        @body call: CallResponse;
      }
    | StatusCode401
    | StatusCode404
    | CallUpdate422Error
    | StatusCode500;
}
