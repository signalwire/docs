import type { DecoratorContext, Model, ModelProperty, Scalar, Type, Union } from "@typespec/compiler";

/**
 * Control which types reach an emitter — self-exclude the decorated type (no
 * arguments) or strip the given type(s) within the decorated scope.
 *
 * NOTE: hand-authored to mirror the output of `tspd gen-extern-signature`
 * (the `@typespec/tspd` codegen tool is not available in this workspace). Keep in
 * sync with `lib/decorators.tsp` — the `satisfies` check in `src/tsp-index.ts`
 * and the typed `$excludeFromEmit` impl enforce that the JS matches this shape.
 *
 * @param excludedTypes One or more types to strip from the decorated scope. Omit
 * to self-exclude the decorated type itself.
 */
export type ExcludeFromEmitDecorator = (
  context: DecoratorContext,
  target: Model | ModelProperty | Union | Scalar,
  ...excludedTypes: Type[]
) => void;

export type SignalWireEmitFilterDecorators = {
  excludeFromEmit: ExcludeFromEmitDecorator;
};
