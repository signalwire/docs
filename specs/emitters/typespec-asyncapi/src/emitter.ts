import {
  EmitContext,
  emitFile,
  getDoc,
  getExamples,
  getOpExamples,
  getService,
  getSummary,
  Model,
  Namespace,
  Operation,
  Program,
  resolvePath,
  serializeValueAsJson,
  Type,
} from "@typespec/compiler";
import { applyWebSocketBindings } from "./bindings/ws.js";
import { getBearerAuth, getChannel, getChannelPerCommand, getEvent, getRpcMethod, getServer } from "./decorators.js";
import { AsyncAPIEmitterOptions, reportDiagnostic } from "./lib.js";
import { createSchemaRegistry, encodedPropName, propertySchema, RefFn } from "./schema-emitter.js";
import { serialize } from "./serialize.js";
import {
  AsyncAPI3Document,
  AsyncAPIChannel,
  AsyncAPIComponents,
  AsyncAPIMessage,
  AsyncAPIOperation,
  AsyncAPIRef,
  AsyncAPISchema,
  AsyncAPIServer,
  SchemaOrRef,
} from "./types.js";

/** The mutable doc-level component/operation maps the channel emitters write into. */
interface EmitTarget {
  schemas: Record<string, AsyncAPISchema>;
  messages: Record<string, AsyncAPIMessage>;
  operations: Record<string, AsyncAPIOperation>;
}

/**
 * Per-channel-namespace coordination shared between the rpc pass and the event pass:
 * which event models were already attached to a command channel (so the central-events
 * pass skips them) and which event component messages were already emitted (so the
 * schema/message are defined exactly once and merely referenced from each channel).
 */
interface EventState {
  /** Event component message ids already emitted (`lcfirst(model.name)`). */
  emitted: Set<string>;
  /** Event models already attached to at least one command channel. */
  referenced: Set<Model>;
}

function findServiceNamespace(program: Program): Namespace | undefined {
  let found: Namespace | undefined;
  (function visit(ns: Namespace): void {
    if (getService(program, ns)) found ??= ns;
    ns.namespaces.forEach(visit);
  })(program.getGlobalNamespaceType());
  return found;
}

function pascal(s: string): string {
  return s.replace(/(^|[._-])([a-z])/g, (_m, _sep, c) => c.toUpperCase());
}
function lcfirst(s: string): string {
  return s.charAt(0).toLowerCase() + s.slice(1);
}

/** Placeholder JSON-RPC id used in synthesized request/reply/event example frames. */
const EXAMPLE_ID = "550e8400-e29b-41d4-a716-446655440000";

/** Schema for an operation's parameters: a `$ref` when it's a single spread model, else an inline object. */
function paramsSchema(program: Program, op: Operation, ref: RefFn): SchemaOrRef {
  const params = op.parameters;
  const spreads = params.sourceModels.filter((s) => s.usage === "spread");
  if (spreads.length === 1 && spreads[0].model.name) {
    return ref(spreads[0].model);
  }
  const properties: Record<string, SchemaOrRef> = {};
  const required: string[] = [];
  for (const prop of params.properties.values()) {
    const name = encodedPropName(program, prop);
    properties[name] = propertySchema(program, prop, ref);
    if (!prop.optional) required.push(name);
  }
  const schema: AsyncAPISchema = { type: "object", properties };
  if (required.length) schema.required = required;
  return schema;
}

/**
 * Partition an operation's return type into the response arm(s) and any `@event` arm(s).
 * An event is just another message the operation can return — assigned by listing it in the
 * return type union (no routing decorator). The non-event arm(s) are the correlated response.
 */
function partitionReturn(program: Program, returnType: Type): { responseArms: Type[]; eventArms: Model[] } {
  const arms: Type[] = returnType.kind === "Union" ? [...returnType.variants.values()].map((v) => v.type) : [returnType];
  const responseArms: Type[] = [];
  const eventArms: Model[] = [];
  for (const arm of arms) {
    if (arm.kind === "Model" && getEvent(program, arm)) eventArms.push(arm);
    else responseArms.push(arm);
  }
  return { responseArms, eventArms };
}

/** Build the JSON-RPC `result` schema from the non-event response arm(s). */
function resultSchema(responseArms: Type[], ref: RefFn): SchemaOrRef | undefined {
  if (responseArms.length === 0) return undefined;
  if (responseArms.length === 1) return ref(responseArms[0]);
  return { oneOf: responseArms.map((a) => ref(a)) };
}

