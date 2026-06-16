import { strictEqual } from "assert";
import { describe, it } from "vitest";
import { asyncApiFor } from "./host.js";

describe("output", () => {
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
});
