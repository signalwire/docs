import "@typespec/http";
import "../types";
import "./tokens";




using TypeSpec.Http;
using Types.StatusCodes;

@service({
  title: "Chat API",
})
@server("https://{space_name}.signalwire.com/api/chat", "Endpoint", {
  space_name: string = "{Your_Space_Name}";
})
@useAuth(BasicAuth)
@doc("""
    An API to programmatically create your own Chat Applications.
    """)
namespace ChatAPI;