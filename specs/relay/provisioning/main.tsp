import "@signalwire/typespec-asyncapi";

import "./operations/configure/main.tsp";

using SignalWire.AsyncAPI;

@doc("""
  Provision a Relay connector. This service is used by a self-hosted connector
  (such as a FreeSWITCH deployment) that fetches its runtime configuration from
  SignalWire on startup; if you are not operating your own connector, this page
  does not apply to you. A connector reports its identity and network endpoints,
  and SignalWire returns the runtime configuration it should run with. The
  `relay_connector_id` a connector reports is the ID of the connector you set up
  on your own SignalWire account — your own value, not an opaque one you need to
  obtain elsewhere.
  The service exposes a single method, `provisioning.configure`, and sends no
  events. The only connector type supported today is `freeswitch`, which returns
  a SIP profile.
  """)
namespace Relay.Provisioning;
