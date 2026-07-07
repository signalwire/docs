import "@signalwire/typespec-asyncapi";
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
import "./operations/call-events/main.tsp";
import "./events/shared.tsp";

using SignalWire.AsyncAPI;

@doc("""
  The `calling` service lets you control voice calls over Relay: dial and answer
  calls, bridge legs together, play and collect media, record, run detection, add
  AI, and react to the `calling.call.*` events that report call and leg state as it
  changes.

  Use it from your backend — it's available in the server SDKs (Python, Node, Java,
  Ruby). To place a call directly from a browser, use the WebRTC service instead.
  """)
namespace Relay.Calling;
