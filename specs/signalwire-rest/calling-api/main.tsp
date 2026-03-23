import "@typespec/http";
import "@typespec/openapi";
import "../types";
import "./calls";
import "../_globally_shared/const.tsp";
import "../../_shared/auth.tsp";
import "../../_shared/webhook/decorator.tsp";
import "./tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/api/calling")
namespace SignalWireAPI.Calling;
