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
  
  Call Fabric addresses each call leg explicitly with a `{node_id, call_id, member_id}`
  target. The `call.*` and `subscriber.*` methods need a connection opened with
  `signalwire.connect` at `version` 4.0 (typically with a Subscriber Access Token); on
  an older protocol version they fail with JSON-RPC error `-32001`. React to what
  happens with the `call.state` and member events.
  """)
namespace Relay.Fabric;
