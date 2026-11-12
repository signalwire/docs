import { resolvePath } from "@typespec/compiler";
import { createTester } from "@typespec/compiler/testing";
import { parse } from "yaml";

export const Tester = createTester(resolvePath(import.meta.dirname, ".."), {
  libraries: ["@signalwire/typespec-asyncapi"],
})
  .import("@signalwire/typespec-asyncapi")
  .using("SignalWire.AsyncAPI")
  .emit("@signalwire/typespec-asyncapi");

/**
 * The JSON-RPC framing, authored in-spec as base model templates. The emitter emits these
 * payloads verbatim (no synthesis), so tests declare them like the real Relay spec does.
 */
export const FRAMES = `
  model JsonRpcRequest<Method extends string, Params> {
    jsonrpc: "2.0"; id: string; method: Method; params: Params;
  }
  model JsonRpcResponse<Result> { jsonrpc: "2.0"; id: string; result: Result; }
  model SignalwireEvent<EventType extends string, Data> {
    jsonrpc: "2.0"; id: string; method: "signalwire.event";
    params: {
      event_type: EventType;
      event_channel?: string; timestamp?: float64; project_id?: string; space_id?: string;
      params: Data;
    };
  }
`;

/** Compile relay tsp and return the emitted AsyncAPI document (parsed) + raw yaml. */
export async function asyncApiFor(code: string): Promise<{ doc: any; yaml: string }> {
  const { outputs } = await Tester.compile(code);
  const yaml = outputs["asyncapi.yaml"];
  return { doc: parse(yaml), yaml };
}

/** Compile with a custom `output-file` option; returns the raw outputs map (keyed by file name). */
export async function outputsFor(
  code: string,
  options: Record<string, unknown>,
): Promise<Record<string, string>> {
  const { outputs } = await Tester.compile(code, {
    compilerOptions: {
      options: { "@signalwire/typespec-asyncapi": options },
    },
  });
  return outputs;
}
