import type { Program, Scalar, Type } from "@typespec/compiler";
import { useStateMap, useStateSet } from "@typespec/compiler/utils";
import type { ExcludeFromEmitDecorator } from "../generated-defs/SignalWire.EmitFilter.js";
import { EmitFilterStateKeys } from "./lib.js";

const [getExcludedTypesState, setExcludedTypes] = useStateMap<Type, Type[]>(
  EmitFilterStateKeys.excludeFromEmit,
);

const [getSelfExcluded, setSelfExcluded] = useStateSet<Type>(EmitFilterStateKeys.selfExclude);

/**
 * `@excludeFromEmit(...types)` has two forms:
 *
 * - **No arguments** — the decorated type *itself* is excluded from emission
 *   wherever it appears (a property typed as it is dropped; a union arm of it is
 *   removed). Place it once on the source model/scalar/union instead of repeating
 *   a scoped exclusion at every consumer.
 * - **With type arguments** — record the type(s) to strip from the decorated
 *   *scope* only (model subtree / property / union arms).
 *
 * Honoring (dropping arms / properties, collapsing unions) is done by the emitter
 * at emit time via {@link getExcludedTypes} / {@link isExcludedType} (scoped) and
 * {@link isSelfExcluded} (self). Honoring is per-emitter — emitters that do not
 * recognize this decorator ignore it, leaving other outputs unaffected.
 */
export const $excludeFromEmit: ExcludeFromEmitDecorator = (context, target, ...excludedTypes) => {
  if (excludedTypes.length === 0) {
    setSelfExcluded(context.program, target);
    return;
  }
  setExcludedTypes(context.program, target, excludedTypes);
};

/**
 * True if `t` is, or transitively extends, a type marked with a bare
 * `@excludeFromEmit` (self-exclusion). The scalar base chain is walked so
 * `scalar Foo extends SWMLVar` matches when `SWMLVar` is self-excluded.
 */
export function isSelfExcluded(program: Program, t: Type): boolean {
  if (getSelfExcluded(program, t)) return true;
  if (t.kind === "Scalar") {
    let base: Scalar | undefined = t.baseScalar;
    while (base) {
      if (getSelfExcluded(program, base)) return true;
      base = base.baseScalar;
    }
  }
  return false;
}

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
