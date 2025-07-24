import "@typespec/http";
import "@typespec/openapi3";
import "../types";
import "./logs";
import "../_globally_shared/const.tsp";
import "./tags.tsp";

using TypeSpec.Http;

@service(#{ title: "Voice API" })
@server(
  "https://{space_name}.${SERVER_URL}/voice",
  "Endpoint",
  {
    space_name: string = "YOUR_SPACE",
  }
)
@useAuth(BasicAuth)
@doc("An API to programmatically access information about SignalWire Voice activity.")
namespace VoiceAPI;
