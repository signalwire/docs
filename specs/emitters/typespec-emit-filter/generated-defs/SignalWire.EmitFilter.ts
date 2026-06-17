import type { DecoratorContext, Model, ModelProperty, Type, Union } from "@typespec/compiler";

/**
 * Mark a scope so that, when emitted, the given type(s) are removed as allowed
 * values within that scope.
 *
 * NOTE: hand-authored to mirror the output of `tspd gen-extern-signature`
 * (the `@typespec/tspd` codegen tool is not available in this workspace). Keep in
 * sync with `lib/decorators.tsp` — the `satisfies` check in `src/tsp-index.ts`
 * and the typed `$excludeFromEmit` impl enforce that the JS matches this shape.
 *
 * @param excludedTypes One or more types to strip from the decorated scope.
 */
export type ExcludeFromEmitDecorator = (
  context: DecoratorContext,
  target: Model | ModelProperty | Union,
  ...excludedTypes: Type[]
) => void;

export type SignalWireEmitFilterDecorators = {
  excludeFromEmit: ExcludeFromEmitDecorator;
};
