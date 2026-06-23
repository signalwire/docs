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
 * The `calling` service controls voice calls over Relay: dialing, answering,
 * bridging, media playback/collection, recording, detection, AI, and the
 * asynchronous `calling.call.*` events that report call/leg state.
 *
 * **Audience:** server-side. Exposed by the server SDKs (Python, Node, Java, Ruby)
 * for backend call control. Browser clients place peer calls via the WebRTC (Verto)
 * service instead.
 */
@channel("calling")
@channelPerCommand
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
