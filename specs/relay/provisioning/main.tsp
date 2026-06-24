import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

/**
 * Provision a Relay connector. A connector reports its identity and network
 * endpoints, and SignalWire returns the runtime configuration it should run with.
 * The service exposes a single method, `provisioning.configure`, and sends no
 * events. The only connector type supported today is `freeswitch`, which returns
 * a SIP profile.
 */
namespace Relay.Provisioning;

// ─────────────────────────────────────────────────────────────────────────────
// Shared result base
// ─────────────────────────────────────────────────────────────────────────────

/**
 * The `code` and `message` fields shared by every Relay response. `code` is a
 * string (e.g. `"200"`); any value other than `"200"` means the request failed.
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

  /** The connector's local endpoint, as an IPv4 address, e.g. `10.10.0.2`. */
  local_endpoint: string;

  /** The connector's external (public) endpoint as an IPv4 address, e.g. `8.8.8.8`. */
  external_endpoint: string;

  /** UUID of the Relay connector being configured. */
  relay_connector_id: string;
}

/**
 * The runtime configuration returned for your connector. For a `freeswitch`
 * target, this contains the SIP profile your connector should run with.
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
 * Request the runtime configuration for a connector. Supply the connector's
 * identity (`relay_connector_id`) and network endpoints (`local_endpoint`,
 * `external_endpoint`), and SignalWire returns its configuration. For a
 * `freeswitch` target, the response includes a SIP profile rendered as XML.
 */
@channel("provisioning.configure")
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
