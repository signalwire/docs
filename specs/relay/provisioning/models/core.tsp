import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Provisioning;

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
