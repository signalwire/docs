import "@signalwire/typespec-asyncapi";

import "./models/core.tsp";
import "./operations/audio/main.tsp";
import "./operations/hand/main.tsp";
import "./operations/lifecycle/main.tsp";
import "./operations/layout/main.tsp";
import "./operations/member/main.tsp";
import "./operations/volume/main.tsp";
import "./operations/digit/main.tsp";
import "./operations/settings/main.tsp";
import "./operations/subscriber/main.tsp";
import "./operations/events/main.tsp";
import "./events/shared.tsp";

using SignalWire.AsyncAPI;

@doc("""
  Call Fabric is SignalWire's unified calling surface — the model behind Resources,
  Addresses, and Subscribers, used by the v4 browser SDK. Over a Relay connection you
  control call legs and conference members with the `call.*` methods (mute, deaf,
  layout, member management, and more) and register a subscriber's presence with
  `subscriber.online` / `subscriber.offline`.
  
  Call Fabric addresses call legs explicitly with a `{node_id, call_id, member_id}`
  target rather than the server-resolved `node_id` used by the `calling` service, and it
  is a **4.0+** surface: a connection must authenticate at protocol major 4 (typically
  with a Subscriber Access Token) to use it. React to what happens with the `call.state`
  and member events.
  """)
namespace Relay.Fabric;
