import { strictEqual } from "assert";
import { describe, it } from "vitest";
import { asyncApiFor, Tester } from "./host.js";

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
});
