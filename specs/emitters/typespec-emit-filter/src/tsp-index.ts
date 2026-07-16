import type { SignalWireEmitFilterDecorators } from "../generated-defs/SignalWire.EmitFilter.js";
import { $excludeFromEmit } from "./decorators.js";

export { $lib } from "./lib.js";

export const $decorators = {
  "SignalWire.EmitFilter": {
    excludeFromEmit: $excludeFromEmit,
  } satisfies SignalWireEmitFilterDecorators,
};
