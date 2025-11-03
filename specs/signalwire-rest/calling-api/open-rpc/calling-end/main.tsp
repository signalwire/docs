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
  "https://developer.signalwire.com/rest/signalwire-rest/endpoints/calling/calls/calling-end",
  "Documentation for the calling.end command to hangup calls."
)
@info(#{
  title: "Calling API - Hangup Call",
  version: "1.0.0",
  contact: CONTACT_INFO,
  license: LICENSE_INFO,
  termsOfService: TERMS_OF_SERVICE,
})
@service(#{ title: "Calling API - Hangup Call" })
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
@doc("API to end/hangup SignalWire calls using the calling.end command.")
namespace CallingAPI.End;

@route("/calls")
@tag("Calls")
interface CallingEndCommand {
  @summary("Hangup a Call")
  @doc("To hangup an existing call, you send a `POST` request to the Call resource with a payload including a `calling.end` command and the call ID.")
  @operationId("hangup-call")
  @post
  end(@body request: CallHangupRequest):
    | {
        @statusCode statusCode: 200;
        @body call: CallResponse;
      }
    | StatusCode401
    | StatusCode404
    | CallUpdate422Error
    | StatusCode500;
}
