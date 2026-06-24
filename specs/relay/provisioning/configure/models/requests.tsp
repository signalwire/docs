import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Provisioning;

/** The connector type being provisioned. Currently only `freeswitch` is supported. */
union ConnectorTarget {
  string,

  /** A FreeSWITCH connector. */
  freeswitch: "freeswitch",
}

model ConfigureParams {
  /** The connector type to provision. Currently only `freeswitch` is supported. */
  target: ConnectorTarget;

  /** The connector's local endpoint, as an IPv4 address, e.g. `10.10.0.2`. */
  local_endpoint: string;

  /** The connector's external (public) endpoint as an IPv4 address, e.g. `8.8.8.8`. */
  external_endpoint: string;

  /** UUID of the Relay connector being configured. */
  relay_connector_id: string;
}
