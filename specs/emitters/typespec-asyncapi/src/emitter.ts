import {
  EmitContext,
  emitFile,
  getDoc,
  getExamples,
  getOpExamples,
  getService,
  getSummary,
  Namespace,
  Operation,
  Program,
  resolvePath,
  serializeValueAsJson,
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
      const reqMsgId = `${lcfirst(baseId)}Request`;
      const resMsgId = `${lcfirst(baseId)}Response`;

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
          result: ref(op.returnType),
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

      // Wrap any @opExample on the operation into full JSON-RPC request/reply frame
      // examples on the synthesized messages (params -> request, returnType -> reply).
      for (const ex of getOpExamples(program, op)) {
        if (ex.parameters) {
          const params = serializeValueAsJson(program, ex.parameters, op.parameters);
          (target.messages[reqMsgId].examples ??= []).push({
            payload: { jsonrpc: "2.0", id: EXAMPLE_ID, method, params },
          });
        }
        if (ex.returnType) {
          const result = serializeValueAsJson(program, ex.returnType, op.returnType);
          (target.messages[resMsgId].examples ??= []).push({
            payload: { jsonrpc: "2.0", id: EXAMPLE_ID, result },
          });
        }
      }

      const opKey = lcfirst(baseId);
      const summary = getSummary(program, op);
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
    }
    // Recurse into descendants, but stop at any nested @channel namespace — it is
    // emitted as its own channel by the top-level loop.
    for (const child of n.namespaces.values()) {
      if (!getChannel(program, child)) visit(child);
    }
  })(ns);
}

function emitEvents(
  program: Program,
  ns: Namespace,
  channelId: string,
  ref: RefFn,
  target: EmitTarget,
  channelMessages: Record<string, AsyncAPIRef>,
): void {
  const eventRefs: AsyncAPIRef[] = [];

  (function visit(n: Namespace): void {
    for (const model of n.models.values()) {
      const eventType = getEvent(program, model);
      if (!eventType) continue;

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

      const msgId = lcfirst(model.name);
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

      channelMessages[msgId] = { $ref: `#/components/messages/${msgId}` };
      eventRefs.push({ $ref: `#/channels/${channelId}/messages/${msgId}` });
    }
    for (const child of n.namespaces.values()) {
      if (!getChannel(program, child)) visit(child);
    }
  })(ns);

  if (eventRefs.length) {
    target.operations[`on${pascal(channelId)}Event`] = {
      action: "receive",
      channel: { $ref: `#/channels/${channelId}` },
      title: "signalwire.event",
      summary: "Asynchronous events pushed by the server over the signalwire.event carrier.",
      messages: eventRefs,
    };
  }
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
    const channelMessages: Record<string, AsyncAPIRef> = {};
    // The Relay WS endpoint is a single root connection (`wss://<host>`); every service
    // multiplexes over it and routes by the JSON-RPC `method` in the payload, not by a URL
    // path. Emit the root address `"/"` so renderers show the bare endpoint.
    const channel: AsyncAPIChannel = {
      address: "/",
      title: getService(program, cns)?.title ?? cns.name,
      servers: [{ $ref: `#/servers/${serverCfg.name}` }],
      messages: channelMessages,
    };
    const cdesc = getDoc(program, cns);
    if (cdesc) channel.description = cdesc;
    channels[id] = channel;

    const perCommand = getChannelPerCommand(program, cns);
    emitRpcMethods(program, cns, id, registry.refFor, target, channelMessages, seen, channels, serverCfg.name, perCommand);
    emitEvents(program, cns, id, registry.refFor, target, channelMessages);
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
