import { deepStrictEqual, strictEqual } from "assert";
import { describe, it } from "vitest";
import { asyncApiFor, outputsFor } from "./host.js";

const SVC = `
  @service(#{ title: "Relay Calling" })
  @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
  @channel("calling")
  namespace Relay.Calling {
    model DialResult { code: string; }
    @rpcMethod("calling.dial") op dial(): DialResult;
  }
`;

describe("output", () => {
  it("defaults the output file name to asyncapi.yaml", async () => {
    const outputs = await outputsFor(SVC, {});
    strictEqual(typeof outputs["asyncapi.yaml"], "string");
  });

  it("honors the output-file option (one service per channel spec)", async () => {
    const outputs = await outputsFor(SVC, { "output-file": "calling.yaml" });
    strictEqual(typeof outputs["calling.yaml"], "string");
    strictEqual(outputs["asyncapi.yaml"], undefined);
  });

  it("emits parseable yaml with a bearer security scheme via @useAuth", async () => {
    const { doc, yaml } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      @channel("calling")
      @bearerAuth("JWT")
      namespace Relay.Calling {
        model DialResult { code: string; }
        @rpcMethod("calling.dial") op dial(): DialResult;
      }
    `);
    strictEqual(typeof yaml, "string");
    strictEqual(doc.components.securitySchemes.httpBearer.type, "http");
    strictEqual(doc.components.securitySchemes.httpBearer.scheme, "bearer");
    strictEqual(doc.components.securitySchemes.httpBearer.bearerFormat, "JWT");
    strictEqual(doc.servers.production.security[0].$ref, "#/components/securitySchemes/httpBearer");
  });

  it("adds a ws binding to wss servers and the channel", async () => {
    const { doc } = await asyncApiFor(`
      @service(#{ title: "Relay Calling" })
      @server("production", #{ host: "relay.signalwire.com", protocol: "wss" })
      @channel("calling")
      namespace Relay.Calling {
        model DialResult { code: string; }
        @rpcMethod("calling.dial") op dial(): DialResult;
      }
    `);
    deepStrictEqual(doc.servers.production.bindings, { ws: {} });
    deepStrictEqual(doc.channels.calling.bindings, { ws: {} });
  });
});
