import "@typespec/http";
import "@typespec/openapi";
import "../types";
import "./logs";
import "./messages";
import "./whatsapp-businesses";
import "./whatsapp-numbers";
import "./whatsapp-templates";
import "../_globally_shared/const.tsp";
import "../../_shared/auth.tsp";
import "./tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/api/messaging")
namespace SignalWireAPI.Message;
