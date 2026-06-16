import {
  EmitContext,
  emitFile,
  getDoc,
  getService,
  Namespace,
  Program,
  resolvePath,
} from "@typespec/compiler";
import { stringify } from "yaml";
import { getChannel, getServer } from "./decorators.js";
import { AsyncAPIEmitterOptions, reportDiagnostic } from "./lib.js";
import { AsyncAPI3Document } from "./types.js";

function findServiceNamespace(program: Program): Namespace | undefined {
  let found: Namespace | undefined;
  (function visit(ns: Namespace): void {
    if (getService(program, ns)) found ??= ns;
    ns.namespaces.forEach(visit);
  })(program.getGlobalNamespaceType());
  return found;
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
    components: { schemas: {}, messages: {} },
  };
  const desc = getDoc(program, ns);
  if (desc) doc.info.description = desc;

  const outputFile = resolvePath(context.emitterOutputDir, "asyncapi.yaml");
  await emitFile(program, { path: outputFile, content: stringify(doc) });
}
