import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";
import "../../live-transcribe/models/requests.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.live_translate
//
// Superset of live_transcribe's action: adds `inject`. Same key-discriminated
// modeling.
// ─────────────────────────────────────────────────────────────────────────────

/**
 * The live-translate action to perform. Set exactly one of `start`, `stop`,
 * `summarize`, or `inject`.
 */
model LiveTranslateAction {
  /** Start live translation. */
  start?: LiveTranslateStart;

  /** Stop live translation. */
  stop?: LiveActionStop;

  /** Summarize the live translation so far. */
  summarize?: LiveSummarize;

  /** Insert a message to be translated and spoken into the call. */
  inject?: LiveTranslateInject;
}

model LiveTranslateParams {
  ...CallAddress;

  /** The action to perform. Set exactly one of `start`, `stop`, `summarize`, or `inject`. */
  action: LiveTranslateAction;

  /** An `http` or `https` URL to receive translation status updates. */
  status_url?: url;
}
