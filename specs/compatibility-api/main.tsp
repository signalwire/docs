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
import "./laml-bins/main.tsp";
import "./messages/main.tsp";
import "./recordings/main.tsp";
import "./transcriptions/main.tsp";
import "./queues/main.tsp";
import "./tokens/main.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@service({
  title: "Compatibility API",
})
@info({
  version: "1.0.0",
  description: "SignalWire Compatibility API",
})
@server("https://{space_url}/api/laml/2010-04-01", "SignalWire Compatibility API", {
  space_url: string,
})
namespace CompatibilityAPI;
