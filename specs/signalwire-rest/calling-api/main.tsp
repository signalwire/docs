import "@typespec/http";
import "../types";
import "./calls";



using TypeSpec.Http;
using Types.StatusCodes;

@service(#{
  title: "Calling API",
})
@server("https://{space_name}.signalwire.com/api/calling", "Endpoint", {
  space_name: string = "{Your_Space_Name}";
})
@useAuth(BasicAuth)
@doc("""
    API to create/manage SignalWire's Calls.
    To create a new Call, you send a `POST` request to the Call resource with a payload including a `dial` command and additional nested `params`.
    """)
namespace CallingAPI;