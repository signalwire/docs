import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("Parameters for `call.digit.send`.")
@summary("Send digits parameters")
model DigitSendParams {
  @doc("The call leg sending the digits — your own leg on this call.")
  self: Target;

  @doc("The DTMF digits to send.")
  @example("1234#")
  digits: string;
}
