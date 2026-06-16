import { createTypeSpecLibrary, JSONSchemaType } from "@typespec/compiler";

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
