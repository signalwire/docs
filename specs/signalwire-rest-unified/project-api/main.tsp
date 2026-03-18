import "@typespec/http";
import "@typespec/openapi";
import "../types";
import "./tokens";
import "../_globally_shared/const.tsp";
import "../../_shared/auth.tsp";
import "./tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/api/project")
namespace SignalWireAPI.Project;
