import "@typespec/http";
import "@typespec/openapi";
import "../types";
import "./logs";
import "../_globally_shared/const.tsp";
import "../../_shared/auth.tsp";
import "./tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/api/fax")
namespace SignalWireAPI.Fax;
