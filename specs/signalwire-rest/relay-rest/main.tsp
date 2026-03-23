import "@typespec/http";
import "@typespec/openapi";
import "../types";
import "./addresses";
import "./domain-applications";
import "./sip-endpoints";
import "./sip-profile";
import "./phone-numbers";
import "./number-groups";
import "./mfa";
import "./verified-caller-ids";
import "./campaign-registry";
import "./queues";
import "./recordings";
import "./short-codes";
import "../_globally_shared/const.tsp";
import "../../_shared/auth.tsp";
import "./tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/api/relay/rest")
namespace SignalWireAPI.RelayRest;
