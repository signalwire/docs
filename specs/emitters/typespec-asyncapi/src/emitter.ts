import {
  EmitContext,
  emitFile,
  getDoc,
  getService,
  getSummary,
  Namespace,
  Operation,
  Program,
  resolvePath,
} from "@typespec/compiler";
import { applyWebSocketBindings } from "./bindings/ws.js";
import { getBearerAuth, getChannel, getEvent, getRpcMethod, getServer } from "./decorators.js";
import { AsyncAPIEmitterOptions, reportDiagnostic } from "./lib.js";
import { createSchemaRegistry, RefFn } from "./schema-emitter.js";
import { serialize } from "./serialize.js";
import { AsyncAPI3Document, SchemaObject } from "./types.js";

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

/** Schema for an operation's parameters: a `$ref` when it's a single spread model, else an inline object. */
function paramsSchema(program: Program, op: Operation, ref: RefFn): SchemaObject {
  const params = op.parameters;
  const spreads = params.sourceModels.filter((s) => s.usage === "spread");
  if (spreads.length === 1 && spreads[0].model.name) {
    return ref(spreads[0].model);
  }
  const properties: Record<string, SchemaObject> = {};
  const required: string[] = [];
  for (const [name, prop] of params.properties) {
    let s = ref(prop.type);
    const doc = getDoc(program, prop);
    if (doc) s = { ...s, description: doc };
    properties[name] = s;
    if (!prop.optional) required.push(name);
  }
  const schema: SchemaObject = { type: "object", properties };
  if (required.length) schema.required = required;
  return schema;
}

function emitRpcMethods(
  program: Program,
  ns: Namespace,
  channelId: string,
  doc: AsyncAPI3Document,
  ref: RefFn,
): void {
  const schemas = doc.components!.schemas!;
  const messages = doc.components!.messages!;
  const channelMessages = doc.channels![channelId].messages!;

  (function visit(n: Namespace): void {
    for (const op of n.operations.values()) {
      const method = getRpcMethod(program, op);
      if (!method) continue;

      const baseId = pascal(method); // e.g. CallingDial
      const reqMsgId = `${lcfirst(baseId)}Request`;
      const resMsgId = `${lcfirst(baseId)}Response`;

      schemas[`${baseId}Request`] = {
        type: "object",
        required: ["jsonrpc", "id", "method", "params"],
        properties: {
          jsonrpc: { type: "string", const: "2.0" },
          id: { type: "string", format: "uuid" },
          method: { type: "string", const: method },
          params: paramsSchema(program, op, ref),
        },
      };
      schemas[`${baseId}Response`] = {
        type: "object",
        required: ["jsonrpc", "id"],
        properties: {
          jsonrpc: { type: "string", const: "2.0" },
          id: { type: "string", format: "uuid" },
          result: ref(op.returnType),
        },
      };

      messages[reqMsgId] = {
        name: `${method}.request`,
        title: `${method} request`,
        contentType: "application/json",
        correlationId: { location: "$message.payload#/id" },
        payload: { $ref: `#/components/schemas/${baseId}Request` },
      };
      messages[resMsgId] = {
        name: `${method}.response`,
        title: `${method} response`,
        contentType: "application/json",
        correlationId: { location: "$message.payload#/id" },
        payload: { $ref: `#/components/schemas/${baseId}Response` },
      };

      channelMessages[reqMsgId] = { $ref: `#/components/messages/${reqMsgId}` };
      channelMessages[resMsgId] = { $ref: `#/components/messages/${resMsgId}` };

      const summary = getSummary(program, op);
      doc.operations![lcfirst(baseId)] = {
        action: "send",
        channel: { $ref: `#/channels/${channelId}` },
        title: method,
        ...(summary ? { summary } : {}),
        messages: [{ $ref: `#/channels/${channelId}/messages/${reqMsgId}` }],
        reply: {
          channel: { $ref: `#/channels/${channelId}` },
          messages: [{ $ref: `#/channels/${channelId}/messages/${resMsgId}` }],
        },
      };
    }
    n.namespaces.forEach(visit);
  })(ns);
}

