import "@typespec/http";
import "../../types";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/examples.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/calls")
namespace CallingAPI.Calls {
  @tag("Calls")
  @friendlyName("Calls")
  interface Calls {
    @summary("Create a Call")
    @doc("To create a new call, you send a `POST` request to the Call resource with a payload including a `dial` command and additional nested `params`.")
    create(@body request: CallCreateRequest):
      | {
          @statusCode statusCode: 201;
          @body call: CallResponse;
        }
      | StatusCode401
      | StatusCode404
      | CallCreate422Error |
        StatusCode500;

    @summary("Update a Call")
    @doc("To update an existing call, you send a `PUT` request to the Call resource with a payload including a `command` and additional nested `params`.")
    @opExample(
      #{ parameters: holdCallExample },
      #{
        title: "Hold active call",
        description: "Put an active AI call on hold, pausing the conversation",
      }
    )
    @opExample(
      #{ parameters: unholdCallExample },
      #{
        title: "Unhold active call",
        description: "Resume an AI call that was previously put on hold",
      }
    )
    @opExample(
      #{ parameters: aiMessageExample },
      #{
        title: "Inject AI message",
        description: "Send a message to the AI conversation to modify behavior or add context",
      }
    )
    //@opExample(#{parameters: #{request: #{command: "update", params: #{id: "3fa85f64-5717-4562-b3fc-2c963f66afa6", url: "https://example.com/swml", fallback_url: "https://example.com/fallback"}}}}, #{title: "Update active call", description: "Modify an active call's behavior using new SWML instructions"})
    @put
    update(@body request: CallUpdateRequest):
      | {
          @statusCode statusCode: 200;
          @body call: CallResponse;
        }
      | StatusCode401
      | StatusCode404
      | CallUpdate422Error |
        StatusCode500;
  }
}