/**
 * Emit the `signalwire.event` carrier frame schema + component message for an event model
 * exactly once (component-level). Multiple channels then merely `$ref` it — no duplication.
 */
function ensureEventComponent(
  program: Program,
  model: Model,
  ref: RefFn,
  target: EmitTarget,
  emitted: Set<string>,
): { msgId: string; eventType: string } {
  const eventType = getEvent(program, model)!;
  const msgId = lcfirst(model.name);
  if (!emitted.has(msgId)) {
    emitted.add(msgId);
    const frameId = `${model.name}Frame`;
    target.schemas[frameId] = {
      type: "object",
      required: ["jsonrpc", "method", "id", "params"],
      properties: {
        jsonrpc: { type: "string", const: "2.0" },
        method: { type: "string", const: "signalwire.event" },
        id: { type: "string", format: "uuid" },
        params: {
          type: "object",
          required: ["event_type", "params"],
          properties: {
            event_type: { type: "string", const: eventType },
            event_channel: { type: "string" },
            timestamp: { type: "number" },
            space_id: { type: "string" },
            project_id: { type: "string" },
            params: ref(model),
          },
        },
      },
    };
    target.messages[msgId] = {
      name: eventType,
      title: `${eventType} event`,
      contentType: "application/json",
      payload: { $ref: `#/components/schemas/${frameId}` },
    };
    // Wrap any @example on the event model into a full signalwire.event carrier frame.
    for (const ex of getExamples(program, model)) {
      const params = serializeValueAsJson(program, ex.value, model);
      (target.messages[msgId].examples ??= []).push({
        payload: {
          jsonrpc: "2.0",
          method: "signalwire.event",
          id: EXAMPLE_ID,
          params: { event_type: eventType, params },
        },
      });
    }
  }
  return { msgId, eventType };
}

/** Reference an event message on a channel and emit a dedicated `receive` op for it (own label). */
function emitEventReceiveOp(
  target: EmitTarget,
  chId: string,
  opId: string,
  msgId: string,
  eventType: string,
  channelMessages: Record<string, AsyncAPIRef>,
): void {
  channelMessages[msgId] = { $ref: `#/components/messages/${msgId}` };
  target.operations[opId] = {
    action: "receive",
    channel: { $ref: `#/channels/${chId}` },
    title: eventType,
    messages: [{ $ref: `#/channels/${chId}/messages/${msgId}` }],
  };
}

