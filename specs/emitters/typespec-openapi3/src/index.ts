import { isSelfExcluded } from "@signalwire/typespec-emit-filter";
import {
  createTypeSpecLibrary,
  navigateProgram,
  type EmitContext,
  type Program,
  type Type,
  type TypeSpecLibrary,
} from "@typespec/compiler";
import { $lib as openapi3Lib, $onEmit as openapi3Emit } from "@typespec/openapi3";

/**
 * `@typespec/openapi3` wrapped with `@signalwire/typespec-emit-filter` honoring.
 *
 * The stock OpenAPI emitter has no hook for `@excludeFromEmit`, so this emitter
 * applies the bare (self-exclusion) form before delegating: types marked
 * `@excludeFromEmit` are removed from the program in place — union variants of
 * (or arrays of) an excluded type are deleted, and a property typed as one is
 * dropped — then the stock `$onEmit` runs and emits the filtered view. A union
 * left with a single variant collapses in the stock emitter's own
 * single-member handling, and an excluded type that is no longer referenced is
 * simply never emitted as a component.
 *
 * In-place mutation is safe here because emit runs after checking completes
 * (the type graph is not frozen) and this emitter owns the whole compilation —
 * pair it with other emitters in one compilation only if they should see the
 * same filtered view.
 *
 * The scoped form `@excludeFromEmit(...types)` is NOT honored by this wrapper:
 * scoping would require cloning the subgraph per consumer, which the stock
 * emitter cannot be handed. Self-exclusion is global by definition, so
 * in-place removal matches its semantics exactly.
 */
export const $lib: TypeSpecLibrary<{}, Record<string, any>> = createTypeSpecLibrary({
  name: "@signalwire/typespec-openapi3",
  diagnostics: {},
  emitter: { options: openapi3Lib.emitter!.options as any },
});

/** True when `t` is, or is an array of, a self-excluded type. */
function isDropped(program: Program, t: Type): boolean {
  if (isSelfExcluded(program, t)) return true;
  if (t.kind === "Model" && t.name === "Array" && t.indexer) {
    return isDropped(program, t.indexer.value);
  }
  return false;
}

function stripSelfExcluded(program: Program): void {
  navigateProgram(program, {
    union(union) {
      const dropped = [...union.variants.entries()].filter(([, variant]) =>
        isDropped(program, variant.type),
      );
      for (const [key] of dropped) union.variants.delete(key);
    },
    modelProperty(property) {
      if (isDropped(program, property.type)) {
        property.model?.properties.delete(property.name);
      }
    },
  });
}

export async function $onEmit(context: EmitContext): Promise<void> {
  stripSelfExcluded(context.program);
  await openapi3Emit(context as Parameters<typeof openapi3Emit>[0]);
}
