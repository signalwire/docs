import "@typespec/http";
import "@typespec/openapi";
import "../types";
import "../../_shared/auth.tsp";
import "./tokens";
import "./tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/api/chat")
namespace SignalWireAPI.Chat;
