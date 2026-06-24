import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../events/collect.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

/**
 * Plays media to the caller and collects their input at the same time, so you
 * can prompt and gather a response in one step. Collected input arrives
 * asynchronously in `calling.call.collect` events keyed on your `control_id`.
 * Only one play-and-collect can run on a call at a time.
 */
// NOTE: no @opExample here — the required `play: PlayMedia[]` is a @discriminator
// union, and TypeSpec example values cannot narrow a discriminator base.
@channel("calling.play_and_collect")
@summary("Play media and collect input")
op playAndCollect(...PlayAndCollectParams): PlayAndCollectResult | CallCollectEvent;

/** Stops a running play-and-collect, halting both the media playback and the input collection. */
@channel("calling.play_and_collect.stop")
@summary("Stop an active play-and-collect")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", control_id: "pc-1" },
  returnType: #{ code: "200", message: "Stopping play and collect" },
})
op playAndCollectStop(...PlayAndCollectStopParams): PlayAndCollectStopResult;

/** Adjusts the playback volume of a running play-and-collect on the fly, without stopping it. */
@channel("calling.play_and_collect.volume")
@summary("Change play-and-collect volume")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", control_id: "pc-1", volume: 3.0 },
  returnType: #{ code: "200", message: "Changed play and collect volume" },
})
op playAndCollectVolume(...PlayAndCollectVolumeParams): PlayAndCollectVolumeResult;