function emitRpcMethods(
  program: Program,
  ns: Namespace,
  channelId: string,
  ref: RefFn,
  target: EmitTarget,
  channelMessages: Record<string, AsyncAPIRef>,
  seen: Set<string>,
  channels: Record<string, AsyncAPIChannel>,
  serverName: string,
  perCommand: boolean,
  shim: boolean,
  events: EventState,
): void {
  (function visit(n: Namespace): void {
    for (const op of n.operations.values()) {
      const method = getRpcMethod(program, op);
      if (!method) continue;
      if (seen.has(method)) {
        reportDiagnostic(program, { code: "duplicate-rpc-method", target: op, format: { method } });
        continue;
      }
      seen.add(method);

      const baseId = pascal(method); // e.g. CallingDial
      const opKey = lcfirst(baseId);
      const reqMsgId = `${opKey}Request`;
      const resMsgId = `${opKey}Response`;

      // The return type carries the response (non-event arm[s]) plus any events the command emits.
      const { responseArms, eventArms } = partitionReturn(program, op.returnType);
      const result = resultSchema(responseArms, ref);

      target.schemas[`${baseId}Request`] = {
        type: "object",
        required: ["jsonrpc", "id", "method", "params"],
        properties: {
          jsonrpc: { type: "string", const: "2.0" },
          id: { type: "string", format: "uuid" },
          method: { type: "string", const: method },
          params: paramsSchema(program, op, ref),
        },
      };
      target.schemas[`${baseId}Response`] = {
        type: "object",
        required: ["jsonrpc", "id"],
        properties: {
          jsonrpc: { type: "string", const: "2.0" },
          id: { type: "string", format: "uuid" },
          ...(result ? { result } : {}),
        },
      };

      target.messages[reqMsgId] = {
        name: `${method}.request`,
        title: `${method} request`,
        contentType: "application/json",
        correlationId: { location: "$message.payload#/id" },
        payload: { $ref: `#/components/schemas/${baseId}Request` },
      };
      target.messages[resMsgId] = {
        name: `${method}.response`,
        title: `${method} response`,
        contentType: "application/json",
        correlationId: { location: "$message.payload#/id" },
        payload: { $ref: `#/components/schemas/${baseId}Response` },
      };

      // Wrap any @opExample into JSON-RPC request/response example frames (params -> request,
      // returnType -> response). Serialize the result against the single response arm when there
      // is one (avoids union-arm ambiguity now that events may share the return).
      for (const ex of getOpExamples(program, op)) {
        if (ex.parameters) {
          const params = serializeValueAsJson(program, ex.parameters, op.parameters);
          (target.messages[reqMsgId].examples ??= []).push({
            payload: { jsonrpc: "2.0", id: EXAMPLE_ID, method, params },
          });
        }
        if (ex.returnType) {
          const resultType = responseArms.length === 1 ? responseArms[0] : op.returnType;
          const resultValue = serializeValueAsJson(program, ex.returnType, resultType);
          (target.messages[resMsgId].examples ??= []).push({
            payload: { jsonrpc: "2.0", id: EXAMPLE_ID, result: resultValue },
          });
        }
      }

      const summary = getSummary(program, op);
      // Per-command channel id is derived from the same base as the operation key so all refs stay consistent.
      const chId = perCommand ? opKey : channelId;

      // In per-command mode, mint a dedicated channel for this command.
      let msgs = channelMessages;
      if (perCommand) {
        const perMsgs: Record<string, AsyncAPIRef> = {};
        const desc = summary ?? getDoc(program, op);
        channels[chId] = {
          address: "/",
          title: method,
          ...(desc ? { description: desc } : {}),
          servers: [{ $ref: `#/servers/${serverName}` }],
          messages: perMsgs,
        };
        msgs = perMsgs;
      }

      msgs[reqMsgId] = { $ref: `#/components/messages/${reqMsgId}` };
      msgs[resMsgId] = { $ref: `#/components/messages/${resMsgId}` };

      // Send op (request) — keeps the canonical, correlated `reply` (standards-correct AsyncAPI 3.0).
      target.operations[opKey] = {
        action: "send",
        channel: { $ref: `#/channels/${chId}` },
        title: method,
        ...(summary ? { summary } : {}),
        messages: [{ $ref: `#/channels/${chId}/messages/${reqMsgId}` }],
        reply: {
          channel: { $ref: `#/channels/${chId}` },
          messages: [{ $ref: `#/channels/${chId}/messages/${resMsgId}` }],
        },
      };

      // Response render-shim: a `receive` op mirroring the response, so renderers that ignore the
      // `reply` object (e.g. Fern) still show the response. Isolated + toggleable; remove when the
      // renderer supports `reply`.
      if (shim) {
        target.operations[`on${baseId}Response`] = {
          action: "receive",
          channel: { $ref: `#/channels/${chId}` },
          title: `${method} response`,
          messages: [{ $ref: `#/channels/${chId}/messages/${resMsgId}` }],
        };
      }

      // Events the command emits (its `@event` return arms) render as their own `receive` ops on
      // this command's channel. The component schema/message is defined once; this channel just refs it.
      for (const ev of eventArms) {
        const { msgId, eventType } = ensureEventComponent(program, ev, ref, target, events.emitted);
        events.referenced.add(ev);
        emitEventReceiveOp(target, chId, `on${pascal(chId)}${ev.name}`, msgId, eventType, msgs);
      }
    }
    // Recurse into descendants, but stop at any nested @channel namespace — it is
    // emitted as its own channel by the top-level loop.
    for (const child of n.namespaces.values()) {
      if (!getChannel(program, child)) visit(child);
    }
  })(ns);
}

/**
 * Emit cross-cutting events — `@event` models NOT assigned to any operation's return — onto the
 * service's umbrella channel (the "Events" page). Each gets its own `receive` op (own label).
 */
function emitCentralEvents(
  program: Program,
  ns: Namespace,
  channelId: string,
  ref: RefFn,
  target: EmitTarget,
  channelMessages: Record<string, AsyncAPIRef>,
  events: EventState,
): void {
  (function visit(n: Namespace): void {
    for (const model of n.models.values()) {
      if (!getEvent(program, model)) continue;
      if (events.referenced.has(model)) continue; // already on a command channel
      const { msgId, eventType } = ensureEventComponent(program, model, ref, target, events.emitted);
      emitEventReceiveOp(target, channelId, `on${pascal(channelId)}${model.name}`, msgId, eventType, channelMessages);
    }
    for (const child of n.namespaces.values()) {
      if (!getChannel(program, child)) visit(child);
    }
  })(ns);
}

