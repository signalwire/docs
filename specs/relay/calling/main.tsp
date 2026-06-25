import "@signalwire/typespec-asyncapi";

// Shared models, then one file per method family / event group.
import "./models/core.tsp";
import "./models/devices.tsp";
import "./models/media.tsp";
import "./operations/dial/main.tsp";
import "./operations/answer/main.tsp";
import "./operations/end/main.tsp";
import "./operations/connect/main.tsp";
import "./operations/disconnect/main.tsp";
import "./operations/collect/main.tsp";
import "./operations/play-and-collect/main.tsp";
import "./operations/queue/main.tsp";
import "./operations/record/main.tsp";
import "./operations/refer/main.tsp";
import "./operations/pass/main.tsp";
import "./operations/pay/main.tsp";
import "./operations/play/main.tsp";
import "./operations/detect/main.tsp";
import "./operations/fax/main.tsp";
import "./operations/tap/main.tsp";
import "./operations/stream/main.tsp";
import "./operations/transfer/main.tsp";
import "./operations/conference/main.tsp";
import "./operations/hold/main.tsp";
import "./operations/denoise/main.tsp";
import "./operations/send-digits/main.tsp";
import "./operations/transcribe/main.tsp";
import "./operations/echo/main.tsp";
import "./operations/digit-bindings/main.tsp";
import "./operations/live-transcribe/main.tsp";
import "./operations/live-translate/main.tsp";
import "./operations/rooms/main.tsp";
import "./operations/ai/main.tsp";
import "./operations/ai-sidecar/main.tsp";
import "./operations/amazon-bedrock/main.tsp";
import "./operations/ai-message/main.tsp";
import "./operations/ai-hold/main.tsp";
import "./operations/user-event/main.tsp";
import "./events/state.tsp";
import "./events/refer.tsp";
import "./events/play.tsp";
import "./events/queue.tsp";
import "./events/collect.tsp";
import "./events/record.tsp";
import "./events/detect.tsp";
import "./events/denoise.tsp";
import "./events/fax.tsp";
import "./events/tap.tsp";
import "./events/stream.tsp";
import "./events/transcribe.tsp";
import "./events/hold.tsp";
import "./events/send-digits.tsp";
import "./events/conference.tsp";
import "./events/echo.tsp";
import "./events/pay.tsp";

using SignalWire.AsyncAPI;

@doc("""
  The `calling` service lets you control voice calls over Relay: dial and answer
  calls, bridge legs together, play and collect media, record, run detection, add
  AI, and react to the `calling.call.*` events that report call and leg state as it
  changes.

  Use it from your backend — it's available in the server SDKs (Python, Node, Java,
  Ruby). To place a call directly from a browser, use the WebRTC service instead.
  """)
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
