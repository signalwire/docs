import { EmitContext, emitFile, getDoc, getService, Namespace, resolvePath } from "@typespec/compiler";
import { stringify } from "yaml";
import { getServer } from "./decorators.js";
import { AsyncAPIEmitterOptions } from "./lib.js";
import { AsyncAPI3Document, AsyncAPIServer } from "./types.js";

export async function $onEmit(context: EmitContext<AsyncAPIEmitterOptions>): Promise<void> {
  if (context.program.compilerOptions.noEmit) return;
  const program = context.program;

  const doc: AsyncAPI3Document = { asyncapi: "3.0.0", info: { title: "", version: "1.0.0" } };
  const servers: Record<string, AsyncAPIServer> = {};

  (function visit(ns: Namespace): void {
    const svc = getService(program, ns);
    if (svc) {
      doc.info.title = svc.title ?? ns.name;
      const d = getDoc(program, ns);
      if (d) doc.info.description = d;
    }
    const cfg = getServer(program, ns);
    if (cfg) {
      servers[cfg.name] = {
        host: cfg.host,
        protocol: cfg.protocol,
        ...(cfg.pathname ? { pathname: cfg.pathname } : {}),
        ...(cfg.description ? { description: cfg.description } : {}),
      };
    }
    ns.namespaces.forEach(visit);
  })(program.getGlobalNamespaceType());

  if (Object.keys(servers).length) doc.servers = servers;

  const outputFile = resolvePath(context.emitterOutputDir, "asyncapi.yaml");
  await emitFile(program, { path: outputFile, content: stringify(doc) });
}
