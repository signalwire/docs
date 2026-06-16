import { resolvePath } from "@typespec/compiler";
import { createTester } from "@typespec/compiler/testing";
import { parse } from "yaml";

export const Tester = createTester(resolvePath(import.meta.dirname, ".."), {
  libraries: ["@signalwire/typespec-asyncapi"],
})
  .import("@signalwire/typespec-asyncapi")
  .using("SignalWire.AsyncAPI")
  .emit("@signalwire/typespec-asyncapi");

/** Compile relay tsp and return the emitted AsyncAPI document (parsed) + raw yaml. */
export async function asyncApiFor(code: string): Promise<{ doc: any; yaml: string }> {
  const outPath = "{emitter-output-dir}/asyncapi.yaml";
  const { outputs } = await Tester.compile(code, {
    compilerOptions: {
      options: { "@signalwire/typespec-asyncapi": { "output-file": outPath } },
    },
  });
  const yaml = outputs["asyncapi.yaml"];
  return { doc: parse(yaml), yaml };
}
