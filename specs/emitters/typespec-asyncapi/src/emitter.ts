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
import { createSchemaRegistry, encodedPropName, propertySchema, RefFn } from "./schema-emitter.js";
import { serialize } from "./serialize.js";
import {
  AsyncAPI3Document,
  AsyncAPIComponents,
  AsyncAPIMessage,
  AsyncAPIOperation,
  AsyncAPIRef,
  AsyncAPISchema,
  AsyncAPIServer,
  SchemaOrRef,
} from "./types.js";

/** The mutable component/operation maps the channel emitters write into. */
interface EmitTarget {
  schemas: Record<string, AsyncAPISchema>;
  messages: Record<string, AsyncAPIMessage>;
  channelMessages: Record<string, AsyncAPIRef>;
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
): void {
  const seen = new Set<string>();
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

      target.channelMessages[reqMsgId] = { $ref: `#/components/messages/${reqMsgId}` };
      target.channelMessages[resMsgId] = { $ref: `#/components/messages/${resMsgId}` };

      const summary = getSummary(program, op);
      target.operations[lcfirst(baseId)] = {
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
  ref: RefFn,
  target: EmitTarget,
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
      target.channelMessages[msgId] = { $ref: `#/components/messages/${msgId}` };
      eventRefs.push({ $ref: `#/channels/${channelId}/messages/${msgId}` });
    }
    n.namespaces.forEach(visit);
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
  const title = getService(program, ns)?.title ?? ns.name;

  // Concrete component maps the emitters write into — referenced by `doc` so writes show through.
  const target: EmitTarget = {
    schemas: registry.schemas,
    messages: {},
    channelMessages: {},
    operations: {},
  };
  const server: AsyncAPIServer = {
    host: serverCfg.host,
    protocol: serverCfg.protocol,
    ...(serverCfg.pathname ? { pathname: serverCfg.pathname } : {}),
    ...(serverCfg.description ? { description: serverCfg.description } : {}),
  };
  const components: AsyncAPIComponents = { schemas: target.schemas, messages: target.messages };

  const doc: AsyncAPI3Document = {
    asyncapi: "3.0.0",
    info: { title, version: "1.0.0" },
    defaultContentType: "application/json",
    servers: { [serverCfg.name]: server },
    channels: {
      [channelId]: {
        address: null,
        title,
        servers: [{ $ref: `#/servers/${serverCfg.name}` }],
        messages: target.channelMessages,
      },
    },
    operations: target.operations,
    components,
  };
  const desc = getDoc(program, ns);
  if (desc) doc.info.description = desc;

  emitRpcMethods(program, ns, channelId, registry.refFor, target);
  emitEvents(program, ns, channelId, registry.refFor, target);
  emitSecurity(program, ns, server, components);
  applyWebSocketBindings(doc, serverCfg.name, channelId);

  const outputFile = resolvePath(context.emitterOutputDir, context.options["output-file"] ?? "asyncapi.yaml");
  await emitFile(program, { path: outputFile, content: serialize(doc) });
}
