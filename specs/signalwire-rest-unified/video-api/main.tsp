import "@typespec/http";
import "@typespec/openapi";
import "../types";
import "../_globally_shared/const.tsp";
import "../../_shared/auth.tsp";
import "./rooms";
import "./streams";
import "./room-sessions";
import "./room-tokens";
import "./room-recordings";
import "./conferences";
import "./conference-tokens";
import "./logs";
import "./tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/api/video")
namespace SignalWireAPI.Video;
