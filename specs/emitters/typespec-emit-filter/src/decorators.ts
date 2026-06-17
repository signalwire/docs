import type { Program, Scalar, Type } from "@typespec/compiler";
import { useStateMap } from "@typespec/compiler/utils";
import type { ExcludeFromEmitDecorator } from "../generated-defs/SignalWire.EmitFilter.js";
import { EmitFilterStateKeys } from "./lib.js";

const [getExcludedTypesState, setExcludedTypes] = useStateMap<Type, Type[]>(
  EmitFilterStateKeys.excludeFromEmit,
);

/**
 * `@excludeFromEmit(...types)` — record the type(s) to strip from the decorated
 * scope. Honoring (dropping arms / properties, collapsing unions) is done by the
 * emitter at emit time via {@link getExcludedTypes} / {@link isExcludedType}.
 */
export const $excludeFromEmit: ExcludeFromEmitDecorator = (context, target, ...excludedTypes) => {
  setExcludedTypes(context.program, target, excludedTypes);
};

/** Types marked for exclusion within the scope of `target` (empty if none). */
export function getExcludedTypes(program: Program, target: Type): readonly Type[] {
  return getExcludedTypesState(program, target) ?? [];
}

/**
 * True if `t` is, or transitively extends, one of the `excluded` types. The
 * scalar base chain is walked so `scalar Foo extends SWMLVar` matches when
 * `SWMLVar` is excluded.
 */
export function isExcludedType(excluded: readonly Type[], t: Type): boolean {
  if (excluded.length === 0) return false;
  if (excluded.includes(t)) return true;
  if (t.kind === "Scalar") {
    let base: Scalar | undefined = t.baseScalar;
    while (base) {
      if (excluded.includes(base)) return true;
      base = base.baseScalar;
    }
  }
  return false;
}
