import { deepStrictEqual, strictEqual } from "assert";
import { compile, formatDiagnostic, NodeHost } from "@typespec/compiler";
import { mkdtempSync, readFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { fileURLToPath } from "node:url";
import { describe, it } from "vitest";
import { parse } from "yaml";
import { asyncApiFor, FRAMES, Tester } from "./host.js";

describe("@server", () => {
  it("emits an AsyncAPI server with host, protocol, and pathname", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss", pathname: "/api/relay/wss" })
      namespace Relay;
      namespace Relay.Calling {
        @channel("calling.ping") op ping(): { code: string; message: string; };
      }
    `);
    strictEqual(doc.asyncapi, "3.0.0");
    strictEqual(doc.info.title, "Relay Calling");
    strictEqual(doc.servers.production.host, "relay.signalwire.com");
    strictEqual(doc.servers.production.protocol, "wss");
    strictEqual(doc.servers.production.pathname, "/api/relay/wss");
    strictEqual(doc.info.version, "1.0.0");
  });

  it("takes info.version from @info on the service namespace", async () => {
    // The in-memory Tester can't load the hoisted @typespec/openapi, so compile a fixture on disk.
    const outDir = mkdtempSync(join(tmpdir(), "asyncapi-info-"));
    const program = await compile(NodeHost, fileURLToPath(new URL("./fixtures/info-version.tsp", import.meta.url)), {
      emit: ["@signalwire/typespec-asyncapi"],
      options: { "@signalwire/typespec-asyncapi": { "emitter-output-dir": outDir } },
    });
    deepStrictEqual(program.diagnostics.map(formatDiagnostic), []);
    strictEqual(parse(readFileSync(join(outDir, "asyncapi.yaml"), "utf8")).info.version, "2.4.0");
  });
});

describe("diagnostics", () => {
  it("errors when @server is missing", async () => {
    const diagnostics = await Tester.diagnose(`
      @service(#{ title: "X" })
      namespace Relay;
      namespace Relay.Calling { @channel("x") op x(): {}; }
    `);
    strictEqual(diagnostics.some((d) => d.code.endsWith("missing-server")), true);
  });

  it("errors when no operation is marked with @channel", async () => {
    const diagnostics = await Tester.diagnose(`
      @service(#{ title: "X" })
      @server("p", #{ host: "h", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling { op x(): {}; }
    `);
    strictEqual(diagnostics.some((d) => d.code.endsWith("missing-channel")), true);
  });

  it("errors on duplicate @channel method names", async () => {
    const diagnostics = await Tester.diagnose(`
      @service(#{ title: "X" })
      @server("p", #{ host: "h", protocol: "wss" })
      namespace Relay;
      namespace Relay.Calling {
        model R { code: string; }
        @channel("calling.dial") op dial(): R;
        @channel("calling.dial") op dialAgain(): R;
      }
    `);
    strictEqual(diagnostics.some((d) => d.code.endsWith("duplicate-channel")), true);
  });

  it("errors when two distinct event models share a name across namespaces", async () => {
    const diagnostics = await Tester.diagnose(`
      @service(#{ title: "X" })
      @server("p", #{ host: "h", protocol: "wss" })
      namespace Relay;
      ${FRAMES}
      namespace Relay.Calling {
        model StateEvent is SignalwireEvent<"calling.call.state", { state: string }>;
        @channel("calling.watch") op watch(): StateEvent;
      }
      namespace Relay.Messaging {
        model StateEvent is SignalwireEvent<"messaging.state", { status: string }>;
        @channel("messaging.watch") op watch(): StateEvent;
      }
    `);
    strictEqual(diagnostics.some((d) => d.code.endsWith("duplicate-message-id")), true);
  });

  it("does not flag one event model received on several channels", async () => {
    const diagnostics = await Tester.diagnose(`
      @service(#{ title: "X" })
      @server("p", #{ host: "h", protocol: "wss" })
      namespace Relay;
      ${FRAMES}
      namespace Relay.Calling {
        model StateEvent is SignalwireEvent<"calling.call.state", { state: string }>;
        @channel("calling.watch") op watch(): StateEvent;
        @channel("calling.observe") op observe(): StateEvent;
      }
    `);
    strictEqual(diagnostics.some((d) => d.code.endsWith("duplicate-message-id")), false);
  });
});
