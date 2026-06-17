import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

/**
 * The `provisioning` protocol lets a Relay **connector** request its runtime
 * configuration from SignalWire. The connector reports its identity and network
 * endpoints, and SignalWire returns the rendered connector configuration (for a
 * FreeSWITCH connector, a SIP profile as XML). This service is
 * connector-internal: a single method, no server-pushed events, and currently
 * only the `freeswitch` connector target is supported.
 */
@service(#{ title: "SignalWire Relay — Connector Provisioning" })
@server("production", #{
  host: "relay.signalwire.com",
  protocol: "wss",
  description: "SignalWire Relay WebSocket endpoint.",
})
@channel("provisioning")
@bearerAuth("JWT")
namespace Relay.Provisioning;

// ─────────────────────────────────────────────────────────────────────────────
// Shared result base
// ─────────────────────────────────────────────────────────────────────────────

/**
 * Standard `{code, message}` result fields shared by every Relay response.
 * `code` is a STRING (e.g. `"200"`); any value other than `"200"` is an error.
 */
model Result {
  /** Result code (string). `"200"` on success; e.g. `"400"`/`"404"` on error. */
  code: string;

  /** Human-readable result message. */
  message: string;
}

// ─────────────────────────────────────────────────────────────────────────────
// provisioning.configure
// ─────────────────────────────────────────────────────────────────────────────

/** The connector type being provisioned. Currently only `freeswitch` is supported. */
union ConnectorTarget {
  string,

  /** A FreeSWITCH connector. */
  freeswitch: "freeswitch",
}

model ConfigureParams {
  /** The connector type to provision. Currently only `freeswitch` is supported. */
  target: ConnectorTarget;

  /** The connector's local (internal) endpoint as an IPv4 address, e.g. `10.10.0.2`. */
  local_endpoint: string;

  /** The connector's external (public) endpoint as an IPv4 address, e.g. `8.8.8.8`. */
  external_endpoint: string;

  /** UUID of the Relay connector being configured. */
  relay_connector_id: string;
}

/**
 * The rendered connector configuration returned to the connector.
 *
 * Note: `profile` is the raw FreeSWITCH SIP profile **rendered as XML**, carried
 * as a single string. The precise shape (raw-XML string vs. a structured object)
 * is not specified by the source and is modeled here as an opaque string. Other
 * keys under `configuration` for non-`freeswitch` targets are unconfirmed.
 */
model Configuration {
  /** The FreeSWITCH SIP profile, rendered as an XML document. */
  profile: string;
}

model ConfigureResult {
  ...Result;

  /** The rendered connector configuration. */
  configuration: Configuration;
}

/**
 * Request a connector's SignalWire configuration. The connector supplies its
 * identity (`relay_connector_id`) and network endpoints (`local_endpoint`,
 * `external_endpoint`) and receives its configuration payload — for a
 * `freeswitch` target, a FreeSWITCH SIP profile rendered as XML.
 */
@rpcMethod("provisioning.configure")
@summary("Request SignalWire connector configuration")
@opExample(#{
  parameters: #{
    target: "freeswitch",
    local_endpoint: "10.10.0.2",
    external_endpoint: "8.8.8.8",
    relay_connector_id: "b6ef5331-dce8-4c56-890d-949039398361",
  },
  returnType: #{
    code: "200",
    message: "OK",
    configuration: #{ profile: "<FS profile XML>..." },
  },
})
op configure(...ConfigureParams): ConfigureResult;
