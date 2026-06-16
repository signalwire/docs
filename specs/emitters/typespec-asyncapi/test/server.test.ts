import { strictEqual } from "assert";
import { describe, it } from "vitest";
import { asyncApiFor } from "./host.js";

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
