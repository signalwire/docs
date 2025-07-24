import "@typespec/http";
import "@typespec/openapi3";
import "../types";
import "./logs";
import "../_globally_shared/const.tsp";
import "./tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@tagMetadata(LOGS_TAG, LOGS_TAG_METADATA)
@service(#{ title: "Fax API" })
@externalDocs(
  "https://developers.signalwire.com",
  "Find more information about this and other SignalWire APIs."
)
@info(#{
  title: "Fax API",
  version: "1.0.0",
  contact: CONTACT_INFO,
  license: LICENSE_INFO,
  termsOfService: TERMS_OF_SERVICE,
})
@server(
  "https://{space_name}.${SERVER_URL}/fax",
  "Endpoint",
  {
    space_name: string = "{Your_Space_Name}",
  }
)
@useAuth(BasicAuth)
@doc("An API to programmatically access information about SignalWire fax activity.")
namespace FaxAPI;