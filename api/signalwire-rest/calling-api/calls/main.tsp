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
        create(...CallCreateRequest):
        { @statusCode statusCode: 201; @body call: CallResponse; } |
        StatusCode401 |
        StatusCode404 |
        CallCreate422Error;


        @summary("Update a Call")
        @doc("To update an existing call, you send a `PUT` request to the Call resource with a payload including a `command` and additional nested `params`.")
        @opExample(#{parameters: hangupCallExample}, #{title: "Hangup call", description: "Terminate an active call by hanging up"})
        @put update(@body request: CallUpdateRequest):
        { @statusCode statusCode: 200; @body call: CallResponse; } |
        StatusCode401 |
        StatusCode404 |
        CallUpdate422Error;
    }

    

     
}