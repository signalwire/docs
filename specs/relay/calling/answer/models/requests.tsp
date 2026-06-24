import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AnswerParams {
  ...CallAddress;

  /**
   * Audio codecs to offer when answering, in preference order. If you omit this,
   * SignalWire picks suitable codecs for you. Every codec you list must be
   * supported by the call type — otherwise the request fails with `"400"`. Phone
   * calls accept a narrower set than `sip` or `webrtc` calls, so check
   * `call.device.type` in the `calling.call.state` events to know which call type
   * you're answering.
   */
  codecs?: AnswerCodec[];
}
