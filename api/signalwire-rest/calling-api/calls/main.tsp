import "@typespec/http";
import "../../types";
import "./models/requests.tsp";
import "./models/responses.tsp";


using TypeSpec.Http;
using Types.StatusCodes;

@route("/calls")
namespace CallingAPI.Calls {
    
    @tag("Calls")
    @friendlyName("Calls")
    interface Calls {

        @summary("Create a Call")
        @doc("To create a new Call, you send a `POST` request to the Call resource with a payload including a `dial` command and additional nested `params`.")
        create(...CallCreateRequest):
        { @statusCode statusCode: 201; @body call: CallResponse; } |
        StatusCode401 |
        StatusCode404 |
        CallCreate422Error;


        @summary("Update a Call")
        @doc("To update an existing Call, you send a `PUT` request to the Call resource with a payload including an `update` command and additional nested `params`.")
        @put update(...CallUpdateRequest):
        { @statusCode statusCode: 200; @body call: CallResponse; } |
        StatusCode401 |
        StatusCode404 |
        CallUpdate422Error;
    }

    

     
}
