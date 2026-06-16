import { deepStrictEqual, strictEqual } from "assert";
import { describe, it } from "vitest";
import { asyncApiFor } from "./host.js";

export const SVC = `
  @service(#{ title: "Relay Calling" })
  @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
  @channel("calling")
  namespace Relay.Calling {
    model DialParams { tag: string; }
    model DialResult { code: string; message: string; }
    @rpcMethod("calling.dial") op dial(...DialParams): DialResult;
  }
`;

describe("@channel", () => {
  it("emits a single channel with address null", async () => {
    const { doc } = await asyncApiFor(SVC);
    strictEqual(doc.channels.calling.address, null);
    deepStrictEqual(doc.channels.calling.servers, [{ $ref: "#/servers/production" }]);
  });
});
