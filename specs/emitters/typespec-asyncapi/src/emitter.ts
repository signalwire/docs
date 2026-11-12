import {
  EmitContext,
  emitFile,
  getDoc,
  getExamples,
  getOpExamples,
  getService,
  getSummary,
  isErrorModel,
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
import { getBearerAuth, getChannel, getReply, getServer } from "./decorators.js";
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
 * Cross-channel coordination: event component messages are emitted exactly once (`emitted`)
 * and merely `$ref`-ed from each channel that receives them; `receive` guards against emitting
 * the same `(channel, message)` receive op twice (e.g. an event listed on several commands that
 * share one channel in single-channel mode).
 */
interface EventState {
  /** Component message ids already emitted (`lcfirst(model.name)`). */
  emitted: Set<string>;
  /** `${channelId}::${msgId}` pairs already given a receive op. */
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

/**
 * Schema for an operation's parameters (the message it sends): a `$ref` when it's a single spread
 * model, else an inline object. With JSON-RPC framing modeled in the spec, the spread model IS the
 * request frame, so this emits the authored frame verbatim — no synthesis.
 */
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
 * Partition an operation's return type into reply arm(s) and received-event arm(s). The reply is
 * the response correlated to the request: a model marked `@reply`, or an `@error` model (an error
 * response). Every other model arm is a server-pushed message the operation may receive. Non-model
 * arms (bare scalars/literals) are treated as the reply payload; `void`/`never` are ignored.
 */
function partitionReturn(program: Program, returnType: Type): { replyArms: Type[]; eventArms: Model[] } {
  const arms: Type[] = returnType.kind === "Union" ? [...returnType.variants.values()].map((v) => v.type) : [returnType];
  const replyArms: Type[] = [];
  const eventArms: Model[] = [];
  for (const arm of arms) {
    if (arm.kind === "Intrinsic") continue; // void / never
    if (arm.kind === "Model" && !getReply(program, arm) && !isErrorModel(program, arm)) {
      eventArms.push(arm);
    } else {
      replyArms.push(arm);
    }
  }
  return { replyArms, eventArms };
}

/** Human-facing label for a received-event message: its `@summary`, falling back to the model name. */
function eventDisplayName(program: Program, model: Model): string {
  return getSummary(program, model) ?? model.name;
}

/**
 * Emit a received-event component message exactly once: payload is the authored event model
 * (verbatim — the spec models the full `signalwire.event` carrier), plus any `@example` on it.
 */
function ensureEventMessage(
  program: Program,
  model: Model,
  displayName: string,
  ref: RefFn,
  target: EmitTarget,
  emitted: Set<string>,
): string {
  const msgId = lcfirst(model.name);
  if (emitted.has(msgId)) return msgId;
  emitted.add(msgId);
  const msg: AsyncAPIMessage = {
    name: model.name,
    title: displayName,
    contentType: "application/json",
    payload: ref(model),
  };
  for (const ex of getExamples(program, model)) {
    (msg.examples ??= []).push({ payload: serializeValueAsJson(program, ex.value, model) });
  }
  target.messages[msgId] = msg;
  return msgId;
}

/**
 * Reference a message on a channel and emit a dedicated `receive` op for it — one receive op per
 * message (not a message union) is what makes Fern render individually-labeled entries. The
 * human-readable label is NOT synthesized here: any `x-fern-display-name` comes from `@extension`
 * authored on the source model and passed in via `extensions` (the emitter never invents extensions).
 * `title` stays a standard AsyncAPI field, derived from the model's `@summary`.
 */
function emitReceiveOp(
  target: EmitTarget,
  chId: string,
  opId: string,
  msgId: string,
  displayName: string,
  channelMessages: Record<string, AsyncAPIRef>,
  seen: Set<string>,
  extensions: Iterable<[string, unknown]> = [],
): void {
  // At most one receive op per (channel, message): the same message reaching one channel via
  // multiple commands (single-channel mode) must render once, not once per command.
  const key = `${chId}::${msgId}`;
  if (seen.has(key)) return;
  seen.add(key);
  channelMessages[msgId] = { $ref: `#/components/messages/${msgId}` };
  const op: AsyncAPIOperation = {
    action: "receive",
    channel: { $ref: `#/channels/${chId}` },
    title: displayName,
    messages: [{ $ref: `#/channels/${chId}/messages/${msgId}` }],
  };
  // Pass through authored vendor extensions (e.g. x-fern-display-name) from the source model.
  for (const [k, v] of extensions) (op as unknown as Record<string, unknown>)[k] = v;
  target.operations[opId] = op;
}

function emitRpcMethods(
  program: Program,
  ns: Namespace,
  ref: RefFn,
  target: EmitTarget,
  seen: Set<string>,
  channels: Record<string, AsyncAPIChannel>,
  serverName: string,
  // When set, single-channel mode: every op lands on this one shared channel and no per-op
  // channel is minted. When undefined, multi mode: each op gets its own root-addressed channel.
  single: { channelId: string; channelMessages: Record<string, AsyncAPIRef> } | undefined,
  shim: boolean,
  events: EventState,
): void {
  (function visit(n: Namespace): void {
    for (const op of n.operations.values()) {
      const method = getChannel(program, op);
      if (!method) continue;
      if (seen.has(method)) {
        reportDiagnostic(program, { code: "duplicate-channel", target: op, format: { method } });
        continue;
      }
      seen.add(method);

      const baseId = pascal(method); // e.g. CallingDial
      const opKey = lcfirst(baseId);
      const reqMsgId = `${opKey}Request`;
      const summary = getSummary(program, op);

      // An op with no parameters models a RECEIVE-ONLY channel: there is no request frame to send,
      // so we emit neither a request message nor a `send` op — only the channel and the `receive`
      // ops for the server-pushed events it returns. An op WITH parameters is a send/reply command.
      const hasRequest = op.parameters.properties.size > 0;

      // Request message — payload is the operation's parameters (the in-spec request frame), verbatim.
      if (hasRequest) {
        target.messages[reqMsgId] = {
          name: `${method}.request`,
          title: `${method} request`,
          contentType: "application/json",
          correlationId: { location: "$message.payload#/id" },
          payload: paramsSchema(program, op, ref),
        };
      }

      const { replyArms, eventArms } = partitionReturn(program, op.returnType);
      if (!hasRequest && replyArms.length) {
        reportDiagnostic(program, { code: "reply-without-request", target: op, format: { method } });
      }

      // Reply message(s) — one per reply arm; a reply correlates to a request, so a receive-only
      // (no-request) channel has none.
      const replyMsgIds: string[] = [];
      if (hasRequest) {
        replyArms.forEach((arm, i) => {
          const resMsgId = replyArms.length === 1 ? `${opKey}Response` : `${opKey}Response${i + 1}`;
          target.messages[resMsgId] = {
            name: `${method}.response`,
            title: `${method} response`,
            contentType: "application/json",
            correlationId: { location: "$message.payload#/id" },
            payload: ref(arm),
          };
          replyMsgIds.push(resMsgId);
        });

        // Examples — serialize @opExample parameters/returnType verbatim (the frames are authored).
        for (const ex of getOpExamples(program, op)) {
          if (ex.parameters) {
            (target.messages[reqMsgId].examples ??= []).push({
              payload: serializeValueAsJson(program, ex.parameters, op.parameters),
            });
          }
          if (ex.returnType && replyArms.length === 1) {
            (target.messages[replyMsgIds[0]].examples ??= []).push({
              payload: serializeValueAsJson(program, ex.returnType, replyArms[0]),
            });
          }
        }
      }

      // Multi mode: each op gets its OWN root-addressed channel, keyed by the real dotted method
      // name (the @channel value, verbatim). AsyncAPI channel keys are free-form strings and Fern
      // uses the key as the sidebar label + page header, so the dotted name renders directly — no
      // vendor extension needed. (Dots are literal in JSON pointers, so `#/channels/calling.dial`
      // still resolves.) Single mode: the op lands on the one shared channel.
      const chId = single ? single.channelId : method;

      let msgs: Record<string, AsyncAPIRef>;
      if (single) {
        msgs = single.channelMessages;
      } else {
        const perMsgs: Record<string, AsyncAPIRef> = {};
        const desc = summary ?? getDoc(program, op);
        const channel: AsyncAPIChannel = {
          address: "/",
          title: method,
          ...(desc ? { description: desc } : {}),
          servers: [{ $ref: `#/servers/${serverName}` }],
          messages: perMsgs,
        };
        // Honor standard TypeSpec `@extension` (AsyncAPI permits `x-*` vendor extensions).
        for (const [key, value] of getExtensions(program, op)) {
          (channel as unknown as Record<string, unknown>)[key] = value;
        }
        channels[chId] = channel;
        msgs = perMsgs;
      }

      // Send op + request/reply message refs — only when the op actually sends a request. A
      // receive-only channel (no parameters) has neither; its channel carries only `receive` ops.
      if (hasRequest) {
        msgs[reqMsgId] = { $ref: `#/components/messages/${reqMsgId}` };
        for (const resMsgId of replyMsgIds) msgs[resMsgId] = { $ref: `#/components/messages/${resMsgId}` };

        // Send op (request) — keeps the canonical, correlated `reply` (standards-correct AsyncAPI 3.0).
        const sendOp: AsyncAPIOperation = {
          action: "send",
          channel: { $ref: `#/channels/${chId}` },
          title: method,
          ...(summary ? { summary } : {}),
          messages: [{ $ref: `#/channels/${chId}/messages/${reqMsgId}` }],
        };
        if (replyMsgIds.length) {
          sendOp.reply = {
            channel: { $ref: `#/channels/${chId}` },
            messages: replyMsgIds.map((id) => ({ $ref: `#/channels/${chId}/messages/${id}` })),
          };
        }
        // The same op authors the channel display name (above) and the send-entry display name —
        // pass its authored `@extension` (e.g. x-fern-display-name) through to the send op too.
        for (const [key, value] of getExtensions(program, op)) {
          (sendOp as unknown as Record<string, unknown>)[key] = value;
        }
        target.operations[opKey] = sendOp;
      }

      // Received events — one `receive` op PER message (each with its own `x-fern-display-name`),
      // plus — when the shim is on — the reply message, because Fern does not render `reply`.
      const seenReceive = new Set<string>();
      for (const ev of eventArms) {
        const dn = eventDisplayName(program, ev);
        const msgId = ensureEventMessage(program, ev, dn, ref, target, events.emitted);
        if (seenReceive.has(msgId)) continue;
        seenReceive.add(msgId);
        emitReceiveOp(target, chId, `on${baseId}${ev.name}`, msgId, dn, msgs, events.receive, getExtensions(program, ev));
      }
      if (shim) {
        replyMsgIds.forEach((resMsgId, i) => {
          const opId = `on${baseId}Response${replyMsgIds.length > 1 ? i + 1 : ""}`;
          emitReceiveOp(target, chId, opId, resMsgId, `${method} response`, msgs, events.receive, getExtensions(program, replyArms[i]));
        });
      }
    }
    for (const child of n.namespaces.values()) {
      visit(child);
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

  // A single Relay connection multiplexes many sub-services (calling, messaging, …), each a
  // direct sub-namespace of the @service namespace. Discover those with @channel operations in
  // declaration order; every operation marked with @channel becomes its own root-addressed channel.
  const hasChannelOp = (ns: Namespace): boolean => {
    let found = false;
    (function visit(n: Namespace): void {
      for (const op of n.operations.values()) if (getChannel(program, op)) found = true;
      n.namespaces.forEach(visit);
    })(ns);
    return found;
  };
  const serviceGroups = [...serviceNs.namespaces.values()].filter(hasChannelOp);
  if (!serviceGroups.length) {
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

  const channelMode = context.options["channel-mode"] ?? "multi";
  const channels: Record<string, AsyncAPIChannel> = {};
  // One channel-name namespace is global across the whole connection — guard duplicates.
  const seen = new Set<string>();
  // Shared across services so an event referenced by ops in several services is emitted once.
  const events: EventState = { emitted: new Set<string>(), receive: new Set<string>() };

  if (channelMode === "single") {
    // Idiomatic AsyncAPI shape for a single-socket, payload-routed protocol: ONE channel (the
    // single WebSocket connection at "/"), carrying EVERY service's operations + events.
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
    for (const cns of serviceGroups) {
      emitRpcMethods(program, cns, registry.refFor, target, seen, channels, serverCfg.name, { channelId, channelMessages }, shim, events);
    }
  } else {
    // Multi mode: every @channel operation gets its own root-addressed channel.
    for (const cns of serviceGroups) {
      emitRpcMethods(program, cns, registry.refFor, target, seen, channels, serverCfg.name, undefined, shim, events);
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
