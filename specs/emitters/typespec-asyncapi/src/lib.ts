import { createTypeSpecLibrary, JSONSchemaType, paramMessage } from "@typespec/compiler";

export interface AsyncAPIEmitterOptions {
  /** Output file name. Default: `asyncapi.yaml`. */
  "output-file"?: string;
  /**
   * Emit a `receive` operation that mirrors each command's response, in addition to the
   * canonical `reply` block. This is a rendering shim for tools (e.g. Fern) that don't
   * render the AsyncAPI `reply` object. Default: `true`. Set `false` once the renderer
   * supports `reply` — the spec then carries only the standards-correct `reply`.
   */
  "response-receive-shim"?: boolean;
}

const EmitterOptionsSchema: JSONSchemaType<AsyncAPIEmitterOptions> = {
  type: "object",
  additionalProperties: false,
  properties: {
    "output-file": { type: "string", nullable: true },
    "response-receive-shim": { type: "boolean", nullable: true },
  },
  required: [],
};

export const $lib = createTypeSpecLibrary({
  name: "@signalwire/typespec-asyncapi",
  diagnostics: {
    "missing-server": {
      severity: "error",
      messages: {
        default: "AsyncAPI output requires a @server on the service namespace.",
      },
    },
    "rpc-method-on-non-op": {
      severity: "error",
      messages: {
        default: "@rpcMethod can only be applied to an operation.",
      },
    },
    "missing-channel": {
      severity: "error",
      messages: {
        default: "An @rpcMethod operation must be under a namespace marked with @channel.",
      },
    },
    "duplicate-rpc-method": {
      severity: "error",
      messages: {
        default: paramMessage`Duplicate @rpcMethod "${"method"}". JSON-RPC method names must be unique within a service.`,
      },
    },
    "duplicate-type-name": {
      severity: "error",
      messages: {
        default: paramMessage`Duplicate type name "${"value"}". Two distinct types resolve to the same component name; qualify or rename one.`,
      },
    },
  },
  state: {
    server: { description: "State for @server" },
    channel: { description: "State for @channel" },
    rpcMethod: { description: "State for @rpcMethod" },
    event: { description: "State for @event" },
    bearerAuth: { description: "State for @bearerAuth" },
    channelPerCommand: { description: "State for @channelPerCommand" },
  },
  emitter: {
    options: EmitterOptionsSchema,
  },
});

export const { reportDiagnostic, createDiagnostic, stateKeys } = $lib;
