using TypeSpec.Reflection;

namespace SignalWire.EmitFilter;

/**
 * Control which types reach an emitter. Two forms:
 *
 * **Self-exclusion (no arguments)** — the decorated type *itself* is removed
 * wherever it appears: a property typed as it is dropped, and a union arm of it is
 * removed. Place it once on the source model/scalar/union instead of repeating a
 * scoped exclusion at every consumer.
 *
 * **Scoped exclusion (with type arguments)** — the given type(s) are removed as
 * allowed values within the decorated scope only. Acts as a watcher at the depth
 * it is set:
 *
 * - on a **model** it walks the whole model subtree,
 * - on a **property** it applies to that property only,
 * - on a **union** it applies to that union's arms.
 *
 * In either form, a union left with a single arm after removal collapses to that
 * bare type.
 *
 * Honoring is per-emitter: emitters that do not recognize this decorator simply
 * ignore it, so the decorated source type and other emitters' output are
 * unaffected. This lets a shared model be imported and emitted as a filtered
 * variant for one target without changing the model or any other consumer.
 *
 * @param excludedTypes One or more types to strip from the decorated scope. Omit
 * to self-exclude the decorated type itself.
 *
 * @example
 * ```typespec
 * // Self-exclusion: mark the source scalar once; every consumer drops it.
 * @excludeFromEmit
 * scalar SWMLVar extends string;
 * ```
 *
 * @example
 * ```typespec
 * // Scoped exclusion: strip SWMLVar within this model's subtree only.
 * @excludeFromEmit(SWML.Calling.SWMLVar)
 * model AiBehaviorParams {
 *   ...SWML.Calling.AIParams;
 * }
 * ```
 */
extern dec excludeFromEmit(
  target: Model | ModelProperty | Union | Scalar,
  ...excludedTypes: unknown[]
);
