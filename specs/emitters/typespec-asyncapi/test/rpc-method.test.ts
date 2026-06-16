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

describe("@rpcMethod", () => {
  it("synthesizes request envelope, response envelope, send op, and reply", async () => {
    const { doc } = await asyncApiFor(SVC);

    const op = doc.operations.callingDial;
    strictEqual(op.action, "send");
    deepStrictEqual(op.channel, { $ref: "#/channels/calling" });
    deepStrictEqual(op.messages, [{ $ref: "#/channels/calling/messages/callingDialRequest" }]);
    deepStrictEqual(op.reply.messages, [
      { $ref: "#/channels/calling/messages/callingDialResponse" },
    ]);

    const reqMsg = doc.components.messages.callingDialRequest;
    deepStrictEqual(reqMsg.correlationId, { location: "$message.payload#/id" });

    const reqSchema = doc.components.schemas.CallingDialRequest;
    strictEqual(reqSchema.properties.jsonrpc.const, "2.0");
    strictEqual(reqSchema.properties.method.const, "calling.dial");
    strictEqual(reqSchema.properties.params.$ref, "#/components/schemas/DialParams");

    const resSchema = doc.components.schemas.CallingDialResponse;
    strictEqual(resSchema.properties.result.$ref, "#/components/schemas/DialResult");
  });
});
