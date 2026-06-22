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
 */
@channel("calling")
namespace Relay.Calling;
