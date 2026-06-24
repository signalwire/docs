import "@signalwire/typespec-asyncapi";

// Shared models, then one file per method family / event group.
import "./models/core.tsp";
import "./models/devices.tsp";
import "./models/media.tsp";
import "./dial/main.tsp";
import "./answer/main.tsp";
import "./end/main.tsp";
import "./connect/main.tsp";
import "./disconnect/main.tsp";
import "./collect/main.tsp";
import "./play-and-collect/main.tsp";
import "./queue/main.tsp";
import "./record/main.tsp";
import "./refer/main.tsp";
import "./pass/main.tsp";
import "./pay/main.tsp";
import "./play/main.tsp";
import "./detect/main.tsp";
import "./fax/main.tsp";
import "./tap/main.tsp";
import "./stream/main.tsp";
import "./transfer/main.tsp";
import "./conference/main.tsp";
import "./hold/main.tsp";
import "./denoise/main.tsp";
import "./send-digits/main.tsp";
import "./transcribe/main.tsp";
import "./echo/main.tsp";
import "./digit-bindings/main.tsp";
import "./live-transcribe/main.tsp";
import "./live-translate/main.tsp";
import "./rooms/main.tsp";
import "./ai/main.tsp";
import "./ai-sidecar/main.tsp";
import "./amazon-bedrock/main.tsp";
import "./ai-message/main.tsp";
import "./ai-hold/main.tsp";
import "./user-event/main.tsp";
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
