import "@signalwire/typespec-asyncapi";

// Shared models, then one file per method family / event group.
import "./common.tsp";
import "./methods/core-control.tsp";
import "./methods/collect-input.tsp";
import "./methods/queue-record-refer.tsp";
import "./methods/pay-play.tsp";
import "./methods/detect-fax-tap-stream.tsp";
import "./methods/transfer-conf-hold-digits.tsp";
import "./methods/transcribe-misc.tsp";
import "./methods/ai.tsp";
import "./events/core.tsp";
import "./events/media-1.tsp";
import "./events/media-2.tsp";

using SignalWire.AsyncAPI;

/**
 * The `calling` service lets you control voice calls over Relay: dial and answer
 * calls, bridge legs together, play and collect media, record, run detection, add
 * AI, and react to the `calling.call.*` events that report call and leg state as it
 * changes.
 *
 * Use it from your backend — it's available in the server SDKs (Python, Node, Java,
 * Ruby). To place a call directly from a browser, use the WebRTC service instead.
 */
// calling.call.state fires for any call the client controls, across its whole lifecycle and
// regardless of which command is in flight — verified in mod_infrastructure/relay.c: it fires via
// relay_call_event_fire keyed by call_id (not by request), and is delivered to clients. It is not
// the correlated reply to a specific command, so it rides every command's receive union.
//   NB: calling.error is NOT here (and not modeled at all) — it is internal-only (DB/UI), never
//   delivered to the client SDK (relay_call_error_event_create rewrites its event_channel).
//   calling.call.receive is also NOT here — it is the unsolicited inbound-call notification offered
//   to context-subscribed clients (relay.c:17564 task queue; Call.md CallNetwork(context) →
//   onInboundCall), so it is attached to signalwire.receive (the subscription) instead.
@globalEvents(CallStateEvent)
namespace Relay.Calling;
