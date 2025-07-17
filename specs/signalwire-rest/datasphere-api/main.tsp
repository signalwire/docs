import "@typespec/http";
import "../types";
import "./document";

using TypeSpec.Http;
using Types.StatusCodes;

@service(#{ title: "Datasphere API" })
@server(
  "https://{space_name}.signalwire.com/api/datasphere",
  "Endpoint",
  {
    space_name: string = "{Your_Space_Name}",
  }
)
@useAuth(BasicAuth)
@doc("An AI-powered API for document search.")
namespace DatasphereAPI;