function emitSecurity(
  program: Program,
  ns: Namespace,
  server: AsyncAPIServer,
  components: AsyncAPIComponents,
): void {
  const auth = getBearerAuth(program, ns);
  if (!auth) return;
  components.securitySchemes ??= {};
  components.securitySchemes["httpBearer"] = {
    type: "http",
    scheme: "bearer",
    ...(auth.bearerFormat ? { bearerFormat: auth.bearerFormat } : {}),
  };
  server.security = [{ $ref: "#/components/securitySchemes/httpBearer" }];
}

export async function $onEmit(context: EmitContext<AsyncAPIEmitterOptions>): Promise<void> {
  if (context.program.compilerOptions.noEmit) return;
  const program = context.program;
  const serviceNs = findServiceNamespace(program);
  if (!serviceNs) return;

  const serverCfg = getServer(program, serviceNs);
  if (!serverCfg) {
    reportDiagnostic(program, { code: "missing-server", target: serviceNs });
    return;
  }

  // A single Relay connection multiplexes many sub-services, each tagged with its own
  // `@channel`. Collect every `@channel` namespace in the service subtree — the service
  // namespace itself (single-service spec) or its sub-namespaces (unified multi-service
  // spec) — and emit one channel per service, all bound to the one server.
  const channelNamespaces: { ns: Namespace; id: string }[] = [];
  (function collect(n: Namespace): void {
    const id = getChannel(program, n);
    if (id) channelNamespaces.push({ ns: n, id });
    n.namespaces.forEach(collect);
  })(serviceNs);
  if (channelNamespaces.length === 0) {
    reportDiagnostic(program, { code: "missing-channel", target: serviceNs });
    return;
  }

  const registry = createSchemaRegistry(program, serviceNs);
  const title = getService(program, serviceNs)?.title ?? serviceNs.name;
  const shim = context.options["response-receive-shim"] ?? true;

  // Concrete doc-level maps the emitters write into — referenced by `doc` so writes show through.
  const target: EmitTarget = { schemas: registry.schemas, messages: {}, operations: {} };
  const server: AsyncAPIServer = {
    host: serverCfg.host,
    protocol: serverCfg.protocol,
    ...(serverCfg.pathname ? { pathname: serverCfg.pathname } : {}),
    ...(serverCfg.description ? { description: serverCfg.description } : {}),
  };
  const components: AsyncAPIComponents = { schemas: target.schemas, messages: target.messages };

  const channels: Record<string, AsyncAPIChannel> = {};
  // One method namespace is global across the whole connection — guard duplicates across channels.
  const seen = new Set<string>();
  for (const { ns: cns, id } of channelNamespaces) {
    const perCommand = getChannelPerCommand(program, cns);
    const channelMessages: Record<string, AsyncAPIRef> = {};
    // The Relay WS endpoint is a single root connection (`wss://<host>`); every service
    // multiplexes over it and routes by the JSON-RPC `method` in the payload, not by a URL
    // path. Emit the root address `"/"` so renderers show the bare endpoint. Under
    // @channelPerCommand commands move to their own channels and this umbrella holds only the
    // cross-cutting events, so it is titled "Events".
    const channel: AsyncAPIChannel = {
      address: "/",
      title: perCommand ? "Events" : (getService(program, cns)?.title ?? cns.name),
      servers: [{ $ref: `#/servers/${serverCfg.name}` }],
      messages: channelMessages,
    };
    const cdesc = getDoc(program, cns);
    if (cdesc) channel.description = cdesc;
    channels[id] = channel;

    const events: EventState = { emitted: new Set<string>(), referenced: new Set<Model>() };
    emitRpcMethods(program, cns, id, registry.refFor, target, channelMessages, seen, channels, serverCfg.name, perCommand, shim, events);
    // Cross-cutting events (not returned by any op) land on this umbrella/"Events" channel.
    emitCentralEvents(program, cns, id, registry.refFor, target, channelMessages, events);
  }

  const doc: AsyncAPI3Document = {
    asyncapi: "3.0.0",
    info: { title, version: "1.0.0" },
    defaultContentType: "application/json",
    servers: { [serverCfg.name]: server },
    channels,
    operations: target.operations,
    components,
  };
  const desc = getDoc(program, serviceNs);
  if (desc) doc.info.description = desc;

  emitSecurity(program, serviceNs, server, components);
  for (const id of Object.keys(channels)) applyWebSocketBindings(doc, serverCfg.name, id);

  const outputFile = resolvePath(context.emitterOutputDir, context.options["output-file"] ?? "asyncapi.yaml");
  await emitFile(program, { path: outputFile, content: serialize(doc) });
}
