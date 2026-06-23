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
import { getExtensions } from "@typespec/openapi";
import { applyWebSocketBindings } from "./bindings/ws.js";
import { getBearerAuth, getChannel, getChannelPerCommand, getEvent, getGlobalEvents, getRpcMethod, getServer } from "./decorators.js";
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
  /** `${channelId}::${msgId}` pairs already given a receive op — guards against emitting the same
   *  message twice on one channel (e.g. a global event lands on every command, which all share the
   *  one channel in single-channel mode → it should render once, not once per command). */
  receive: Set<string>;
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

/**
 * Reference a message on a channel and emit a dedicated `receive` op for it, each with its own
 * `x-fern-display-name` so it renders as a distinct, human-readable entry. Fern labels every
 * rendered message by the operation key and ignores AsyncAPI `title`/`summary`, so one receive op
 * per message (not a message union) is what produces individually-labeled entries.
 */
function emitReceiveOp(
  target: EmitTarget,
  chId: string,
  opId: string,
  msgId: string,
  displayName: string,
  channelMessages: Record<string, AsyncAPIRef>,
  seen: Set<string>,
): void {
  // At most one receive op per (channel, message): the same message reaching one channel via
  // multiple commands (single-channel mode) must render once, not once per command.
  const key = `${chId}::${msgId}`;
  if (seen.has(key)) return;
  seen.add(key);
  channelMessages[msgId] = { $ref: `#/components/messages/${msgId}` };
  target.operations[opId] = {
    action: "receive",
    channel: { $ref: `#/channels/${chId}` },
    title: displayName,
    "x-fern-display-name": displayName,
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
  // Events received during EVERY command on this channel (e.g. call.state), declared once via
  // @globalEvents on the @channel namespace and merged into each command's receive union.
  const globalEvents = getGlobalEvents(program, ns);
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
        const channel: AsyncAPIChannel = {
          address: "/",
          title: method,
          ...(desc ? { description: desc } : {}),
          servers: [{ $ref: `#/servers/${serverName}` }],
          messages: perMsgs,
        };
        // Honor standard TypeSpec `@extension` (AsyncAPI permits `x-*` vendor extensions): emit any
        // `x-*` the spec attached to the operation onto its channel. Generic and vendor-agnostic —
        // currently unused by the Relay specs, but part of the emitter's baseline support.
        for (const [key, value] of getExtensions(program, op)) {
          (channel as unknown as Record<string, unknown>)[key] = value;
        }
        channels[chId] = channel;
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

      // Everything this operation may RECEIVE, as ONE `receive` op PER message — each with its own
      // `x-fern-display-name` so it renders as a distinct, labeled entry (Fern labels by operation
      // key and ignores AsyncAPI title/summary, and a single message-union op would render as N
      // identical labels). Covered here:
      //  - the command's own `@event` return arms,
      //  - shared global events attached to every command on this channel (e.g. call.state),
      //  - and — only when `response-receive-shim` is on — the correlated response message, because
      //    Fern does not render the `reply` object.
      // The `reply` above is ALWAYS kept (standards-correct). The shim merely *also* surfaces the
      // response here for rendering; flipping `response-receive-shim: false` drops this op with no
      // other spec change, leaving only the canonical `reply`.
      const seenReceive = new Set<string>();
      for (const ev of [...eventArms, ...globalEvents]) {
        const { msgId, eventType } = ensureEventComponent(program, ev, ref, target, events.emitted);
        events.referenced.add(ev);
        if (seenReceive.has(msgId)) continue;
        seenReceive.add(msgId);
        emitReceiveOp(target, chId, `on${baseId}${ev.name}`, msgId, eventType, msgs, events.receive);
      }
      if (shim) {
        emitReceiveOp(target, chId, `on${baseId}Response`, resMsgId, `${method} response`, msgs, events.receive);
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
      emitReceiveOp(target, channelId, `on${pascal(channelId)}${model.name}`, msgId, eventType, channelMessages, events.receive);
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

  const channelMode = context.options["channel-mode"] ?? "per-command";
  const channels: Record<string, AsyncAPIChannel> = {};
  // One method namespace is global across the whole connection — guard duplicates across channels.
  const seen = new Set<string>();

  if (channelMode === "single") {
    // Idiomatic AsyncAPI shape for a single-socket, payload-routed protocol: ONE channel (the
    // single WebSocket connection at "/"), carrying EVERY service's operations + events, routed
    // by the JSON-RPC `method` in the payload (cf. Kraken / Slack request-reply examples).
    const channelId = "relay";
    const channelMessages: Record<string, AsyncAPIRef> = {};
    const channel: AsyncAPIChannel = {
      address: "/",
      title,
      servers: [{ $ref: `#/servers/${serverCfg.name}` }],
      messages: channelMessages,
    };
    const sdesc = getDoc(program, serviceNs);
    if (sdesc) channel.description = sdesc;
    channels[channelId] = channel;

    const events: EventState = { emitted: new Set<string>(), referenced: new Set<Model>(), receive: new Set<string>() };
    // Pass 1: every service's RPC methods (send + reply + response shim + return-type events),
    // all onto the one channel. perCommand is forced off — there are no per-command channels here.
    for (const { ns: cns } of channelNamespaces) {
      emitRpcMethods(program, cns, channelId, registry.refFor, target, channelMessages, seen, channels, serverCfg.name, false, shim, events);
    }
    // Pass 2: cross-cutting events (returned by no op) — also onto the one channel.
    for (const { ns: cns } of channelNamespaces) {
      emitCentralEvents(program, cns, channelId, registry.refFor, target, channelMessages, events);
    }
  } else {
    // Shared across services so an event referenced by ANY operation (even cross-service, e.g.
    // calling's call.receive attached to signalwire.receive) is not re-emitted as a central event
    // elsewhere. Two passes — all sends first, then central events — so every cross-service
    // reference is known before we decide what is "central" (mirrors single-channel mode).
    const events: EventState = { emitted: new Set<string>(), referenced: new Set<Model>(), receive: new Set<string>() };
    const umbrellas: { cns: Namespace; id: string; channelMessages: Record<string, AsyncAPIRef>; perCommand: boolean }[] = [];
    // Pass 1: create each service's channel + emit its send ops (and command/global event receives).
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
      emitRpcMethods(program, cns, id, registry.refFor, target, channelMessages, seen, channels, serverCfg.name, perCommand, shim, events);
      umbrellas.push({ cns, id, channelMessages, perCommand });
    }
    // Pass 2: cross-cutting events not referenced by any op land on their service umbrella channel.
    for (const { cns, id, channelMessages, perCommand } of umbrellas) {
      emitCentralEvents(program, cns, id, registry.refFor, target, channelMessages, events);
      // Under @channelPerCommand this umbrella holds ONLY cross-cutting events. If every event is
      // command-bound, @globalEvents, or attached to another service's op (so referenced), nothing
      // remains — drop the empty "Events" page rather than emit a stranded, contentless channel.
      if (perCommand && Object.keys(channelMessages).length === 0) {
        delete channels[id];
      }
    }
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
