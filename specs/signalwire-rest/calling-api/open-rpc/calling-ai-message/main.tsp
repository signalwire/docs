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
  "https://developer.signalwire.com/rest/signalwire-rest/endpoints/calling/calls/calling-ai-message",
  "Documentation for the calling.ai_message command to inject messages into AI conversations."
)
@info(#{
  title: "Calling API - Inject AI Message",
  version: "1.0.0",
  contact: CONTACT_INFO,
  license: LICENSE_INFO,
  termsOfService: TERMS_OF_SERVICE,
})
@service(#{ title: "Calling API - Calling Inject AI Message" })
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
@doc("API to inject messages into AI SignalWire call conversations using the calling.ai_message command.")
namespace CallingAPI.AIMessage;

@route("/calls")
@tag("Calls")
interface CallingAIMessageCommand {
  @summary("Inject AI Message")
  @doc("To inject a message into an existing AI call conversation, you send a `POST` request to the Call resource with a payload including a `calling.ai_message` command, the call ID, and message details. Messages can be injected as system instructions, user messages, or assistant responses.")
  @operationId("inject-ai-message")
  @post
  message(@body request: CallAIMessageRequest):
    | {
        @statusCode statusCode: 200;
        @body call: CallResponse;
      }
    | StatusCode401
    | StatusCode404
    | CallUpdate422Error
    | StatusCode500;
}
