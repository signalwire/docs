import "@signalwire/typespec-asyncapi";

import "./models/core.tsp";
import "./configure/main.tsp";

using SignalWire.AsyncAPI;

/**
 * Provision a Relay connector. A connector reports its identity and network
 * endpoints, and SignalWire returns the runtime configuration it should run with.
 * The service exposes a single method, `provisioning.configure`, and sends no
 * events. The only connector type supported today is `freeswitch`, which returns
 * a SIP profile.
 */
namespace Relay.Provisioning;
