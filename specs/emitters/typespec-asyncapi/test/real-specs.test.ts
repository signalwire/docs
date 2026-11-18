import { compile, formatDiagnostic, NodeHost, resolveCompilerOptions, resolvePath } from "@typespec/compiler";
import { mkdtempSync, readFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { describe, expect, it } from "vitest";
import { parse } from "yaml";

/**
 * Compiles the real Relay specs (`specs/relay/main-{server,client}.tsp`, which import the
 * authored JSON-RPC frames in `common/frames.tsp`) through this emitter, using each spec's own
 * tspconfig but writing to a temp dir so the committed YAML under `fern/apis/` is untouched.
 */
const RELAY_DIR = resolvePath(import.meta.dirname, "../../../relay");
const EMITTER = "@signalwire/typespec-asyncapi";

async function emitRealSpec(variant: "server" | "client"): Promise<any> {
  const entrypoint = resolvePath(RELAY_DIR, `main-${variant}.tsp`);
  const [options, configDiagnostics] = await resolveCompilerOptions(NodeHost, {
    entrypoint,
    configPath: resolvePath(RELAY_DIR, `tspconfig.${variant}.yaml`),
    cwd: RELAY_DIR,
  });
  expect(configDiagnostics.map((d) => formatDiagnostic(d))).toEqual([]);

  const outDir = mkdtempSync(join(tmpdir(), `relay-${variant}-`));
  const emitterOptions = options.options?.[EMITTER];
  expect(emitterOptions).toBeDefined();
  emitterOptions!["emitter-output-dir"] = outDir;

  const program = await compile(NodeHost, entrypoint, options);
  expect(program.diagnostics.map((d) => formatDiagnostic(d))).toEqual([]);

  const file = join(outDir, String(emitterOptions!["output-file"] ?? "asyncapi.yaml"));
  return parse(readFileSync(file, "utf8"));
}

/** Every `$ref` string in `node`, depth-first. */
function collectRefs(node: unknown, out: string[] = []): string[] {
  if (Array.isArray(node)) {
    for (const v of node) collectRefs(v, out);
  } else if (node && typeof node === "object") {
    for (const [k, v] of Object.entries(node)) {
      if (k === "$ref" && typeof v === "string") out.push(v);
      else collectRefs(v, out);
    }
  }
  return out;
}

/** Resolve a local JSON pointer (`#/a/b`) against `doc`; `undefined` if it doesn't resolve. */
function resolvePointer(doc: unknown, ref: string): unknown {
  if (!ref.startsWith("#/")) return undefined;
  let cur: any = doc;
  for (const raw of ref.slice(2).split("/")) {
    const key = decodeURIComponent(raw).replace(/~1/g, "/").replace(/~0/g, "~");
    if (cur === null || typeof cur !== "object" || !(key in cur)) return undefined;
    cur = cur[key];
  }
  return cur;
}

describe.each(["server", "client"] as const)("real Relay spec: %s", (variant) => {
  it("compiles with no diagnostics and emits a well-formed AsyncAPI 3.0 document", async () => {
    const doc = await emitRealSpec(variant);

    expect(doc.asyncapi).toBe("3.0.0");
    expect(Object.keys(doc.servers ?? {}).length).toBeGreaterThan(0);
    expect(Object.keys(doc.channels ?? {}).length).toBeGreaterThan(0);
    expect(Object.keys(doc.operations ?? {}).length).toBeGreaterThan(0);
    expect(Object.keys(doc.components?.messages ?? {}).length).toBeGreaterThan(0);
    expect(Object.keys(doc.components?.schemas ?? {}).length).toBeGreaterThan(0);

    // Every $ref in the document resolves (checked first so the walks below can't hit a hole).
    const refs = collectRefs(doc);
    expect(refs.length).toBeGreaterThan(0);
    const dangling = [...new Set(refs)].filter((r) => resolvePointer(doc, r) === undefined);
    expect(dangling).toEqual([]);

    // The JSON-RPC frames authored in common/frames.tsp reach the output verbatim: every send
    // op's request is a 2.0 request frame whose `method` is the channel's method, and every
    // received message is a 2.0 frame.
    const deref = (s: any): any => (s?.$ref ? resolvePointer(doc, s.$ref) : s);
    for (const [id, op] of Object.entries<any>(doc.operations)) {
      const channelMsg = resolvePointer(doc, op.messages[0].$ref) as any;
      const payload = deref((resolvePointer(doc, channelMsg.$ref) as any).payload);
      expect(payload.properties?.jsonrpc?.enum, `operation ${id} jsonrpc`).toEqual(["2.0"]);
      if (op.action === "send") {
        expect(payload.properties?.method?.enum, `operation ${id} method`).toEqual([op.title]);
      }
    }
  }, 120_000);
});
