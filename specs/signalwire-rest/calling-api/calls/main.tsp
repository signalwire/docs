import "@typespec/http";
import "@typespec/openapi";
import "../../types";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/examples.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/calls")
namespace CallingAPI.Calls {
  @tag("Calls")
  @friendlyName("Calls")
  interface Calls {
    @summary("Send Call Commands")
    @doc("""
    Unified JSON-RPC style endpoint for executing call methods through command-based dispatch.
    Send a request with the appropriate `command` field to invoke the desired call operation.
    This endpoint provides a single interface for all call-related methods including creation, updates, termination, and AI conversation control.
    """)
    @opExample(
      #{ parameters: dialCallExample },
      #{
        title: "Create new call",
        description: "Initiate a new outbound call with the dial command",
      }
    )
    @opExample(
      #{ parameters: updateCallExample },
      #{
        title: "Update active call",
        description: "Modify an existing call's parameters in real-time",
      }
    )
    @opExample(
      #{ parameters: hangupCallExample },
      #{
        title: "End call",
        description: "Terminate an active call immediately",
      }
    )
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
    @post
    @operationId("call-commands")
    callCommand(@body request: CallRequest):
      | {
          @statusCode statusCode: 200;
          @body call: CallResponse;
        }
      | StatusCode401
      | StatusCode404
      | CallCreate422Error
      | StatusCode500;
  }
}
