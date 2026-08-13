import "@typespec/http";
import "@typespec/openapi";
import "../tags.tsp";
import "./models/status-callbacks.tsp";
import "./models/inbound-message.tsp";
import "./operations.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

// SignalWire is the caller here, not the callee — these operations describe
// requests we send to the customer's endpoint, so the service's own auth scheme
// does not apply to them.
@tag(MESSAGING_WEBHOOKS_TAG)
@useAuth(NoAuth)
namespace SignalWireAPI.Webhooks.Messaging;
