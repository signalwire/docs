import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";

import "./tags.tsp";
import "./accounts/main.tsp";
import "./applications/main.tsp";
import "./available-phone-numbers/main.tsp";
import "./calls/main.tsp";
import "./conferences/main.tsp";
import "./faxes/main.tsp";
import "./incoming-phone-numbers/main.tsp";
import "./imported-phone-numbers/main.tsp";
import "./cxml-scripts/main.tsp";
import "./messages/main.tsp";
import "./recordings/main.tsp";
import "./transcriptions/main.tsp";
import "./queues/main.tsp";
import "./tokens/main.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@tagMetadata(LAML_BINS_TAG, LAML_BINS_TAG_METADATA)
@service(#{ title: "Compatibility API" })
@info(#{
  version: "1.0.0",
})
@server("https://{space_url}/api/laml/2010-04-01", "SignalWire Compatibility API", {
  space_url: string,
})
@tagMetadata(CXML_SCRIPTS_TAG, CXML_SCRIPTS_TAG_METADATA)
namespace CompatibilityAPI;
