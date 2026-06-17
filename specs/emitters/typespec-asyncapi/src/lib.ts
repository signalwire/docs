import { createTypeSpecLibrary, JSONSchemaType, paramMessage } from "@typespec/compiler";

export interface AsyncAPIEmitterOptions {
  /** Output file name. Default: `asyncapi.yaml`. */
  "output-file"?: string;
}

const EmitterOptionsSchema: JSONSchemaType<AsyncAPIEmitterOptions> = {
  type: "object",
  additionalProperties: false,
  properties: {
    "output-file": { type: "string", nullable: true },
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
  },
  emitter: {
    options: EmitterOptionsSchema,
  },
});

export const { reportDiagnostic, createDiagnostic, stateKeys } = $lib;
