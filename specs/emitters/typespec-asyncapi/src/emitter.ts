import { EmitContext } from "@typespec/compiler";
import { AsyncAPIEmitterOptions } from "./lib.js";

export async function $onEmit(context: EmitContext<AsyncAPIEmitterOptions>): Promise<void> {
  // Implemented in Task 8-10.
  void context;
}
