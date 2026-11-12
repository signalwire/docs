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
  /**
   * How operations are grouped into channels:
   * - `multi` (default): every `@channel` operation gets its own root-addressed channel. An
   *   operation WITH request parameters is a normal send/reply command; an operation with NO
   *   parameters models a receive-only channel — only `receive` ops for the server-pushed events
   *   it returns, no `send` op or request frame. This is the AsyncAPI 3.0 per-operation-channel idiom.
   * - `single`: collapse the entire API onto ONE channel (the single WebSocket connection),
   *   with every method/event as an operation on it. This is the idiomatic AsyncAPI shape for
   *   a single-socket, payload-routed protocol (cf. Kraken/Slack request-reply examples).
   */
  "channel-mode"?: "multi" | "single";
}

const EmitterOptionsSchema: JSONSchemaType<AsyncAPIEmitterOptions> = {
  type: "object",
  additionalProperties: false,
  properties: {
    "output-file": { type: "string", nullable: true },
    "response-receive-shim": { type: "boolean", nullable: true },
    "channel-mode": { type: "string", enum: ["multi", "single"], nullable: true },
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
    "channel-on-non-op": {
      severity: "error",
      messages: {
        default: "@channel can only be applied to an operation.",
      },
    },
    "missing-channel": {
      severity: "error",
      messages: {
        default: "AsyncAPI output requires at least one operation marked with @channel.",
      },
    },
    "duplicate-channel": {
      severity: "error",
      messages: {
        default: paramMessage`Duplicate @channel "${"method"}". Channel names must be unique within a service.`,
      },
    },
    "reply-on-non-model": {
      severity: "error",
      messages: {
        default: "@reply can only be applied to a model.",
      },
    },
    "reply-without-request": {
      severity: "error",
      messages: {
        default: paramMessage`@channel "${"method"}" has no request parameters (a receive-only channel) but returns a @reply/@error model. A reply correlates to a request; either give the operation request parameters or return only server-pushed event models.`,
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
    reply: { description: "State for @reply" },
    bearerAuth: { description: "State for @bearerAuth" },
  },
  emitter: {
    options: EmitterOptionsSchema,
  },
});

export const { reportDiagnostic, createDiagnostic, stateKeys } = $lib;
