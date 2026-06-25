import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";
import "./models/requests.tsp";
import "../../../calling/events/state.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

@doc("""
  Subscribe to one or more contexts so you start receiving inbound events for
  them. This is how you ask SignalWire to deliver unsolicited notifications to
  your connection — most importantly the `calling.call.receive` event for an
  inbound call, which only reaches clients that have subscribed to the call's
  context.
  """)
@channel("signalwire.receive")
@summary("Subscribe to inbound events on one or more contexts")
@opExample(#{
  parameters: #{ contexts: #["pbx"] },
  returnType: #{ code: "200", message: "Receiving events" },
})
op receive(...ReceiveParams): Acknowledgement | Relay.Calling.CallReceiveEvent;

@doc("Unsubscribe from one or more contexts so you stop receiving their inbound events.")
@channel("signalwire.unreceive")
@summary("Unsubscribe from inbound events on one or more contexts")
@opExample(#{
  parameters: #{ contexts: #["pbx", "asdf"] },
  returnType: #{ code: "200", message: "Unreceiving events" },
})
op unreceive(...UnreceiveParams): Acknowledgement;
