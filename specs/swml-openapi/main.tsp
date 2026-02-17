import "@typespec/http";
import "@typespec/openapi";
import "../swml/main.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@info(#{
  title: "SWML Schema",
  version: "1.0.0",
})
@service(#{ title: "SWML Schema" })
@doc("Schema definitions for SignalWire Markup Language (SWML). This spec exposes SWML type definitions for use with the Fern Schema documentation component.")
namespace SWMLSchema;

@extension("x-fern-ignore", true)
@route("/swml")
@post
op validateSwml(@body body: SWMLObject): SWMLObject;
