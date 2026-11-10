import "@typespec/http";
import "@typespec/openapi";
import "./tags.tsp";
import "./ai";
import "./calling";
import "./messaging";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

// Webhooks are callbacks SignalWire sends to your server. They are grouped by
// channel rather than by the resource that configures them, because a single
// callback is often shared: a SWAIG tool webhook fires for voice AI, Amazon
// Bedrock, sidecar agents, and text conversations alike. AI is its own channel
// precisely because it spans the others; everything else files under the
// channel it belongs to, including the SWML document-fetch webhooks (a call
// fetch is Calling, a message fetch is Messaging). This namespace holds no
// operations — it exists only to carry the @webhook declarations, which the
// decorator attaches to the enclosing service's OpenAPI `webhooks` object.
namespace SignalWireAPI.Webhooks;