function emitEvents(
  program: Program,
  ns: Namespace,
  channelId: string,
  doc: AsyncAPI3Document,
  ref: RefFn,
): void {
  const schemas = doc.components!.schemas!;
  const messages = doc.components!.messages!;
  const channelMessages = doc.channels![channelId].messages!;
  const eventRefs: { $ref: string }[] = [];

  (function visit(n: Namespace): void {
    for (const model of n.models.values()) {
      const eventType = getEvent(program, model);
      if (!eventType) continue;

      const frameId = `${model.name}Frame`;
      schemas[frameId] = {
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
      messages[msgId] = {
        name: eventType,
        title: `${eventType} event`,
        contentType: "application/json",
        payload: { $ref: `#/components/schemas/${frameId}` },
      };
      channelMessages[msgId] = { $ref: `#/components/messages/${msgId}` };
      eventRefs.push({ $ref: `#/channels/${channelId}/messages/${msgId}` });
    }
    n.namespaces.forEach(visit);
  })(ns);

  if (eventRefs.length) {
    doc.operations![`on${pascal(channelId)}Event`] = {
      action: "receive",
      channel: { $ref: `#/channels/${channelId}` },
      title: "signalwire.event",
      summary: "Asynchronous events pushed by the server over the signalwire.event carrier.",
      messages: eventRefs,
    };
  }
}

function emitSecurity(program: Program, ns: Namespace, serverName: string, doc: AsyncAPI3Document): void {
  const auth = getBearerAuth(program, ns);
  if (!auth) return;
  doc.components!.securitySchemes ??= {};
  doc.components!.securitySchemes["httpBearer"] = {
    type: "http",
    scheme: "bearer",
    ...(auth.bearerFormat ? { bearerFormat: auth.bearerFormat } : {}),
  };
  doc.servers![serverName].security = [{ $ref: "#/components/securitySchemes/httpBearer" }];
}

export async function $onEmit(context: EmitContext<AsyncAPIEmitterOptions>): Promise<void> {
  if (context.program.compilerOptions.noEmit) return;
  const program = context.program;
  const ns = findServiceNamespace(program);
  if (!ns) return;

  const serverCfg = getServer(program, ns);
  if (!serverCfg) {
    reportDiagnostic(program, { code: "missing-server", target: ns });
    return;
  }
  const channelId = getChannel(program, ns);
  if (!channelId) {
    reportDiagnostic(program, { code: "missing-channel", target: ns });
    return;
  }

  const registry = createSchemaRegistry(program);
  const service = getService(program, ns)!;
  const doc: AsyncAPI3Document = {
    asyncapi: "3.0.0",
    info: { title: service.title ?? ns.name, version: "1.0.0" },
    defaultContentType: "application/json",
    servers: {
      [serverCfg.name]: {
        host: serverCfg.host,
        protocol: serverCfg.protocol,
        ...(serverCfg.pathname ? { pathname: serverCfg.pathname } : {}),
        ...(serverCfg.description ? { description: serverCfg.description } : {}),
      },
    },
    channels: {
      [channelId]: {
        address: null,
        title: service.title ?? ns.name,
        servers: [{ $ref: `#/servers/${serverCfg.name}` }],
        messages: {},
      },
    },
    operations: {},
    components: { schemas: registry.schemas, messages: {} },
  };
  const desc = getDoc(program, ns);
  if (desc) doc.info.description = desc;

  emitRpcMethods(program, ns, channelId, doc, registry.refFor);
  emitEvents(program, ns, channelId, doc, registry.refFor);
  emitSecurity(program, ns, serverCfg.name, doc);
  applyWebSocketBindings(doc, serverCfg.name, channelId);

  const outputFile = resolvePath(context.emitterOutputDir, "asyncapi.yaml");
  await emitFile(program, { path: outputFile, content: serialize(doc) });
}
