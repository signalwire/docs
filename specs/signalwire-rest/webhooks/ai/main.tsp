import "@typespec/http";
import "@typespec/openapi";
import "../tags.tsp";
import "./models/common.tsp";
import "./models/swaig.tsp";
import "./models/post-prompt.tsp";
import "./models/debug.tsp";
import "./models/sidecar.tsp";
import "./models/responses.tsp";
import "./operations.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

// SignalWire is the caller here, not the callee — these operations describe
// requests we send to the customer's endpoint, so the service's own auth scheme
// does not apply to them.
@tag(AI_WEBHOOKS_TAG)
@useAuth(NoAuth)
namespace SignalWireAPI.Webhooks.AI;
