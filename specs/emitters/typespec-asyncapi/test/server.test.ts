import { strictEqual } from "assert";
import { describe, it } from "vitest";
import { asyncApiFor, Tester } from "./host.js";

describe("@server", () => {
  it("emits an AsyncAPI server with host, protocol, and pathname", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss", pathname: "/api/relay/wss" })
      @channel("calling")
      namespace Relay.Calling {
        @rpcMethod("calling.ping") op ping(): { code: string; message: string; };
      }
    `);
    strictEqual(doc.asyncapi, "3.0.0");
    strictEqual(doc.info.title, "Relay Calling");
    strictEqual(doc.servers.production.host, "relay.signalwire.com");
    strictEqual(doc.servers.production.protocol, "wss");
    strictEqual(doc.servers.production.pathname, "/api/relay/wss");
  });
});

describe("diagnostics", () => {
  it("errors when @server is missing", async () => {
    const diagnostics = await Tester.diagnose(`
      @service(#{ title: "X" })
      @channel("calling")
      namespace Relay.Calling { @rpcMethod("x") op x(): {}; }
    `);
    strictEqual(diagnostics.some((d) => d.code.endsWith("missing-server")), true);
  });

  it("errors when @channel is missing", async () => {
    const diagnostics = await Tester.diagnose(`
      @service(#{ title: "X" })
      @server("p", #{ host: "h", protocol: "wss" })
      namespace Relay.Calling { @rpcMethod("x") op x(): {}; }
    `);
    strictEqual(diagnostics.some((d) => d.code.endsWith("missing-channel")), true);
  });
});
